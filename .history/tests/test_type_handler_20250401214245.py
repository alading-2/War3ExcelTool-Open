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
