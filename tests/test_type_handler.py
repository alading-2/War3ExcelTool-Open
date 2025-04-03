import pytest
from src.core.type_handler import TypeHandler


class TestTypeHandler:
    """测试类型处理模块"""

    def setup_method(self):
        """每个测试方法的设置"""
        self.handler = TypeHandler()
