import os
import pytest
import pandas as pd
from src.core.excel_parser import ExcelParser

# 测试数据目录
TEST_DATA_DIR = os.path.join(os.path.dirname(__file__), "test_data")


class TestExcelParser:
    """测试Excel解析模块"""

    def setup_method(self):
        """每个测试方法的设置"""
        self.parser = ExcelParser()

        # 确保测试数据目录存在
        os.makedirs(TEST_DATA_DIR, exist_ok=True)

        # 创建测试Excel文件
        self.create_test_excel()
        print("test")

    def create_test_excel(self):
        """创建测试用的Excel文件"""
        # 测试数据
        data = {
            "Column1": ["注释1", "id", 1, 2, "//3", 4],
            "Column2": ["注释2", "name", "Alice", "Bob", "Charlie", "David"],
            "Column3": ["注释3", "age", 25, 30, 35, 40],
            "Column4": ["注释4", "active", True, False, "", True]
        }

        # 创建DataFrame
        df = pd.DataFrame(data)

        # 保存为Excel
        test_file = os.path.join(TEST_DATA_DIR, "test.xlsx")
        df.to_excel(test_file, index=False)

        self.test_file = test_file

    def test_parse_excel(self):
        """测试Excel解析功能"""
        # 解析测试文件
        metadata, keys, data_rows, color_map = self.parser.parse_excel(
            self.test_file)

        # 验证元数据
        assert "comments" in metadata
        assert "keys" in metadata
        assert "filename" in metadata
        assert metadata["filename"] == "test.xlsx"

        # 验证键列表
        assert keys == ["name", "age", "active"]

        # 验证数据行
        assert len(data_rows) == 3  # 忽略了注释行

        # 验证第一行数据
        assert data_rows[0]["id"] == 1
        assert data_rows[0]["name"] == "Alice"
        assert data_rows[0]["age"] == 25
        assert data_rows[0]["active"] is True

        # 验证空数据处理
        assert "active" not in data_rows[2]  # 空单元格被忽略
