from typing import Dict, Tuple
import logging
from ..utils.logger import get_logger

logger = get_logger(__name__)

class ColorHandler:
    """处理Excel单元格颜色的类"""
    
    # 预定义的颜色映射
    COLOR_MAPPING = {
        "FF0000": "|cffff0000",  # 红色
        "FFFF00": "|cffffff00",  # 黄色
        "00FF00": "|cff00ff00",  # 绿色
        "0000FF": "|cff0000ff",  # 蓝色
        "FF00FF": "|cffff00ff",  # 紫色
        "000000": "|c00000000",  # 黑色
        "FFFFFF": "|cffffffff",  # 白色
    }
    
    def __init__(self):
        """初始化ColorHandler类"""
        self.logger = logging.getLogger(__name__)
    
    def get_color_code(self, rgb: str) -> str:
        """
        获取指定RGB颜色的颜色代码
        
        Args:
            rgb: RGB颜色代码，如'FF0000'表示红色
            
        Returns:
            对应的TS颜色代码，如'|cffff0000'
        """
        # 首先尝试从预定义映射中获取
        if rgb in self.COLOR_MAPPING:
            return self.COLOR_MAPPING[rgb]
        
        # 如果不在预定义映射中，则构造新的颜色代码
        return f"|cff{rgb.lower()}"
    
    def format_with_color(self, text: str, color_code: str) -> str:
        """
        使用颜色代码格式化文本
        
        Args:
            text: 原始文本
            color_code: 颜色代码
            
        Returns:
            带颜色标记的文本
        """
        return text if not color_code else f"{color_code}{text}|r" 