#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Excel工具测试模块
测试Excel文件操作相关的工具函数
"""

import os
import sys
import shutil
import unittest
from pathlib import Path

# 添加项目根目录到Python路径
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from src.utils.excel_utils import ensure_excel_file_closed


class TestExcelUtils(unittest.TestCase):
    """Excel工具测试类"""

    def setUp(self):
        """测试前准备工作"""
        # 创建测试目录
        self.test_dir = Path(__file__).parent / "test_data"
        self.test_dir.mkdir(exist_ok=True)
        
        # 测试文件路径
        self.test_file = self.test_dir / "test_excel.xlsx"
        
        # 检查是否存在测试用的Excel模板文件
        resource_dir = Path(__file__).parent.parent.parent / "resource" / "resource"
        template_file = resource_dir / "物编.xlsx"
        
        if template_file.exists():
            # 复制模板文件作为测试文件
            shutil.copy(template_file, self.test_file)
        else:
            # 如果没有模板文件，则创建一个空的Excel文件
            import pandas as pd
            df = pd.DataFrame({'A': [1, 2, 3], 'B': [4, 5, 6]})
            df.to_excel(self.test_file, index=False)
    
    def tearDown(self):
        """测试后清理工作"""
        # 删除测试文件
        if self.test_file.exists():
            try:
                os.remove(self.test_file)
            except PermissionError:
                print(f"警告: 无法删除测试文件 {self.test_file}，可能仍被占用")
        
        # 尝试删除测试目录
        try:
            self.test_dir.rmdir()
        except (OSError, PermissionError):
            print(f"警告: 无法删除测试目录 {self.test_dir}")

    def test_ensure_excel_file_closed(self):
        """测试确保Excel文件关闭的功能"""
        # 确保文件存在
        self.assertTrue(self.test_file.exists(), "测试文件不存在")
        
        # 测试函数在文件未被打开时的行为
        try:
            ensure_excel_file_closed(str(self.test_file))
            # 如果能执行到这里，表示函数没有抛出异常
            self.assertTrue(True, "文件未打开时函数正常执行")
        except Exception as e:
            self.fail(f"文件未打开时函数抛出了异常: {e}")
        
        # 输出测试成功信息
        print(f"测试成功: 确保Excel文件关闭功能正常工作")


if __name__ == "__main__":
    unittest.main() 