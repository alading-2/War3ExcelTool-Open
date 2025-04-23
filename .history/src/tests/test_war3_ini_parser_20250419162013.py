#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
War3IniParser测试模块
测试War3IniParser的各项解析功能
"""

import os
import sys
import unittest
from pathlib import Path

# 添加项目根目录到Python路径
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from src.utils.war3_ini_parser import War3IniParser, parse_war3_ini_string


class TestWar3IniParser(unittest.TestCase):
    """War3IniParser测试类"""

    def setUp(self):
        self.parser = War3IniParser()
        
        # 测试用的War3 INI内容
        self.test_content = """[A007]
-- 这是注释行，会被忽略
DataF = {
"ancestralspirit",
"ancestralspirit",
"ancestralspirit",
}

-- 影响区域
Area = {1000.0, 1000.0, 1000.0}

-- 提示工具 - 普通
Tip = {
"横贯四方[|cffffcc00R|r] - [|cffffcc00 等级 1|r]",
"横贯四方[|cffffcc00R|r] - [|cffffcc00 等级 2|r]",
"横贯四方[|cffffcc00R|r] - [|cffffcc00 等级 3|r]",
}

-- 提示工具 - 学习 - 扩展
Researchubertip = [=[
斧王横扫四方，对 1000 范围内敌人造成 3 次范围伤害。
|cffffcc00 等级 1|r - 总共造成 500+5× 力量值伤害
|cffffcc00 等级 2|r - 总共造成 1000+5× 力量值伤害
|cffffcc00 等级 3|r - 总共造成 1500+5× 力量值伤害
|n|cff99ccff 作用范围：|r1000
|cff99ccff 冷却时间：|r70/60/50
|cff99ccff 魔法消耗：|r150/300/450]=]

Ubertip = {
[=[
斧王横扫四方，对 1000 范围内敌人造成 3 次范围伤害。
|n|cff99ccff 伤害：|r500+5× 力量值
|cff99ccff 作用范围：|r1000
|cff99ccff 冷却时间：|r70 秒
|cff99ccff 魔法消耗：|r150]=],
[=[
斧王横扫四方，对 1000 范围内敌人造成 3 次范围伤害。
|n|cff99ccff 伤害：|r1000+5× 力量值
|cff99ccff 作用范围：|r1000
|cff99ccff 冷却时间：|r60 秒
|cff99ccff 魔法消耗：|r300]=],
[=[
斧王横扫四方，对 1000 范围内敌人造成 3 次范围伤害。
|n|cff99ccff 伤害：|r1500+5× 力量值
|cff99ccff 作用范围：|r1000
|cff99ccff 冷却时间：|r50 秒
|cff99ccff 魔法消耗：|r450]=],
}

-- 基础命令 ID
_parent = "ANcl"

-- 效果 - 施法动作
Animnames = "Attack Walk Stand Spin"

[B008]
Name = "测试节点"
Value = 123
"""

    def test_section_parsing(self):
        """测试节点解析功能"""
        result = self.parser.parse_string(self.test_content)
        
        # 检查是否正确解析了所有节点
        self.assertIn("A007", result)
        self.assertIn("B008", result)
        
        # 检查B008节点内容
        self.assertEqual(result["B008"]["Name"], "\"测试节点\"")
        self.assertEqual(result["B008"]["Value"], "123")

    def test_array_parsing(self):
        """测试数组解析功能"""
        result = self.parser.parse_string(self.test_content)
        
        # 检查是否正确解析了数组
        self.assertIn("DataF", result["A007"])
        self.assertIn("Area", result["A007"])
        self.assertIn("Tip", result["A007"])
        
        # 检查数组内容格式
        self.assertTrue(result["A007"]["DataF"].startswith("{"))
        self.assertTrue(result["A007"]["DataF"].endswith("}"))
        self.assertTrue("ancestralspirit" in result["A007"]["DataF"])

    def test_multiline_string_parsing(self):
        """测试多行字符串解析功能"""
        result = self.parser.parse_string(self.test_content)
        
        # 检查是否正确解析了多行字符串
        self.assertIn("Researchubertip", result["A007"])
        
        # 检查多行字符串内容
        self.assertTrue(result["A007"]["Researchubertip"].startswith("[=["))
        self.assertTrue(result["A007"]["Researchubertip"].endswith("]=]"))
        self.assertTrue("斧王横扫四方" in result["A007"]["Researchubertip"])

    def test_complex_nested_structure(self):
        """测试复杂嵌套结构解析"""
        result = self.parser.parse_string(self.test_content)
        
        # 检查是否正确解析了嵌套结构
        self.assertIn("Ubertip", result["A007"])
        
        # 检查嵌套结构内容
        uber_tip = result["A007"]["Ubertip"]
        self.assertTrue(uber_tip.startswith("{"))
        self.assertTrue(uber_tip.endswith("}"))
        self.assertTrue("[=[" in uber_tip)
        self.assertTrue("]=]" in uber_tip)

    def test_comment_handling(self):
        """测试注释处理"""
        result = self.parser.parse_string(self.test_content)
        
        # 检查所有注释是否被正确忽略
        for section in result.values():
            for key in section:
                self.assertFalse(key.startswith("--"))

    def test_convenience_function(self):
        """测试便捷函数"""
        result = parse_war3_ini_string(self.test_content)
        
        # 检查便捷函数是否正常工作
        self.assertIn("A007", result)
        self.assertIn("B008", result)
        self.assertEqual(result["B008"]["Name"], "\"测试节点\"")


if __name__ == "__main__":
    unittest.main() 