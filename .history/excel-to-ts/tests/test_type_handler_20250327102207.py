import pytest
from src.core.type_handler import TypeHandler

class TestTypeHandler:
    """测试类型处理模块"""
    
    def setup_method(self):
        """每个测试方法的设置"""
        self.handler = TypeHandler()
    
    def test_infer_type(self):
        """测试类型推断功能"""
        # 测试基本类型
        assert self.handler.infer_type(None) == "any"
        assert self.handler.infer_type(True) == "boolean"
        assert self.handler.infer_type(False) == "boolean"
        assert self.handler.infer_type(10) == "number"
        assert self.handler.infer_type(10.5) == "number"
        assert self.handler.infer_type("text") == "string"
        
        # 测试字符串表示的布尔值
        assert self.handler.infer_type("true") == "boolean"
        assert self.handler.infer_type("false") == "boolean"
        
        # 测试字符串表示的数字
        assert self.handler.infer_type("10") == "number"
        assert self.handler.infer_type("10.5") == "number"
        
        # 测试复杂类型
        assert self.handler.infer_type([1, 2, 3]) == "any[]"
        assert self.handler.infer_type({"key": "value"}) == "object"
        assert self.handler.infer_type('{"key": "value"}') == "object"
        assert self.handler.infer_type('[1, 2, 3]') == "any[]"
    
    def test_format_value_for_ts(self):
        """测试值格式化功能"""
        # 测试布尔值
        assert self.handler.format_value_for_ts(True, "boolean") == "true"
        assert self.handler.format_value_for_ts(False, "boolean") == "false"
        assert self.handler.format_value_for_ts("true", "boolean") == "true"
        
        # 测试数字
        assert self.handler.format_value_for_ts(10, "number") == "10"
        assert self.handler.format_value_for_ts(10.5, "number") == "10.5"
        assert self.handler.format_value_for_ts("10", "number") == "10"
        
        # 测试字符串
        assert self.handler.format_value_for_ts("text", "string") == '"text"'
        assert self.handler.format_value_for_ts('text with "quotes"', "string") == '"text with \\"quotes\\""'
        
        # 测试带颜色的字符串
        assert self.handler.format_value_for_ts("text", "string", "|cffff0000") == '"|cffff0000text|r"' 