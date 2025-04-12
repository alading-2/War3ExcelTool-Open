import unittest
import pandas as pd
from src.core.data_handler import ExcelTable


class TestExcelTable(unittest.TestCase):
    """ExcelTable类的测试用例。"""

    def setUp(self):
        """设置测试数据。"""
        # 创建一个模拟的DataFrame，类似于从Excel读取的数据
        data = [
            ["Comment1", "Comment2", "Comment3", "", "Comment5"],  # 第0行: 注释
            ["key1", "key2", "key3", "", "key5"],  # 第1行: 键名
            [1, "a", True, "ignore", 10.5],  # 第2行: 数据行1
            [2, "b", False, "ignore", 20.5],  # 第3行: 数据行2
            ["//", "comment", "row", "ignore", "skip"],  # 第4行: 注释行(应被跳过)
            [None, None, None, None, None],  # 第5行: 空行(应被跳过)
            [3, "c", True, "ignore", 30.5],  # 第6行: 数据行3
        ]
        self.raw_df = pd.DataFrame(data)
        self.excel_table = ExcelTable(self.raw_df)

    def test_initialization(self):
        """测试ExcelTable是否正确初始化。"""
        # 检查维度
        self.assertEqual(self.excel_table.shape(), (3, 4))  # 3个有效数据行，4个有效列
        self.assertEqual(self.excel_table.num_rows, 3)
        self.assertEqual(self.excel_table.num_cols, 4)

        # 检查column_info是否正确创建
        self.assertEqual(len(self.excel_table.column_info), 4)
        self.assertTrue("key1" in self.excel_table.column_info)
        self.assertTrue("key2" in self.excel_table.column_info)
        self.assertTrue("key3" in self.excel_table.column_info)
        self.assertTrue("key5" in self.excel_table.column_info)

        # 检查注释是否正确存储
        self.assertEqual(self.excel_table.column_info["key1"].comment, "Comment1")
        self.assertEqual(self.excel_table.column_info["key5"].comment, "Comment5")

    def test_get_cell(self):
        """测试获取单元格值。"""
        self.assertEqual(self.excel_table.get_value(0, 0), 1)
        self.assertEqual(self.excel_table.get_value(1, 1), "b")
        self.assertEqual(self.excel_table.get_value(2, 3), 30.5)

        # 测试无效索引
        with self.assertRaises(IndexError):
            self.excel_table.get_value(3, 0)  # 行索引过高
        with self.assertRaises(IndexError):
            self.excel_table.get_value(0, 4)  # 列索引过高

    def test_get_row(self):
        """测试获取整行数据。"""
        row0 = self.excel_table.get_rowvalues_byindex(0)
        self.assertEqual(len(row0), 4)
        self.assertEqual(row0["key1"], 1)
        self.assertEqual(row0["key3"], True)

    def test_get_col(self):
        """测试通过索引获取列。"""
        col0 = self.excel_table.get_col(0)
        self.assertEqual(len(col0), 3)
        self.assertEqual(col0.iloc[0], 1)
        self.assertEqual(col0.iloc[2], 3)

    def test_get_col_by_key(self):
        """测试通过键名获取列。"""
        col2 = self.excel_table.get_col_by_key("key2")
        self.assertEqual(len(col2), 3)
        self.assertEqual(col2.iloc[0], "a")
        self.assertEqual(col2.iloc[1], "b")

        # 测试无效键名
        with self.assertRaises(KeyError):
            self.excel_table.get_col_by_key("non_existent_key")

    def test_iterrows(self):
        """测试遍历行。"""
        row_count = 0
        for idx, row in self.excel_table.for_rows():
            row_count += 1
            # 检查第一行的值
            if idx == 0:
                self.assertEqual(row["key1"], 1)
                self.assertEqual(row["key2"], "a")

        self.assertEqual(row_count, 3)  # 应该有3个有效行

    def test_get_column_info(self):
        """测试通过键名获取列信息。"""
        col_info = self.excel_table.get_column_info("key3")
        self.assertIsNotNone(col_info)
        self.assertEqual(col_info.key, "key3")
        self.assertEqual(col_info.comment, "Comment3")

        # 不存在的键名应返回None
        self.assertIsNone(self.excel_table.get_column_info("non_existent_key"))

    def test_get_all_column_info(self):
        """测试获取所有列信息。"""
        all_info = self.excel_table.get_all_column_info()
        self.assertEqual(len(all_info), 4)

        # 检查是否为副本
        all_info["new_key"] = "test"
        self.assertNotIn("new_key", self.excel_table.column_info)


if __name__ == "__main__":
    unittest.main()
