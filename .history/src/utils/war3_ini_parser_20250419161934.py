#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
War3IniParser - 解析魔兽争霸3 INI/SLK格式文件的工具

该模块提供了一个简洁高效的解析器，使用正则表达式来处理War3特殊格式的INI文件。
支持解析：
- 节点定义 [Section]
- 键值对 Key = Value
- 数组定义 {value1, value2, ...}
- 多行字符串 [=[...]=]
- 注释（以 -- 开头）
"""

import re
import os
from typing import Dict, Any, List, Tuple, Optional


class War3IniParser:
    """War3特殊格式INI文件解析器"""
    
    def __init__(self):
        # 定义正则表达式模式
        # 节点模式 [Section]
        self.section_pattern = re.compile(r'^\s*\[([^\]]+)\]\s*$')
        # 键值对模式 Key = Value
        self.keyvalue_pattern = re.compile(r'^\s*([^=\s]+)\s*=\s*(.*)$')
        # 注释模式 -- Comment
        self.comment_pattern = re.compile(r'^\s*--.*$')
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
            解析后的数据结构
        """
        # 初始化结果字典
        result = {}
        
        # 初始化状态变量
        current_section = None
        current_key = None
        in_multiline = False
        multiline_value = []
        in_array = False
        array_value = []
        brace_count = 0  # 跟踪嵌套括号
        
        # 按行处理内容
        lines = content.splitlines()
        i = 0
        while i < len(lines):
            line = lines[i].rstrip()
            
            # 跳过注释行
            if self.comment_pattern.match(line):
                i += 1
                continue
            
            # 处理多行字符串模式
            if in_multiline:
                multiline_value.append(line)
                # 检查是否有结束标记
                if self.multiline_end_pattern.search(line):
                    # 多行字符串完成
                    if current_section and current_key:
                        result[current_section][current_key] = '\n'.join(multiline_value)
                    # 重置状态
                    multiline_value = []
                    in_multiline = False
                i += 1
                continue
            
            # 处理数组模式
            if in_array:
                array_value.append(line)
                
                # 计算括号数量
                brace_count += line.count("{") - line.count("}")
                
                # 检查是否数组结束
                if brace_count <= 0 and self.array_end_pattern.search(line):
                    # 数组完成
                    if current_section and current_key:
                        result[current_section][current_key] = '\n'.join(array_value)
                    # 重置状态
                    array_value = []
                    in_array = False
                    brace_count = 0
                i += 1
                continue
            
            # 节点匹配 [Section]
            section_match = self.section_pattern.match(line)
            if section_match:
                current_section = section_match.group(1)
                if current_section not in result:
                    result[current_section] = {}
                i += 1
                continue
            
            # 键值对匹配 Key = Value
            keyvalue_match = self.keyvalue_pattern.match(line)
            if keyvalue_match and current_section:
                current_key = keyvalue_match.group(1)
                current_value = keyvalue_match.group(2).strip()
                
                # 检查是否为多行字符串开始
                if self.multiline_start_pattern.search(current_value):
                    in_multiline = True
                    multiline_value = [current_value]
                    i += 1
                    continue
                
                # 检查是否为数组开始
                if self.array_start_pattern.match(current_value):
                    in_array = True
                    array_value = [current_value]
                    brace_count = current_value.count("{") - current_value.count("}")
                    
                    # 如果数组在同一行结束
                    if brace_count <= 0 and self.array_end_pattern.search(current_value):
                        in_array = False
                        result[current_section][current_key] = current_value
                        brace_count = 0
                    i += 1
                    continue
                
                # 普通键值对
                if current_value:
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
            data: 解析后的数据结构
            
        Returns:
            INI格式的字符串
        """
        lines = []
        
        for section, section_data in data.items():
            lines.append(f"[{section}]")
            lines.append("")
            
            for key, value in section_data.items():
                lines.append(f"{key} = {value}")
            
            lines.append("")
        
        return "\n".join(lines)


def parse_war3_ini(file_path: str) -> Dict[str, Dict[str, Any]]:
    """
    解析War3 INI文件的便捷函数
    
    Args:
        file_path: INI文件路径
        
    Returns:
        解析后的数据结构
    """
    parser = War3IniParser()
    return parser.parse_file(file_path)


def parse_war3_ini_string(content: str) -> Dict[str, Dict[str, Any]]:
    """
    解析War3 INI字符串的便捷函数
    
    Args:
        content: INI内容字符串
        
    Returns:
        解析后的数据结构
    """
    parser = War3IniParser()
    return parser.parse_string(content) 