import unittest
import pandas as pd
from src.core.data_handler import ExcelTable


class TestExcelTable(unittest.TestCase):
    """Test cases for the ExcelTable class."""

    def setUp(self):
        """Set up test data."""
        # Create a mock DataFrame similar to what would be read from Excel
        data = [
            ["Comment1", "Comment2", "Comment3", "", "Comment5"],  # Row 0: Comments
            ["key1", "key2", "key3", "", "key5"],                   # Row 1: Keys
            [1, "a", True, "ignore", 10.5],                         # Row 2: Data row 1
            [2, "b", False, "ignore", 20.5],                        # Row 3: Data row 2
            ["//", "comment", "row", "ignore", "skip"],             # Row 4: Comment row (should be skipped)
            [None, None, None, None, None],                         # Row 5: Empty row (should be skipped)
            [3, "c", True, "ignore", 30.5]                          # Row 6: Data row 3
        ]
        self.raw_df = pd.DataFrame(data)
        self.excel_table = ExcelTable(self.raw_df)

    def test_initialization(self):
        """Test that the ExcelTable is initialized correctly."""
        # Check dimensions
        self.assertEqual(self.excel_table.shape(), (3, 4))  # 3 valid data rows, 4 valid columns
        self.assertEqual(self.excel_table.num_rows, 3)
        self.assertEqual(self.excel_table.num_cols, 4)
        
        # Check column_info is created correctly
        self.assertEqual(len(self.excel_table.column_info), 4)
        self.assertTrue("key1" in self.excel_table.column_info)
        self.assertTrue("key2" in self.excel_table.column_info)
        self.assertTrue("key3" in self.excel_table.column_info)
        self.assertTrue("key5" in self.excel_table.column_info)
        
        # Check comments are stored correctly
        self.assertEqual(self.excel_table.column_info["key1"].comment, "Comment1")
        self.assertEqual(self.excel_table.column_info["key5"].comment, "Comment5")

    def test_get_cell(self):
        """Test getting cell values."""
        self.assertEqual(self.excel_table.get_cell(0, 0), 1)
        self.assertEqual(self.excel_table.get_cell(1, 1), "b")
        self.assertEqual(self.excel_table.get_cell(2, 3), 30.5)
        
        # Test invalid indices
        with self.assertRaises(IndexError):
            self.excel_table.get_cell(3, 0)  # Row index too high
        with self.assertRaises(IndexError):
            self.excel_table.get_cell(0, 4)  # Column index too high

    def test_get_row(self):
        """Test getting entire rows."""
        row0 = self.excel_table.get_row(0)
        self.assertEqual(len(row0), 4)
        self.assertEqual(row0["key1"], 1)
        self.assertEqual(row0["key3"], True)

    def test_get_col(self):
        """Test getting columns by index."""
        col0 = self.excel_table.get_col(0)
        self.assertEqual(len(col0), 3)
        self.assertEqual(col0.iloc[0], 1)
        self.assertEqual(col0.iloc[2], 3)

    def test_get_col_by_key(self):
        """Test getting columns by key."""
        col2 = self.excel_table.get_col_by_key("key2")
        self.assertEqual(len(col2), 3)
        self.assertEqual(col2.iloc[0], "a")
        self.assertEqual(col2.iloc[1], "b")
        
        # Test invalid key
        with self.assertRaises(KeyError):
            self.excel_table.get_col_by_key("non_existent_key")

    def test_iterrows(self):
        """Test iterating through rows."""
        row_count = 0
        for idx, row in self.excel_table.iterrows():
            row_count += 1
            # Check first row values
            if idx == 0:
                self.assertEqual(row["key1"], 1)
                self.assertEqual(row["key2"], "a")
        
        self.assertEqual(row_count, 3)  # Should have 3 valid rows

    def test_get_column_info(self):
        """Test getting column info by key."""
        col_info = self.excel_table.get_column_info("key3")
        self.assertIsNotNone(col_info)
        self.assertEqual(col_info.key, "key3")
        self.assertEqual(col_info.comment, "Comment3")
        
        # Non-existent key should return None
        self.assertIsNone(self.excel_table.get_column_info("non_existent_key"))

    def test_get_all_column_info(self):
        """Test getting all column info."""
        all_info = self.excel_table.get_all_column_info()
        self.assertEqual(len(all_info), 4)
        
        # Check it's a copy
        all_info["new_key"] = "test"
        self.assertNotIn("new_key", self.excel_table.column_info)


if __name__ == "__main__":
    unittest.main() 