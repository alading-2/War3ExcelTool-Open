import re  # 导入正则表达式模块，用于字符串模式匹配
from ast import literal_eval
import os  # 导入操作系统模块，用于处理文件路径
import shutil  # 导入shutil模块，用于文件复制
import pandas as pd  # 导入pandas库，简称pd，用于数据分析和处理Excel文件
import openpyxl  # 导入openpyxl库，用于读取Excel文件的样式信息（如颜色）
from typing import Dict, List, Any, Tuple, Optional, Union, Set  # 导入类型提示功能
from openpyxl.styles import PatternFill  # 导入Excel单元格填充样式相关功能
from src.core.excel.data_handler import ExcelTable
import logging  # 导入日志模块
from src.core.excel.pretreatment import extract_preprocessor_directives
from src.core.excel.get_char_color import ExcelCharColorReader
from src.utils.project_info import ProjectInfo  # 导入项目信息类，用于获取基本目录


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

    def parse_excel(self, file_path: str) -> List[Dict[str, Any]]:
        """
        解析Excel文件，提取数据和结构信息

        这个方法是整个解析过程的主入口，它会读取Excel文件并提取多种信息：
        1. 工作表名称 (sheet_name)
        2. 包含列信息和文件元数据的 metadata 字典

        Args:
            file_path: Excel文件路径，表示要解析的Excel文件的位置

        Returns:
            一个包含元组的列表，每个元组代表一个工作表，包含:
            (sheet_name, metadata)
            其中 metadata 结构为:
            {
                "filename": str, # 文件名
                "sheet_name": str, # 工作表名
                "excel_table": ExcelTable # 包含数据、类型和预处理指令的ExcelTable对象
            }

        Raises:
            FileNotFoundError: 当指定的Excel文件不存在时
            Exception: 当解析过程中发生其他错误时
        """
        # 检查文件是否存在，不存在则记录错误并抛出异常
        if not os.path.exists(file_path):
            self.logger.warning(f"Excel文件不存在: {file_path}")
            raise FileNotFoundError(f"Excel文件不存在: {file_path}")

        filename = os.path.basename(file_path)
        # 创建临时文件目录并复制Excel文件，用于process_workbook处理
        temp_dir = os.path.join(ProjectInfo.main_base_dir, "xlsx_copy_path")
        os.makedirs(temp_dir, exist_ok=True)
        temp_file_path = os.path.join(temp_dir, filename)
        shutil.copy2(file_path, temp_file_path)
        self.logger.info(f"已复制Excel文件到临时目录: {temp_file_path}")

        try:
            # 获取Excel文件的所有sheet名称
            xl = pd.ExcelFile(file_path)
            sheet_names = xl.sheet_names

            results = []

            # 遍历所有sheet并解析
            for sheet_name in sheet_names:
                self.logger.info(f"解析工作表: {sheet_name}")

                # 首先读取整个DataFrame，用于预处理指令提取
                df: pd.DataFrame = pd.read_excel(temp_file_path, sheet_name=sheet_name, header=None)

                # 创建ExcelTable
                excel_table = ExcelTable(df)
                # 检查DataFrame是否有足够的行
                if df.shape[0] < 3:
                    self.logger.warning(f'{filename}的表"{sheet_name}"行数<3，不解析')
                    continue

                # 为数据行（从第三行开始）添加颜色码
                excel_char_color_reader = ExcelCharColorReader()
                # 使用临时文件处理工作簿，避免原文件被长时间占用
                df = excel_char_color_reader.process_workbook(temp_file_path, sheet_name, df)

                # 删除键名为空或=""的列
                # df.loc[]会去掉False的列
                condition = df.iloc[1].map(lambda x: ExcelTable.custom_isna(x) or x == r'""')
                df = df.loc[:, ~condition]
                # 删除以//开头或空单元格开头的行（保留前两行）
                condition = df.iloc[:, 0].map(lambda x: ExcelTable.custom_isna(x) or str(x).strip().startswith("//"))
                # 向量化比较 ：df.index < 2 会产生布尔值序列
                df = df.loc[~condition | (df.index < 2)]
                # 重置行索引
                df.reset_index(drop=True, inplace=True)
                # 从DataFrame的第一行提取预处理指令，删除和执行预处理指令
                preprocessors, df = extract_preprocessor_directives(df)

                # 获取每列的type，存放到字典中
                types_dict = self.infer_types(df)

                # 数据处理
                df.iloc[2:] = df.iloc[2:].apply(lambda x: x.map(self.value_handle))

                # 重写DataFrame列名为有效键名
                excel_table.data = df
                excel_table.data.columns = excel_table.get_keys()
                excel_table.types = types_dict  # 类型信息
                excel_table.preprocessors = preprocessors  # 预处理指令

                is_object_table = False
                keys = excel_table.get_keys()
                if "id" in keys and "_parent" in keys:
                    is_object_table = True
                # 创建新的 metadata 结构
                metadata = {
                    "is_object_table": is_object_table,  # 是否物编表格，而且是通用表格，不是白泽物编
                    "file_path": file_path,
                    "filename": filename,  # 文件名
                    "sheet_name": sheet_name,  # 工作表名
                    "excel_table": excel_table,
                }

                # 将当前工作表的解析结果添加到最终列表中
                results.append(metadata)

            # 处理完成后删除临时文件和目录
            if os.path.exists(temp_file_path):
                os.remove(temp_file_path)
                self.logger.info(f"已删除临时Excel文件: {temp_file_path}")

            # 删除临时目录
            if os.path.exists(temp_dir):
                os.rmdir(temp_dir)
                self.logger.info(f"已删除临时目录: {temp_dir}")

            return results

        except Exception as e:
            # 确保临时文件和目录被删除
            if os.path.exists(temp_file_path):
                os.remove(temp_file_path)
                self.logger.info(f"发生错误后删除临时Excel文件: {temp_file_path}")
            if os.path.exists(temp_dir):
                os.rmdir(temp_dir)
                self.logger.info(f"发生错误后删除临时目录: {temp_dir}")
            self.logger.error(f"解析Excel文件的工作表时出错: {str(e)}")
            raise e

    def infer_type_single(self, value: Any) -> Optional[str]:  # 返回Optional[str]因为pd.NA应返回None
        """
        根据提供的单个值推断TypeScript类型。

        Args:
            value: 要推断类型的值，可以是任何Python数据类型。

        Returns:
            推断出的TypeScript类型名称 ("string", "number", "boolean", "any") 或 None (如果输入是pd.NA)。
        """
        if ExcelTable.custom_isna(value):  # 首先处理Pandas的NA值
            return None
        if isinstance(value, bool):  # 布尔值
            return "boolean"
        if isinstance(value, (int, float)):  # 整数或浮点数
            # 不需要区分int和float，TypeScript统一为number
            return "number"
        if isinstance(value, str):  # 字符串需要进一步判断
            value_stripped = value.strip()  # 去除首尾空格
            if value_stripped.startswith(r'""') and value_stripped.endswith(r'""'):
                # 如果字符串以两个双引号开头和结尾，移除首尾的双引号并返回 "string"
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
            if re.fullmatch(r"-?\d{1,3}(?:,?\d{3})*(?:\.\d+)?(?:[eE][+-]?\d+)?", value_stripped):
                # 正则匹配成功，移除逗号并转换为float
                float(value_stripped.replace(",", ""))
                return "number"

            # 判断是否是布尔字符串 "true" 或 "false" (不区分大小写)
            if value_stripped.lower() in ("true", "false"):
                return "boolean"

            # 检查字符串是否像JSON对象或数组
            if (not value.startswith("[=")) and (
                (value.startswith("{") and value.endswith("}")) or (value.startswith("[") and value.endswith("]"))
            ):
                return "any"  # 默认情况，保持原有逻辑

            # 如果以上都不是，则认为是普通字符串
            return "string"

        # 无法直接映射到基本的TS类型，归为 "any"
        self.logger.debug(f"值 '{value}' 的类型 {type(value)} 无法直接映射，推断为 'any'。")
        return "any"

    def infer_types(self, df: pd.DataFrame) -> Dict[str, str]:
        """
        根据DataFrame数据推断每列的TypeScript类型列表。
        返回与DataFrame列数一致的类型列表。

        Args:
            df: 包含Excel数据的DataFrame。

        Returns:
            一个字典，键是列名（第二行），值是推断出的TypeScript类型字符串。
            如果行数不足（<3），则所有列类型为 "any"。
        """
        num_columns = df.shape[1]  # 获取DataFrame的列数

        # 如果行数不足3（没有数据行），无法进行类型推断，所有列视为any
        # if len(df) < 3:
        #     self.logger.warning(
        #         "数据行不足（少于3行），无法进行类型推断，所有列将默认为 'any' 类型。"
        #     )
        #     return {df.iloc[1, j]: "any" for j in range(num_columns)}

        types = {}  # 存储每列最终推断出的类型
        # 遍历所有列的索引
        for j in range(num_columns):
            # 获取该列从第三行开始的所有数据值，用于类型推断
            values = df.iloc[2:, j].tolist()
            key = df.iloc[1, j]

            column_types = set()  # 存储该列遇到的所有非空值的推断类型
            has_non_na = False  # 标记该列是否有非空（非NA）值
            for value in values:
                if ExcelTable.custom_notna(value):  # 只处理非空值
                    has_non_na = True
                    # 推断单个值的类型
                    inferred_type = self.infer_type_single(value)
                    # infer_type_single 对 NA 返回 None，这里不需要再次检查
                    # 但它可能返回 "any" 或其他具体类型
                    if inferred_type is not None:  # 理论上 pd.notna(value) 为真时不会是 None
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

            if key not in types:  # 确保键不重复
                types[key] = column_final_type

        return types  # 返回包含所有列类型信息的字典

    def value_handle(self, value: Any) -> Any:
        """
        处理从Excel单元格读取的原始值，根据目标TypeScript类型进行转换和格式化。

        Args:
            value: 单元格的原始值。

        Returns:
            处理后的值，适用于最终生成的JSON/TypeScript数据结构，或者原始值（如果不需要处理或无法处理）。
        """
        # 空值不处理
        if ExcelTable.custom_isna(value):
            return value

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

            # 将任意个\替换为\\
            value = re.sub(r"\\+", r"\\", value)

            # 先去掉首尾空白，再去掉多余的双引号
            if value != "":
                value = value.strip().strip('"')
            return value

        if isinstance(value, str) and type in ("any"):
            # 如果值是对象/数组的字符串，用正则表达式获取对象/数组
            if (value.startswith("{") and value.endswith("}")) or (value.startswith("[") and value.endswith("]")):
                # 步骤 1：处理键的引号问题（给键添加双引号）
                # 结果：'{"strength_p":3, "attack_p":5,}'
                value1 = re.sub(r"(\w+):", r'"\1":', value)

                # 步骤 2：处理末尾的逗号问题
                # 结果：'{"strength_p":3, "attack_p":5}'
                value2 = re.sub(r",\s*}", "}", value1)

                # 步骤 3：安全解析为字典
                try:
                    value3 = literal_eval(value2)
                    # value = json.dumps(
                    #     value, ensure_ascii=False, indent=4, separators=(",", ": ")
                    # )
                    return value3
                except (ValueError, SyntaxError) as e:
                    # 这里失败一般是物编的格式{}和'[=[' ']=]'引起的，类型判断因为包含{},[],所有会被识别成any，
                    # 但里面的不是对象/数组，而是字符串，literal_eval会报错，所以这里返回value就好
                    return value
            # 普通any类型直接返回
            return value

        # 其他类型直接返回原始值
        return value
