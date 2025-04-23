# src/core/ini_parser.py
# Ini文件解析器模块

# 导入必要的库
from ast import Dict
import configparser
import re
from typing import Optional, Dict, Any, List
import logging
import os

# 物编类型映射常量，用于识别不同类型的物编文件
OBJECT_TYPE_MAPPING = {
    'unit': ['单位', 'unit'],
    'item': ['物品', 'item'],
    'ability': ['技能', 'ability'],
    'buff': ['buff'],
    'destructable': ['可破坏物', 'destructable'],
    'upgrade': ['科技', 'upgrade']
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

    def __init__(self):
        """初始化解析器，编译正则表达式模式"""
        # 节点模式 [Section]
        self.section_pattern = re.compile(r'^\s*\[([^\]]+)\]\s*$')
        # 键值对模式 Key = Value
        self.keyvalue_pattern = re.compile(r'^\s*([^=\s]+)\s*=\s*(.*)$')
        # 注释模式 -- Comment
        self.comment_pattern = re.compile(r'^\s*[-/#]{1,2}.*$')
        # 多行字符串开始模式 [=[
        self.multiline_start_pattern = re.compile(r'\[=\[')
        # 多行字符串结束模式 ]=]
        self.multiline_end_pattern = re.compile(r'\]=\]')
        # 数组开始模式 {
        self.array_start_pattern = re.compile(r'^\s*{')
        # 数组结束模式 }
        self.array_end_pattern = re.compile(r'}\s*$')

    def parse_file(self, file_path: str) -> Dict[str, Dict[str, Any]]:
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

    def parse_string(self, content: str) -> Dict[str, Dict[str, Any]]:
        """
        解析War3 INI字符串内容
        
        Args:
            content: INI文件内容字符串
            
        Returns:
            解析后的数据结构，格式为 {section: {key: value, ...}, ...}
        """
        # 初始化结果字典
        result = {}

        # 初始化状态变量
        current_comment = None  #当前注释
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
            if self.comment_pattern.search(line):
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
                if current_section not in result:
                    result[current_section] = {}
                i += 1
                continue

            # 键值对匹配 Key = Value
            keyvalue_match = self.keyvalue_pattern.search(line)
            if keyvalue_match and current_section:
                current_key = keyvalue_match.group(1)
                current_value = keyvalue_match.group(2).strip()

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
                result[current_section][current_key] = current_value
                i += 1
                continue

            # 未匹配到任何模式，继续下一行
            i += 1

        return result

    def to_string(self, data: Dict[str, Dict[str, Any]]) -> str:
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
    def parse_ini(file_path: str) -> Dict[str, Dict[str, Any]]:
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


class IniParser:
    """
    通用Ini文件解析器
    
    支持魔兽争霸3的Ini文件格式，可以处理标准ini文件。
    """

    def __init__(self):
        """初始化解析器，创建ConfigParser实例"""
        self.config = configparser.ConfigParser(strict=False)  # 允许重复键
        # 魔兽争霸3的ini文件可能包含重复的section和key，我们需要处理
        self.config.optionxform = str  # 保持键名的大小写
        self.logger = logging.getLogger(__name__)

    def parse_ini(self, path: str) -> Dict[str, Dict[str, Any]]:
        """
        解析标准ini文件并返回字典格式的结果
        
        Args:
            path: ini文件路径
            
        Returns:
            包含ini文件内容的字典，格式为{section: {key: value}}
        """
        try:
            self.config.read(path, encoding='utf-8')
            result = {}

            # 将ConfigParser对象转换为字典
            for section in self.config.sections():
                result[section] = {}
                for key, value in self.config.items(section):
                    result[section][key] = value

            return result
        except Exception as e:
            logging.error(f"解析ini文件'{path}'失败: {e}")
            return {}

    def data_add(self, other_parser: configparser.ConfigParser) -> None:
        """
        合并另一个ConfigParser对象的数据到当前对象。
        
        Args:
            other_parser: 要合并的ConfigParser对象
            
        处理规则：
        1. 如果节已存在，则跳过并记录警告
        2. 如果节不存在，则添加整个节及其所有键值对
        """
        for section in other_parser.sections():
            if self.config.has_section(section):
                self.logger.warning(f"发现重复Section: {section}，已跳过")
                continue

            self.config.add_section(section)
            for key, value in other_parser.items(section):
                self.config.set(section, key, value)

    @staticmethod
    def detect_ini_type(filename: str) -> Optional[str]:
        """
        通过文件名检测物编类型。
        
        Args:
            filename: 文件名
            
        Returns:
            str: 检测到的物编类型（unit/item/ability/buff/destructable/upgrade）
            None: 如果未检测到匹配的类型
        """
        filename_lower = filename.lower()
        for obj_type, keywords in OBJECT_TYPE_MAPPING.items():
            if any(kw in filename_lower for kw in keywords):
                return obj_type
        return None
