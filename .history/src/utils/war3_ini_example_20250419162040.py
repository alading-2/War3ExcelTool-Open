#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
War3IniParser使用示例

展示如何使用War3IniParser解析War3格式的INI文件
"""

import os
import sys
import json
from pathlib import Path

# 添加项目根目录到Python路径
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from src.utils.war3_ini_parser import War3IniParser, parse_war3_ini_string


def main():
    """War3IniParser使用示例主函数"""
    
    # War3 INI内容示例
    war3_ini_content = """[A007]
-- 这是注释行，会被忽略
DataF = {
"ancestralspirit",
"ancestralspirit",
"ancestralspirit",
}

-- 影响区域
Area = {1000.0, 1000.0, 1000.0}

-- 提示工具 - 学习 - 扩展
Researchubertip = [=[
斧王横扫四方，对 1000 范围内敌人造成 3 次范围伤害。
|cffffcc00 等级 1|r - 总共造成 500+5× 力量值伤害
|cffffcc00 等级 2|r - 总共造成 1000+5× 力量值伤害
|cffffcc00 等级 3|r - 总共造成 1500+5× 力量值伤害]=]

-- 基础命令 ID
_parent = "ANcl"
"""
    
    print("=== War3 INI 内容 ===")
    print(war3_ini_content)
    print("\n")
    
    # 使用解析器解析内容
    parser = War3IniParser()
    result = parser.parse_string(war3_ini_content)
    
    print("=== 解析结果 ===")
    print(json.dumps(result, indent=2, ensure_ascii=False))
    print("\n")
    
    # 使用解析结果
    print("=== 使用解析结果 ===")
    if "A007" in result:
        print(f"节点 A007 的基础命令ID: {result['A007']['_parent']}")
        
        # 检查并输出DataF数组
        if "DataF" in result["A007"]:
            print(f"DataF 数组内容: {result['A007']['DataF']}")
        
        # 检查并输出多行字符串
        if "Researchubertip" in result["A007"]:
            print(f"多行字符串内容长度: {len(result['A007']['Researchubertip'])} 字符")
            print(f"多行字符串前50个字符: {result['A007']['Researchubertip'][:50]}...")
    
    # 展示如何从文件解析（如果有文件）
    ini_file_path = os.path.join(os.path.dirname(__file__), "example.ini")
    if os.path.exists(ini_file_path):
        print("\n=== 从文件解析 ===")
        file_result = parser.parse_file(ini_file_path)
        print(f"从文件解析结果: {len(file_result)} 个节点")
    else:
        # 创建示例文件
        print("\n=== 创建示例文件 ===")
        with open(ini_file_path, "w", encoding="utf-8") as f:
            f.write(war3_ini_content)
        print(f"示例文件已创建: {ini_file_path}")
        print("下次运行时将解析此文件")
    
    # 展示便捷函数用法
    print("\n=== 使用便捷函数 ===")
    easy_result = parse_war3_ini_string(war3_ini_content)
    print(f"便捷函数解析结果包含 {len(easy_result)} 个节点")


if __name__ == "__main__":
    main() 