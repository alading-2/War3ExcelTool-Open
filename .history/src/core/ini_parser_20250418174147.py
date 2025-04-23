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

logger = logging.getLogger(__name__)

class War3IniParser:
    """
    自定义的War3 INI解析器，专门用于处理魔兽争霸3的物编INI格式。
    支持处理特殊的多行字符串格式，包括数组格式{...}和字符串格式[=[...]=]。
    
    主要功能：
    1. 解析War3物编INI文件的节(Section)和键值对
    2. 支持处理多行数组和多行字符串
    3. 提供节和键值对的访问接口
    """
    
    def __init__(self):
        # 存储所有节及其对应的键值对
        self.sections = {}
        self.logger = logger
        
    def read_file(self, f, source=None):
        """
        读取并解析War3 INI文件。
        
        Args:
            f: 文件对象，必须以文本模式打开
            source: 可选的源文件标识符
            
        处理流程：
        1. 读取文件内容并移除注释行
        2. 解析节名和键值对
        3. 处理特殊的多行字符串格式
        """
        content = f.read()
        
        # 移除--开头的注释行
        lines = [line for line in content.split('\n') if not line.strip().startswith('--')]
        
        # 初始化解析状态
        current_section = None  # 当前正在处理的节名
        buffer = []            # 临时存储当前节的键值对
        in_multiline = False   # 是否正在处理多行字符串
        multiline_start = None # 多行字符串的起始标记
        
        for line in lines:
            line = line.strip()
            if not line:
                continue
                
            # 处理节名，格式为[节名]
            if line.startswith('[') and line.endswith(']'):
                if current_section and buffer:
                    self._process_buffer(current_section, buffer)
                current_section = line[1:-1]
                buffer = []
                continue
            
            # 处理键值对和多行字符串
            if not in_multiline:
                if '=' in line:
                    key, value = line.split('=', 1)
                    key = key.strip()
                    value = value.strip()
                    
                    # 检测多行数组格式 {...}
                    if value.startswith('{') and not value.endswith('}'):
                        in_multiline = True
                        multiline_start = '{'
                        buffer.append((key, [value]))
                    # 检测多行字符串格式 [=[...]=]
                    elif value.startswith('[=[') and not value.endswith(']=]'):
                        in_multiline = True
                        multiline_start = '[=['
                        buffer.append((key, [value]))
                    else:
                        buffer.append((key, value))
            else:
                # 处理多行数组的结束
                if multiline_start == '{' and line.endswith('}'):
                    buffer[-1][1].append(line)
                    in_multiline = False
                    # 处理多行数组，去掉每行末尾的逗号并合并为单行
                    lines = [l.strip().rstrip(',') for l in buffer[-1][1]]
                    buffer[-1] = (buffer[-1][0], ' '.join(lines))
                # 处理多行字符串的结束
                elif multiline_start == '[=[' and line.endswith(']=]'):
                    buffer[-1][1].append(line)
                    in_multiline = False
                    # 保持多行字符串的原始格式
                    buffer[-1] = (buffer[-1][0], '\n'.join(buffer[-1][1]))
                else:
                    buffer[-1][1].append(line)
        
        # 处理最后一个section的数据
        if current_section and buffer:
            self._process_buffer(current_section, buffer)
    
    def _process_buffer(self, section, buffer):
        """
        处理缓冲区中的数据并添加到sections字典中。
        
        Args:
            section: 节名
            buffer: 包含键值对的缓冲区列表
        """
        if section not in self.sections:
            self.sections[section] = {}
            
        for key, value in buffer:
            if isinstance(value, list):
                value = '\n'.join(value)
            self.sections[section][key] = value
    
    def sections(self):
        """返回所有节名的列表"""
        return list(self.sections.keys())
    
    def items(self, section):
        """
        返回指定节中的所有键值对
        
        Args:
            section: 节名
            
        Returns:
            List[Tuple]: 包含键值对的列表
        """
        return list(self.sections.get(section, {}).items())
    
    def get(self, section, option):
        """
        获取指定节中的指定选项值
        
        Args:
            section: 节名
            option: 选项名
            
        Returns:
            str: 选项值，如果不存在则返回None
        """
        return self.sections.get(section, {}).get(option)

class IniParser:
    """
    用于解析 INI 配置文件的类。
    """
    
    def __init__(self):
        """
        初始化 IniParser 实例。
        创建一个 configparser 对象，并设置保留原始键的大小写。
        获取一个 logger 实例用于记录日志。
        """
        self.config = configparser.ConfigParser(strict=False) # 允许重复键
        # 设置 configparser 保留 INI 文件中选项键的原始大小写，
        # 默认情况下 configparser 会将所有键转换为小写。
        self.config.optionxform = str
        self.logger = logger
        
    def parse_ini(self, path: str) -> Any:
        """
        解析指定路径的INI文件。

        Args:
            path (str): INI文件的完整路径

        Returns:
            ConfigParser: 解析后的配置对象
            None: 如果文件不存在、为空或解析出错

        异常处理：
        - FileNotFoundError: 文件不存在
        - MissingSectionHeaderError: 文件缺少节头
        - 其他解析错误
        """
        try:
            # 使用utf-8-sig编码读取文件，处理带BOM的文件
            with open(path, 'r', encoding='utf-8-sig') as f:
                self.config.read_file(f, path)
            
            # 验证文件是否包含有效的节
            if not self.config.sections():
                self.logger.error(f"文件没有有效的节: {path}")
                return None

            self.logger.info(f"成功读取INI文件: {path}")
            return self.config

        except FileNotFoundError:
            self.logger.error(f"找不到文件: {path}")
            return None
        except configparser.MissingSectionHeaderError as e:
            self.logger.error(f"文件缺少节头 (Section Header): {path}", exc_info=True)
            return None
        except Exception as e:
            self.logger.error(f"解析INI文件 {path} 时出错: {e}", exc_info=True)
            return None

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