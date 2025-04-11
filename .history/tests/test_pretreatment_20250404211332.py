import unittest
import pandas as pd
import numpy as np
from src.core.pretreatment import (
    extract_preprocessor_directives, 
    apply_preprocessors, 
    parse_directive_value,
    VALID_PREPROCESSORS
)

class TestPretreatment(unittest.TestCase):
    """预处理功能的测试类"""

    def test_parse_directive_value(self):
        """测试预处理指令值解析"""
        # 测试整数解析
        self.assertEqual(parse_directive_value("123"), 123)
        # 测试浮点数解析
        self.assertEqual(parse_directive_value("123.45"), 123.45)
        # 测试布尔值解析
        self.assertEqual(parse_directive_value("true"), True)
        self.assertEqual(parse_directive_value("false"), False)
        # 测试字符串解析
        self.assertEqual(parse_directive_value("test"), "test")

    def test_apply_preprocessors(self):
        """测试应用预处理规则"""
        # 测试默认值规则
        preprocessors = {"#default": 0}
        self.assertEqual(apply_preprocessors(np.nan, preprocessors), 0)
        self.assertEqual(apply_preprocessors(10, preprocessors), 10)
        
        # 测试路径替换规则
        preprocessors = {"#path": True}
        self.assertEqual(
            apply_preprocessors("path\\to\\file", preprocessors), 
            "path\\\\to\\\\file"
        )
        
        # 测试组合规则
        preprocessors = {"#default": "", "#path": True}
        self.assertEqual(apply_preprocessors(np.nan, preprocessors), "")
        self.assertEqual(
            apply_preprocessors("path\\to\\file", preprocessors), 
            "path\\\\to\\\\file"
        )
        
        # 测试非字符串值不受#path影响
        self.assertEqual(apply_preprocessors(123, preprocessors), 123)

    def test_extract_preprocessor_directives(self):
        """测试从DataFrame提取预处理指令"""
        # 创建测试DataFrame
        data = [
            ["#default 0", "#path", "Normal Header"],
            ["Attack", "Icon Path", "Description"],
            [10, "sword\\icon.blp", "A sword"],
            [20, "axe\\icon.blp", "An axe"]
        ]
        df = pd.DataFrame(data)
        
        # 提取预处理指令
        column_preprocessors, directive_rows, header_row_idx = extract_preprocessor_directives(df)
        
        # 验证提取结果
        self.assertEqual(len(column_preprocessors), 2)
        self.assertEqual(directive_rows, {0})
        self.assertEqual(header_row_idx, 1)
        
        # 验证第一列的预处理规则
        self.assertIn((0, "Attack"), column_preprocessors)
        self.assertEqual(column_preprocessors[(0, "Attack")]["#default"], 0)
        
        # 验证第二列的预处理规则
        self.assertIn((1, "Icon Path"), column_preprocessors)
        self.assertTrue(column_preprocessors[(1, "Icon Path")]["#path"])

if __name__ == "__main__":
    unittest.main()