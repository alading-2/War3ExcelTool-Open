# src/core/ini_parser.py
# Ini文件解析器模块

# 导入必要的库
from ast import Dict
import configparser
import re
from typing import Optional, Dict, Any, List
import logging
import os

# 新增物编类型映射常量
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
    """自定义的War3 INI解析器，用于处理魔兽争霸3的物编INI格式"""
    
    def __init__(self):
        self.sections = {}
        self.logger = logger
        
    def read_file(self, f, source=None):
        """读取并解析War3 INI文件"""
        content = f.read()
        
        # 移除--开头的注释行
        lines = [line for line in content.split('\n') if not line.strip().startswith('--')]
        
        current_section = None
        buffer = []
        in_multiline = False
        multiline_start = None
        
        for line in lines:
            line = line.strip()
            if not line:
                continue
                
            # 处理节名
            if line.startswith('[') and line.endswith(']'):
                if current_section and buffer:
                    self._process_buffer(current_section, buffer)
                current_section = line[1:-1]
                buffer = []
                continue
            
            # 处理多行字符串
            if not in_multiline:
                if '=' in line:
                    key, value = line.split('=', 1)
                    key = key.strip()
                    value = value.strip()
                    
                    if value.startswith('{') and not value.endswith('}'):
                        in_multiline = True
                        multiline_start = '{'
                        buffer.append((key, [value]))
                    elif value.startswith('[=[') and not value.endswith(']=]'):
                        in_multiline = True
                        multiline_start = '[=['
                        buffer.append((key, [value]))
                    else:
                        buffer.append((key, value))
            else:
                if multiline_start == '{' and line.endswith('}'):
                    buffer[-1][1].append(line)
                    in_multiline = False
                    # 处理多行数组，去掉逗号
                    lines = [l.strip().rstrip(',') for l in buffer[-1][1]]
                    buffer[-1] = (buffer[-1][0], ' '.join(lines))
                elif multiline_start == '[=[' and line.endswith(']=]'):
                    buffer[-1][1].append(line)
                    in_multiline = False
                    # 保持原样输出[=[...]=]格式
                    buffer[-1] = (buffer[-1][0], '\n'.join(buffer[-1][1]))
                else:
                    buffer[-1][1].append(line)
        
        # 处理最后一个section
        if current_section and buffer:
            self._process_buffer(current_section, buffer)
    
    def _process_buffer(self, section, buffer):
        """处理缓冲区中的数据并添加到sections字典中"""
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
        """返回指定节中的所有键值对"""
        return list(self.sections.get(section, {}).items())
    
    def get(self, section, option):
        """获取指定节中的指定选项值"""
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
        # 获取当前模块的 logger 实例
        self.logger = logger
        
    def parse_ini(self, path: str) -> Any:
        """解析指定路径的INI文件"""
        try:
            with open(path, 'r', encoding='utf-8-sig') as f:
                self.config.read_file(f, path)
            return self.config
        except Exception as e:
            self.logger.error(f"解析INI文件 {path} 时出错: {e}", exc_info=True)
            return None
    
    @staticmethod
    def detect_ini_type(filename: str) -> Optional[str]:
        """通过文件名检测物编类型"""
        filename_lower = filename.lower()
        for obj_type, keywords in OBJECT_TYPE_MAPPING.items():
            if any(kw in filename_lower for kw in keywords):
                return obj_type
        return None