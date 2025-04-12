import os  # 导入操作系统模块，用于处理文件路径和创建目录
from typing import Dict, List, Any, Tuple, Optional  # 导入类型提示功能
import logging

import pandas as pd
from src.core.excel_parser import ExcelParser
from src.core.data_handler import ExcelTable
from src.utils.logger import get_logger  # 修改为绝对导入

# 获取当前模块的日志记录器
logger = get_logger(__name__)  # __name__是Python的特殊变量，表示当前模块名称


class TSGenerator:
    """生成TypeScript代码的类

    这个类负责将从Excel提取的数据转换成TypeScript代码文件，
    包括生成接口定义、数据常量和类定义等。
    """

    def __init__(self):
        """
        初始化TSGenerator类的新实例

        Args:
            type_handler: 类型处理器实例，用于处理数据类型转换和格式化
        """
        # 获取一个与当前类关联的日志记录器
        self.logger = logging.getLogger(__name__)
        self.excel_parser = ExcelParser()

    def generate_ts_file(
        self,
        excel_name: str,
        metadata: Dict[str, Any],
        output_dir: str,
        sheet_name: Optional[str] = None,
    ):
        """
        生成TypeScript文件

        将Excel数据转换为TypeScript代码，并写入到文件中。
        生成的文件包括接口定义、常量和数据数组，以及一个封装类。

        Args:
            excel_name: Excel文件名（不含扩展名），用于生成TypeScript文件名和类名
            metadata: 元数据，包含注释和其他相关信息
            output_dir: 输出目录，指定生成的TypeScript文件保存位置
            sheet_name: 可选的sheet名称，用于日志记录

        Returns:
            生成的文件路径，指向创建的TypeScript文件的完整路径

        Raises:
            Exception: 当生成TypeScript文件过程中出现错误时
        """
        try:
            excel_table: ExcelTable = metadata.get("excel_table")
            comments = excel_table.get_comments()
            keys = excel_table.get_keys()
            types = excel_table.types

            # 从数据中提取TypeScript代码片段（如import语句和其他代码）
            imports, other_code = self.extract_ts_code(excel_table, keys)

            # 生成不同TypeScript元素的名称，基于Excel文件名
            # 接口键名常量
            interface_keys_name = f"xlsx_inte_keys_{excel_name}"
            # 接口名称
            interface_name = f"xlsx_inte_{excel_name}"
            # 数据数组名称
            data_name = f"xlsx_data_{excel_name}"
            # 类名
            class_name = f"xlsx_{excel_name}"

            # 用于收集生成的TypeScript代码片段
            # 接口键常量xlsx_inte_keys_name
            interface_keys = []
            # 接口属性定义（字段名和类型）xlsx_inte_name
            interface_props = []

            # 遍历所有列（不包括code列），推断每列的数据类型
            for col_idx, key in enumerate(keys):
                # 跳过code列（它包含TypeScript代码片段，不是数据字段）
                if key == "code":
                    continue

                # 注释
                comment = comments[col_idx]
                # 添加到接口键定义列表（作为常量对象的属性）
                interface_keys.append(f'"{key}"')
                # 添加到接口属性定义列表（字段名和类型）
                interface_props.append(
                    f'        "{key}"?: {types[key]};    // {comment}'
                )

            # 生成数据数组项
            data_entries = []

            # 遍历所有数据行，为每行生成对应的TypeScript对象字面量
            for row_idx in range(2, excel_table.num_rows):
                # 当前行的所有字段键值对
                row_entries = []
                # 获取当前行第一列作为数据项的key值

                # 遍历所有键，处理当前行中的每个字段
                for col_idx, key in enumerate(keys):
                    # 获取当前行的单元格值
                    value = excel_table.get_value(row_idx, col_idx)
                    # 跳过空值或code列
                    if excel_table.custom_isna(value) or key == "code":
                        continue

                    # 获取字段值和推断的类型
                    type = self.excel_parser.infer_type_single(value)
                    # type = types[key]
                    # 添加到当前行的字段列表，格式为"字段名: 值"
                    # 字符串类型需要用引号包裹
                    if type == "string":
                        row_entries.append(f'        "{key}": "{value}"')
                    else:
                        # 其他类型直接使用值
                        row_entries.append(f'        "{key}": {value}')

                # 如果行有数据，将所有字段组装为一个对象字面量
                if row_entries:
                    # 使用大括号包裹所有字段，每个字段占一行，用逗号分隔
                    data_key = excel_table.get_value(
                        row_idx, 0
                    )  # 获取当前行第一列作为数据项的key值
                    data_entries.append(
                        f'    "{data_key}":{{\n{",\n".join(row_entries)}\n    }}'
                    )

            # 开始组装最终的TypeScript代码
            ts_code = []

            # 添加导入语句
            if imports:
                ts_code.extend(imports)  # 添加多个导入语句
                ts_code.append("")  # 添加空行分隔

            # 添加接口键定义（常量对象）
            ts_code.extend(
                [
                    f"export const {interface_keys_name} = [",  # 常量对象开始
                    ",".join(interface_keys),  # 所有键定义，逗号分隔
                    "];",  # 常量对象结束
                    "",  # 空行分隔
                ]
            )

            # 添加接口定义（数据结构定义）
            ts_code.extend(
                [
                    f"export interface {interface_name} {{",  # 接口定义开始
                    "    [key: string]: {",
                    "\n".join(interface_props),  # 所有属性定义，换行分隔
                    "    }",
                    "}",  # 接口定义结束
                    "",  # 空行分隔
                ]
            )

            # 添加数据数组定义（用于存储从Excel导入的数据）
            ts_code.extend(
                [
                    f"export const {data_name}: {interface_name} = {{",  # 数组定义开始，指定类型为接口数组
                    "\n".join(data_entries),  # 所有数据项，逗号分隔
                    "};",  # 数组定义结束
                    "",  # 空行分隔
                ]
            )

            # 添加类定义（用于封装数据和相关方法）
            ts_code.extend(
                [
                    f"export class {class_name} {{",  # 类定义开始
                    "    static Start() {",  # Start方法定义
                    f"        const data={data_name};",  # 引用数据数组
                ]
            )

            # 如果有其他代码，添加到Start方法中
            if other_code:
                # 添加所有其他代码行，每行前加缩进
                ts_code.append("        " + "\n        ".join(other_code))

            # 完成类定义
            ts_code.extend(
                ["    }", "}", ""]  # Start方法结束  # 类定义结束  # 文件末尾空行
            )

            # 确保输出目录存在，如果不存在则创建，前面已经创建过了
            # os.makedirs(output_dir, exist_ok=True)

            # 构造输出文件路径：输出目录 + 文件名
            output_file = os.path.join(output_dir, f"xlsx_{excel_name}.ts")
            # 打开文件并写入内容
            with open(output_file, "w", encoding="utf-8") as f:
                # 将所有代码行连接成一个字符串，每行以换行符分隔
                f.write("\n".join(ts_code))

            # 记录成功日志
            self.logger.info(f"成功生成TypeScript文件: {output_file}")
            # 返回生成的文件路径
            return output_file

        except Exception as e:
            # 捕获并记录任何异常
            self.logger.error(f"生成TypeScript文件时出错: {str(e)}")
            # 重新抛出异常，让调用者知道发生了错误
            raise

    def extract_ts_code(
        self, excel_table: ExcelTable, keys: List[str]
    ) -> Tuple[List[str], List[str]]:
        """
        从数据中提取TypeScript代码

        遍历数据行，查找包含TypeScript代码的列（名为"code"的列），
        并分离出导入语句和其他代码。

        Args:
            excel_table: Excel表格数据
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
            if code and excel_table.custom_notna(code):
                # 提取import语句（以"import "开头的行）
                # 1. 使用split('\n')将代码分割为多行
                # 2. 遍历每一行，找出以'import '开头的行
                # 3. 使用strip()去除行首尾的空白字符
                import_lines = [
                    line
                    for line in code.split("\n")
                    if line.strip().startswith("import ")
                ]
                # 将提取的import语句逐个添加到导入列表中
                imports.extend(import_lines)

                # 提取非import语句（不是空行且不以"import "开头的行）
                other_lines = [
                    line
                    for line in code.split("\n")
                    if not line.strip().startswith("import ")
                ]
                # 将提取的其他代码添加到其他代码列表中
                other_code.extend(other_lines)

        # 去除导入语句中的重复项
        imports = list(set(imports))  # set()创建集合，自动去重，然后转回列表

        # 返回导入语句和其他代码
        return imports, other_code
