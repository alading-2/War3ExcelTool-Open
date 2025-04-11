import re  # 导入正则表达式模块，用于字符串模式匹配
from ast import literal_eval
import os  # 导入操作系统模块，用于处理文件路径
import pandas as pd  # 导入pandas库，简称pd，用于数据分析和处理Excel文件
import openpyxl  # 导入openpyxl库，用于读取Excel文件的样式信息（如颜色）
from typing import Dict, List, Any, Tuple, Optional, Union, Set  # 导入类型提示功能
from openpyxl.styles import PatternFill  # 导入Excel单元格填充样式相关功能
from src.core.data_handler import ExcelTable
import logging  # 导入日志模块
from src.utils.logger import get_logger  # 从项目的utils目录导入自定义日志获取函数
from src.core.pretreatment import (
    apply_column_preprocessors,
    extract_preprocessor_directives,
    apply_preprocessors,
    PREPROCESSOR_ACTIONS,
)

# 获取当前模块的日志记录器
logger = get_logger(__name__)  # __name__是Python的特殊变量，表示当前模块名称


class ExcelParser:
    """解析Excel文件并提取数据的类

    这个类负责读取Excel文件的内容，提取其中的数据、结构和颜色信息，
    为后续生成TypeScript代码做准备。
    """

    def __init__(self):
        """初始化ExcelParser类的新实例

        创建一个日志记录器，用于记录Excel解析过程中的信息
        """
        # 获取一个与当前类关联的日志记录器
        self.logger = logging.getLogger(__name__)

    def parse_excel(self, file_path: str) -> List[Tuple[str, Dict[str, Any]]]:
        """
        解析Excel文件，提取数据和结构信息

        这个方法是整个解析过程的主入口，它会读取Excel文件并提取多种信息：
        1. 工作表名称 (sheet_name)
        2. 包含列信息和文件元数据的 metadata 字典

        Args:
            file_path: Excel文件路径，表示要解析的Excel文件的位置

        Returns:
            一个包含元组的列表，每个元组代表一个工作表，包含:
            (sheet_name, metadata, data_rows)
            其中 metadata 结构为:
            {
                "filename": str,
                "sheet_name": str,
                "columns_info": List[ColumnInfo] # 列信息对象列表
            }

        Raises:
            FileNotFoundError: 当指定的Excel文件不存在时
            Exception: 当解析过程中发生其他错误时
        """
        # 检查文件是否存在，不存在则记录错误并抛出异常
        if not os.path.exists(file_path):
            self.logger.error(f"Excel文件不存在: {file_path}")
            raise FileNotFoundError(f"Excel文件不存在: {file_path}")

        try:
            # 获取Excel文件的所有sheet名称
            xl = pd.ExcelFile(file_path)
            sheet_names = xl.sheet_names

            results = []

            # 遍历所有sheet并解析
            for sheet_name in sheet_names:
                self.logger.info(f"解析工作表: {sheet_name}")

                # 首先读取整个DataFrame，用于预处理指令提取
                df: pd.DataFrame = pd.read_excel(
                    file_path, sheet_name=sheet_name, header=None
                )

                # 创建ExcelTable
                excel_table = ExcelTable(df)

                # 检查DataFrame是否有足够的行
                if df.shape[0] < 2:
                    raise ValueError("输入的DataFrame必须至少有2行")

                # 删除键名为空或=""的列
                # df.loc[]会去掉False的列
                condition = df.iloc[1].map(
                    lambda x: excel_table.custom_isna(x) or x == ""
                )
                df = df.loc[:, ~condition]
                # 删除以//开头或空单元格开头的行（保留前两行）
                condition = df.iloc[:, 0].map(
                    lambda x: excel_table.custom_isna(x)
                    or str(x).strip().startswith("//")
                )
                # 向量化比较 ：df.index < 2 会产生布尔数组
                df = df.loc[~condition | (df.index < 2)]
                # 重置行索引
                df.reset_index(drop=True, inplace=True)
                # 从DataFrame的前几行提取预处理指令
                preprocessors, df = extract_preprocessor_directives(df)
                # 应用预处理规则对DataFrame进行清理

                # # 从前几行提取预处理指令
                # column_preprocessors, df = extract_preprocessor_directives(df)
                # df = apply_column_preprocessors(df, column_preprocessors)
                # # 根据识别的表头行重新读取DataFrame
                # # df = pd.read_excel(file_path,
                # #                    sheet_name=sheet_name,
                # #                    header=None)
                # # 检查DataFrame是否为空或行数不足以提取键名
                # if df.empty or len(df) < 2:
                #     self.logger.warning(
                #         f"工作表 '{sheet_name}' 在文件 '{os.path.basename(file_path)}' 中为空或缺少必要的行（至少需要2行），跳过。"
                #     )
                #     continue

                # # --- 重构元数据提取 ---
                # columns_info: List[ColumnInfo] = []  # 用于存储所有列信息的列表
                # # 提取原始行数据，处理行数不足的情况
                # raw_comments = df.iloc[0].tolist() if len(df) > 0 else []
                # raw_keys = df.iloc[1].tolist()  # 键名行保证存在 (len(df) >= 2)
                # # 推断类型，如果行数不足3，则无法推断，后续会处理
                # raw_types = self.infer_types(df)  # infer_types 内部会处理行数不足的情况

                # key_map = {}  # 内部使用，方便通过键名查找列信息

                # # 遍历第二行（键名行）来确定有效的列及其信息
                # for i, key_any in enumerate(raw_keys):
                #     key = str(key_any).strip()  # 获取键名并去除首尾空格
                #     # 只处理键名不为空的列
                #     if pd.notna(key_any) and key != "":
                #         # 获取对应的注释（第一行），注意索引边界
                #         comment_any = raw_comments[i] if i < len(
                #             raw_comments) else None
                #         comment = str(comment_any).strip(
                #         ) if pd.notna(comment_any) and str(
                #             comment_any).strip() != "" else None

                #         # 获取对应的推断类型（来自 infer_types 的结果），注意索引边界
                #         col_type = raw_types[i] if i < len(
                #             raw_types) else "any"  # 如果类型列表较短，则默认为any

                #         # 获取该列的预处理规则
                #         preproc_rules = {}
                #         if key in column_preprocessors:
                #             preproc_rules = column_preprocessors[key]
                #         else:
                #             preproc_rules = None

                #         # 创建ColumnInfo对象
                #         column = ColumnInfo(key=key,
                #                             type=col_type,
                #                             comment=comment,
                #                             preprocessing_rules=preproc_rules)
                #         columns_info.append(column)  # 添加到列信息列表

                # --- 结束重构元数据提取 ---

                # 创建新的 metadata 结构
                metadata = {
                    "filename": os.path.basename(file_path),  # 文件名
                    "sheet_name": sheet_name,  # 工作表名
                    "excel_table": excel_table,
                }

                # # 解析实际数据行（第三行及以下）
                # # 注意：_parse_data_rows 现在需要使用新的 metadata 结构和预处理功能
                # data_rows = self._parse_data_rows(df, metadata)

                # 将当前工作表的解析结果添加到最终列表中
                results.append((sheet_name, metadata))

            return results

        except Exception as e:
            self.logger.error(f"解析Excel文件的工作表时出错: {str(e)}")
            raise

    def infer_types(self, df: pd.DataFrame) -> List[str]:
        """
        根据DataFrame数据推断每列的TypeScript类型列表。
        返回与DataFrame列数一致的类型列表。

        Args:
            df: 包含Excel数据的DataFrame。

        Returns:
            一个字符串列表，包含每列推断出的TypeScript类型。
            列表长度与df的列数相同。 如果行数不足（<3），则所有列类型为 "any"。
        """
        num_columns = df.shape[1]  # 获取DataFrame的列数

        # 如果行数不足3（没有数据行），无法进行类型推断，所有列视为any
        if len(df) < 3:
            self.logger.warning(
                "数据行不足（少于3行），无法进行类型推断，所有列将默认为 'any' 类型。"
            )
            return ["any"] * num_columns

        types = []  # 存储每列最终推断出的类型
        # 遍历所有列的索引
        for j in range(num_columns):
            # 获取该列从第三行开始的所有数据值，用于类型推断
            values = df.iloc[2:, j].tolist()

            column_types = set()  # 存储该列遇到的所有非空值的推断类型
            has_non_na = False  # 标记该列是否有非空（非NA）值
            for value in values:
                if pd.notna(value):  # 只处理非空值
                    has_non_na = True
                    # 推断单个值的类型
                    inferred_type = self.infer_type_single(value)
                    # infer_type_single 对 NA 返回 None，这里不需要再次检查
                    # 但它可能返回 "any" 或其他具体类型
                    if (
                        inferred_type is not None
                    ):  # 理论上 pd.notna(value) 为真时不会是 None
                        column_types.add(inferred_type)

            # 确定该列的最终类型
            if not has_non_na or not column_types:
                # 如果该列全是空值，或者所有非空值都无法推断出类型（例如都是复杂对象）
                column_final_type = "any"
            elif len(column_types) == 1:
                # 如果只遇到一种类型
                column_final_type = next(iter(column_types))
            else:
                # 其他多种类型混合的情况（例如 number 和 boolean），使用 'any' 最安全
                # 或者可以生成联合类型: " | ".join(sorted(list(column_types)))
                column_final_type = " | ".join(sorted(list(column_types)))

            types.append(column_final_type)  # 将该列的最终类型添加到列表中

        return types  # 返回包含所有列类型的列表

    def infer_type_single(
        self, value: Any
    ) -> Optional[str]:  # 返回Optional[str]因为pd.NA应返回None
        """
        根据提供的单个值推断TypeScript类型。

        Args:
            value: 要推断类型的值，可以是任何Python数据类型。

        Returns:
            推断出的TypeScript类型名称 ("string", "number", "boolean", "any") 或 None (如果输入是pd.NA)。
        """
        if pd.isna(value):  # 首先处理Pandas的NA值
            return None
        if isinstance(value, bool):  # 布尔值
            return "boolean"
        if isinstance(value, (int, float)):  # 整数或浮点数
            # 不需要区分int和float，TypeScript统一为number
            return "number"
        if isinstance(value, str):  # 字符串需要进一步判断
            value_stripped = value.strip()  # 去除首尾空格
            if value_stripped == "":  # 空字符串认为是string类型
                return "string"

            # 尝试判断是否像数字 (允许负号、逗号、小数点、科学计数法)
            # 正则表达式解释:
            # ^-?：匹配可选的负号。
            # \d{1,3}：匹配1到3位数字。
            # (?:,\d{3})*：非捕获组，匹配零个或多个逗号后跟三位数字的模式。
            # .    ?: 表示非捕获组，不捕获匹配的内容。
            #     , 匹配逗号。
            #     \d{3} 匹配三位数字。
            # (?:\.\d+)?：非捕获组，匹配可选的小数部分。
            #     \. 匹配小数点。
            #     \d+ 匹配一个或多个数字。
            # ([eE][+-]?\d+)?：匹配可选的科学计数法部分。
            #     [eE] 匹配 e 或 E。
            #     [+-]? 匹配可选的正号或负号。
            #     \d+ 匹配一个或多个数字。
            if re.fullmatch(
                r"-?\d{1,3}(?:,?\d{3})*(?:\.\d+)?(?:[eE][+-]?\d+)?", value_stripped
            ):
                # 正则匹配成功，移除逗号并转换为float
                float(value_stripped.replace(",", ""))
                return "number"

            # 判断是否是布尔字符串 "true" 或 "false" (不区分大小写)
            if value_stripped.lower() in ("true", "false"):
                return "boolean"

            # 检查字符串是否像JSON对象或数组
            if (value.startswith("{") and value.endswith("}")) or (
                value.startswith("[") and value.endswith("]")
            ):
                return "any"

            # 如果以上都不是，则认为是普通字符串
            return "string"

        # 对于其他Python内置类型（如datetime, bytes等）或自定义对象
        # 无法直接映射到基本的TS类型，归为 "any"
        # self.logger.debug(f"Value '{value}' of type {type(value)} cannot be directly mapped, inferring as 'any'.")
        return "any"

    # def _parse_data_rows(self, df: pd.DataFrame,
    #                      metadata: Dict[str, Any]) -> List[Dict]:
    #     """
    #     解析数据行（从第三行开始），将DataFrame中的数据转换为字典列表。
    #     使用metadata中的列信息来确定键和处理值。

    #     Args:
    #         df: DataFrame数据，包含所有行。
    #         metadata: 元数据字典，必须包含 "columns_info": List[ColumnInfo] 和内部使用的 "_key_map"。

    #     Returns:
    #         数据行列表，每个元素是一个字典，表示一行有效数据。
    #     """
    #     data_rows = []  # 存储最终的行数据字典列表

    #     # 如果DataFrame行数不足3，说明没有数据行
    #     if len(df) < 3:
    #         return []

    #     # 构建列索引到ColumnInfo的映射，方便查找
    #     col_to_info = {}
    #     for col_info in metadata["columns_info"]:
    #         for i, key in enumerate(df.iloc[1]):
    #             if pd.notna(key) and str(key).strip() == col_info.key:
    #                 col_to_info[i] = col_info
    #                 break

    #     # 遍历DataFrame中的行，从第三行开始（索引2）
    #     # idx是行索引，row是行数据
    #     for idx, row in df.iloc[2:].iterrows():
    #         # 检查是否为注释行（首列数据为空或者以"//"开头的行视为注释，将被跳过）
    #         # str(): 用于将对象转换为字符串。strip(): 去除字符串两端的空格
    #         # startswith(): 检查字符串是否以指定的前缀开头
    #         # 需要确保行中有数据才访问iloc[0]
    #         first_cell_value = row.iloc[0] if len(row) > 0 else None
    #         # 如果第一列为空值 (NaN) 或者 是以 "//" 开头的字符串，则跳过该行
    #         if first_cell_value is None or pd.isna(
    #                 first_cell_value) or first_cell_value == "//":
    #             continue  # 跳到下一行

    #         row_data = {}

    #         # i是列索引，value是单元格的值
    #         for i, value in enumerate(row):
    #             # 跳过空的列（没有键名）
    #             if i not in col_to_info:
    #                 continue

    #             # 获取当前列的ColumnInfo
    #             col_info = col_to_info[i]
    #             key = col_info.key

    #             # # 应用预处理规则
    #             # if col_info.preprocessing_rules:
    #             #     # 应用预处理规则
    #             #     value = apply_preprocessors(value,
    #             #                                 col_info.preprocessing_rules)

    #             # 跳过处理后仍为空的单元格
    #             if pd.isna(value):
    #                 continue

    #             # 推断类型并处理值
    #             # type = self.infer_type_single(value)
    #             # value = self._value_handle(value, type)

    #             # 将值添加到行数据字典中
    #             row_data[key] = value

    #         # 将处理好的行数据添加到结果列表中
    #         if row_data:
    #             data_rows.append(row_data)

    #     return data_rows  # 返回包含所有有效数据行字典的列表

    def _value_handle(self, value: Any) -> Any:
        """
        处理从Excel单元格读取的原始值，根据目标TypeScript类型进行转换和格式化。

        Args:
            value: 单元格的原始值 (保证调用时不是 pd.NA)。

        Returns:
            处理后的值，适用于最终生成的JSON/TypeScript数据结构，或者None（如果无法处理或应被视为空）。
        """
        type = self.infer_type_single(value)
        # print("value:", value, "type:", type)
        # 处理数字类型值
        if type == "number":
            # 去掉科学计数法的逗号
            return str(value).replace(",", "")

        if type == "boolean":
            return str(value).lower()

        # 处理字符串类型值
        if isinstance(value, str) and type in ("string"):
            # 检查字符串是否代表数字（使用正则表达式匹配）
            # ^表示开始，-?表示可选的负号，\d+表示一个或多个数字
            # (\.\d+)?表示可选的小数部分，$表示结束
            if re.match(r"^-?\d{1,3}(?:,\d{3})*(?:\.\d+)?([eE][+-]?\d+)?$", value):
                return str(value).replace(",", "")

            # 检查字符串是否代表布尔值（"true"或"false"）
            if value.lower() in ("true", "false"):
                return value.lower()

            # 先去掉首尾空白，再去掉多余的双引号
            if value != "":
                value = value.strip().strip('"')
            return value

        if isinstance(value, str) and type in ("any"):
            # 如果值是对象/数组的字符串，用正则表达式获取对象/数组
            if (value.startswith("{") and value.endswith("}")) or (
                value.startswith("[") and value.endswith("]")
            ):
                # 步骤 1：处理键的引号问题（给键添加双引号）
                # 结果：'{"strength_p":3, "attack_p":5,}'
                value = re.sub(r"(\w+):", r'"\1":', value)

                # 步骤 2：处理末尾的逗号问题
                # 结果：'{"strength_p":3, "attack_p":5}'
                value = re.sub(r",\s*}", "}", value)

                # 步骤 3：安全解析为字典
                value = literal_eval(value)
                return value
            # 普通any类型直接返回
            return value

        # 其他类型直接返回原始值
        return value
