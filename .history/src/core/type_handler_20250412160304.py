import re  # 导入正则表达式模块，用于模式匹配
import json  # 导入JSON模块，用于解析和生成JSON数据
from typing import Any, Dict, List, Tuple, Set, Union  # 导入类型提示功能
import logging

from src.core.data_handler import ExcelTable  # 导入日志模块
from ..utils.logger import get_logger  # 从项目的utils目录导入自定义日志获取函数

# 获取当前模块的日志记录器
logger = get_logger(__name__)  # __name__是Python的特殊变量，表示当前模块名称


class TypeHandler:
    """处理数据类型的类

    这个类负责处理Excel数据和TypeScript类型之间的转换，包括：
    1. 推断数据的TypeScript类型
    2. 从数据中提取TypeScript代码片段
    """

    def __init__(self):
        """初始化TypeHandler类的新实例

        创建一个日志记录器，用于记录类型处理过程中的信息
        """
        # 获取一个与当前类关联的日志记录器
        self.logger = logging.getLogger(__name__)

    def extract_ts_code(
        self, excel_table: ExcelTable, keys: List[str]
    ) -> Tuple[List[str], List[str]]:
        """
        从数据中提取TypeScript代码

        遍历数据行，查找包含TypeScript代码的列（名为"code"的列），
        并分离出导入语句和其他代码。

        Args:
            data_rows: 数据行列表，每个元素是包含数据的字典
            keys: 键名列表，表示数据可能包含的列名

        Returns:
            包含两个列表的元组:
            - 第一个列表包含所有导入语句（import语句）
            - 第二个列表包含所有其他代码

        示例:
            如果数据行中"code"列包含：
            "import { Player } from './player';
             const MAX_LEVEL = 100;"

            则返回:
            (["import { Player } from './player';"], ["const MAX_LEVEL = 100;"])
        """
        # 创建空列表，分别存储导入语句和其他代码
        imports = []  # 存储import语句
        other_code = []  # 存储其他代码

        # 检查键名列表中是否包含"code"列
        if "code" not in keys:
            return imports, other_code  # 如果没有code列，直接返回空结果

        code_list = excel_table.get_col_by_key("code")  # 获取"code"列的数据
        for code in code_list:
            # 不为空
            if code:
                # 提取import语句（以"import "开头的行）
                # 1. 使用split('\n')将代码分割为多行
                # 2. 遍历每一行，找出以'import '开头的行
                # 3. 使用strip()去除行首尾的空白字符
                import_lines = [
                    line.strip()
                    for line in code.split("\n")
                    if line.strip().startswith("import ")
                ]
                # 将提取的import语句添加到导入列表中
                imports.extend(import_lines)

                # 提取非import语句（不是空行且不以"import "开头的行）
                other_lines = [
                    line.strip()
                    for line in code.split("\n")
                    if line.strip() and not line.strip().startswith("import ")
                ]
                # 将提取的其他代码添加到其他代码列表中
                other_code.extend(other_lines)

        # 去除导入语句中的重复项
        imports = list(set(imports))  # set()创建集合，自动去重，然后转回列表

        # 返回导入语句和其他代码
        return imports, other_code
