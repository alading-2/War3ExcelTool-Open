# src/core/ini_parser.py
# Ini文件解析器模块

# 导入必要的库
from ast import Dict
import configparser
import re
from typing import Optional, Dict, Any, List, Tuple
import logging
import os

# 物编类型映射常量，用于识别不同类型的物编文件
OBJECT_TYPE_MAPPING = {
    'unit': ['单位', 'unit'],
    'item': ['物品', 'item'],
    'ability': ['技能', 'ability'],
    'buff': ['魔法效果', 'buff'],
    'destructable': ['可破坏物', 'destructable'],
    'upgrade': ['科技', 'upgrade'],
    'doodad': ['装饰物', 'doodad']
}


class War3IniParser:
    """
    War3特殊格式INI文件解析器
    
    该解析器专门用于解析魔兽争霸3中使用的特殊INI格式，包括:
    - 支持区块 [Section]
    - 支持键值对 Key = Value
    - 支持数组 {value1, value2, ...}
    - 支持多行字符串 [=[...]=]
    - 忽略以 -- 开头的注释行
    """

    # section不重复，若重复后面自动加_
    # is_section_no_repetition: bool = False

    def __init__(self, *a, **b):
        """初始化解析器，编译正则表达式模式"""
        # 节点模式 [Section]
        self.section_pattern = re.compile(r'^\s*\[([^\]]+)\]\s*$')
        # 键值对模式 Key = Value
        self.keyvalue_pattern = re.compile(r'^\s*([^=\s]+)\s*=\s*(.*)$')
        # 注释模式 -- Comment
        # 以-/#开头，至少一个
        self.comment_pattern = re.compile(r'^\s*[-/#]{1,}\s*(\S*)')
        # 多行字符串开始模式 [=[
        self.multiline_start_pattern = re.compile(r'\[=\[')
        # 多行字符串结束模式 ]=]
        self.multiline_end_pattern = re.compile(r'\]=\]')
        # 数组开始模式 {
        self.array_start_pattern = re.compile(r'^\s*{')
        # 数组结束模式 }
        self.array_end_pattern = re.compile(r'}\s*$')
        self.logger = logging.getLogger(__name__)
        # 重复的section是否后面加_使其不重复
        if b:
            self.is_section_no_repetition = b.get("is_section_no_repetition",
                                                  False)

    def parse_file(self, file_path: str) -> Dict[str, Any]:
        """
        解析War3 INI文件并返回解析结果
        
        Args:
            file_path: INI文件路径
            
        Returns:
            解析后的数据结构，格式为 {section: {key: value, ...}, ...}
            
        Raises:
            FileNotFoundError: 如果指定的文件不存在
        """
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"找不到文件: {file_path}")

        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        return self.parse_string(content)

    def parse_string(self, content: str) -> Dict[str, Any]:
        """
        解析War3 INI字符串内容
        
        Args:
            content: INI文件内容字符串
            
        Returns:
            解析后的数据结构，格式为 {section: {key: value, ...}, ...}
        """
        # 输出结果集合
        allresult_dict = {}

        # 初始化数据字典
        result = {}
        # 注释字典
        comment_dict = {}
        current_comment = None  #当前注释
        # 顺序字典，记录section内键的顺序
        order_dict = {}
        current_order_list = []

        # 初始化状态变量
        current_section = None  # 当前正在处理的节点名称
        current_key = None  # 当前正在处理的键名
        in_multiline = False  # 是否正在处理多行字符串
        multiline_value = []  # 存储多行字符串的各行内容
        in_array = False  # 是否正在处理数组
        array_value = []  # 存储数组的各行内容
        brace_count = 0  # 跟踪嵌套括号的数量，用于确定数组何时结束

        # 按行处理内容
        lines = content.splitlines()

        i = 0
        while i < len(lines):
            line = lines[i].rstrip()
            # 路径换成两个\\
            re.sub(r"\\+", r"\\", line)

            # 跳过注释行
            comment_match = self.comment_pattern.search(line)
            if comment_match:
                current_comment = comment_match.group(1)
                i += 1
                continue

            # 处理多行字符串模式
            if in_multiline:
                # 去掉双引号（仅多行字符串）
                line = line.replace(r'"', "")
                multiline_value.append(line)
                # 检查是否有结束标记
                if self.multiline_end_pattern.search(line):
                    # 多行字符串完成
                    if current_section and current_key:
                        result[current_section][current_key] = '\n'.join(
                            multiline_value)
                    # 重置状态
                    multiline_value = []
                    in_multiline = False
                i += 1
                continue

            # 处理数组模式
            if in_array:
                array_value.append(line)

                # 计算括号数量
                open_braces = line.count("{")
                close_braces = line.count("}")
                brace_count += open_braces - close_braces

                # 检查是否数组结束
                if brace_count <= 0 and self.array_end_pattern.search(line):
                    # 数组完成
                    if current_section and current_key:
                        result[current_section][current_key] = '\n'.join(
                            array_value)
                    # 重置状态
                    array_value = []
                    in_array = False
                    brace_count = 0
                i += 1
                continue

            # 节点匹配 [Section]
            section_match = self.section_pattern.search(line)
            if section_match:
                current_section = section_match.group(1)
                if current_section in result:
                    self.logger.warning(f"发现重复Section: {current_section}，已跳过")
                    if self.is_section_no_repetition:
                        # 编辑器中英文映射生成测试，重复Section后面加_，直到不重复
                        while current_section in result:
                            current_section = current_section + "_"
                    else:
                        current_section = None
                if current_section:
                    result[current_section] = {}
                    order_dict[current_section] = []
                    current_order_list = []
                i += 1
                continue

            # 键值对匹配 Key = Value
            keyvalue_match = self.keyvalue_pattern.search(line)
            if keyvalue_match and current_section:
                current_key = keyvalue_match.group(1)
                current_value = keyvalue_match.group(2).replace(r' ', "")

                # 检查是否为空值
                if not current_value:
                    result[current_section][current_key] = ""
                    i += 1
                    continue

                # 检查是否为多行字符串开始
                if self.multiline_start_pattern.search(current_value):
                    multiline_depth = 0
                    for j in range(len(current_value)):
                        if current_value[j:j + 3] == "[=[":
                            multiline_depth += 1
                        if current_value[j:j + 3] == "]=]":
                            multiline_depth -= 1
                    # 去掉双引号（仅多行字符串）
                    current_value = current_value.replace(r'"', "")
                    # 如果多行字符串在同一行完成
                    if multiline_depth == 0 and self.multiline_end_pattern.search(
                            current_value):
                        result[current_section][current_key] = current_value
                    else:
                        in_multiline = True
                        multiline_value = [current_value]
                    i += 1
                    continue

                # 检查是否为数组开始
                if self.array_start_pattern.search(current_value):
                    # 计算括号数量
                    open_braces = current_value.count("{")
                    close_braces = current_value.count("}")
                    brace_count = open_braces - close_braces

                    # 如果数组在同一行结束
                    if brace_count <= 0 and self.array_end_pattern.search(
                            current_value):
                        result[current_section][current_key] = current_value
                    else:
                        in_array = True
                        array_value = [current_value]
                    i += 1
                    continue

                # 普通键值对
                # 去掉双引号
                current_value = current_value.replace(r'"', "")
                # 如果注释不为空，则添加到注释字典
                if current_comment:
                    comment_dict[current_key] = current_comment
                    current_comment = None
                # 添加到结果字典
                result[current_section][current_key] = current_value
                # 顺序字典
                if current_key not in current_order_list:
                    current_order_list.append(current_key)
                    order_dict[current_section] = current_order_list
                i += 1
                continue

            # 未匹配到任何模式，继续下一行
            i += 1
        allresult_dict["content"] = content[:]  #文件字符串
        allresult_dict["data"] = result  #数据
        allresult_dict["comment"] = comment_dict  #注释
        allresult_dict["order"] = order_dict  #顺序

        return allresult_dict

    @staticmethod
    def to_string(data: Dict[str, Dict[str, Any]]) -> str:
        """
        将解析后的数据结构转换回INI字符串
        
        Args:
            data: 解析后的数据结构，格式为 {section: {key: value, ...}, ...}
            
        Returns:
            INI格式的字符串
        """
        lines = []

        for section, section_data in data.items():
            lines.append(f"[{section}]")

            for key, value in section_data.items():
                lines.append(f"{key} = {value}")

            lines.append("")

        return "\n".join(lines)

    @staticmethod
    def parse_ini(file_path: str) -> Dict[str, Any]:
        """
        解析War3 INI文件的便捷函数
        
        Args:
            file_path: INI文件路径
            
        Returns:
            解析后的数据结构，格式为 {section: {key: value, ...}, ...}
            
        Raises:
            FileNotFoundError: 如果指定的文件不存在
        """
        parser = War3IniParser()
        return parser.parse_file(file_path)

    @staticmethod
    def parse_ini_string(content: str) -> Dict[str, Dict[str, Any]]:
        """
        解析War3 INI字符串的便捷函数
        
        Args:
            content: INI内容字符串
            
        Returns:
            解析后的数据结构，格式为 {section: {key: value, ...}, ...}
        """
        parser = War3IniParser()
        return parser.parse_string(content)

    @staticmethod
    def detect_ini_type(name: str) -> Optional[str]:
        """
        通过文件名/sheet名检测物编类型。
        
        Args:
            name: name
            
        Returns:
            str: 检测到的物编类型（unit/item/ability/buff/destructable/upgrade）
            None: 如果未检测到匹配的类型
        """
        name_lower = name.lower()
        for obj_type, keywords in OBJECT_TYPE_MAPPING.items():
            if any(kw in name_lower for kw in keywords):
                return obj_type
        return None
