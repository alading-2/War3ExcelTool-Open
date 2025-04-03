from typing import Dict, Tuple  # 导入类型提示功能，Dict表示字典类型，Tuple表示元组类型
import logging  # 导入日志模块，用于记录程序运行情况
from ..utils.logger import get_logger  # 从项目的utils目录导入自定义日志获取函数

# 获取当前模块的日志记录器
logger = get_logger(__name__)  # __name__是Python的特殊变量，表示当前模块名称


class ColorHandler:
    """处理Excel单元格颜色的类
    
    这个类负责将Excel中的颜色代码转换为TypeScript代码中使用的颜色格式，
    并提供带颜色标记的文本格式化功能。
    """

    # 预定义的颜色映射字典，将RGB颜色代码映射到TS颜色代码
    # 键是颜色的十六进制RGB值，值是对应的TS颜色代码
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
        """初始化ColorHandler类的新实例
        
        创建一个日志记录器，用于记录颜色处理过程中的信息
        """
        # 获取一个与当前类关联的日志记录器
        self.logger = logging.getLogger(__name__)

    def get_color_code(self, rgb: str) -> str:
        """
        获取指定RGB颜色的颜色代码
        
        Args:
            rgb: RGB颜色代码，格式为六位十六进制数，如'FF0000'表示红色
            
        Returns:
            对应的TS颜色代码，格式为'|cffXXXXXX'，其中XXXXXX是颜色的十六进制代码
            
        示例:
            >>> handler = ColorHandler()
            >>> handler.get_color_code("FF0000")
            "|cffff0000"
        """
        # 首先尝试从预定义映射中获取颜色代码
        if rgb in self.COLOR_MAPPING:  # 检查颜色是否在预定义映射中
            return self.COLOR_MAPPING[rgb]  # 如果在，直接返回对应的颜色代码

        # 如果不在预定义映射中，则构造新的颜色代码
        # f"..."是Python的f-string语法，用于在字符串中嵌入变量
        # rgb.lower()将RGB转换为小写字母形式
        return f"|cff{rgb.lower()}"

    def format_with_color(self, text: str, color_code: str) -> str:
        """
        使用颜色代码格式化文本，给文本添加颜色标记
        
        Args:
            text: 原始文本，要添加颜色的文本内容
            color_code: 颜色代码，如'|cffff0000'表示红色
            
        Returns:
            带颜色标记的文本，格式为'颜色代码+文本+|r'，其中|r表示颜色结束
            如果没有提供颜色代码，则返回原始文本
            
        示例:
            >>> handler = ColorHandler()
            >>> handler.format_with_color("Hello", "|cffff0000")
            "|cffff0000Hello|r"
        """
        # 这是一个条件表达式(三元运算符)：如果color_code为空，返回原文本；否则返回带颜色标记的文本
        # |r 是颜色标记的结束符号
        return text if not color_code else f"{color_code}{text}|r"
