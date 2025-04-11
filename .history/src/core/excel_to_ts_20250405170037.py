import os
import pandas as pd
from typing import List, Dict, Any, Optional, Tuple
import traceback
from src.core.data_handler import ExcelTable


class ExcelToTypeScript:
    """
    将Excel数据转换为TypeScript接口和常量数据的类。
    
    该类使用ExcelTable类处理Excel数据，并根据Excel文件的结构和内容
    生成TypeScript代码。
    """

    def __init__(self):
        """初始化ExcelToTypeScript转换器。"""
        pass

    def convert_excel_to_ts(self, excel_file_path: str,
                            output_dir: str) -> List[str]:
        """
        将Excel文件转换为TypeScript接口和常量。
        
        参数:
            excel_file_path (str): 要转换的Excel文件路径
            output_dir (str): TypeScript文件保存的目录
            
        返回:
            List[str]: 生成的TypeScript文件路径列表
            
        异常:
            FileNotFoundError: 如果Excel文件不存在
            ValueError: 如果处理Excel文件时出错
        """
        try:
            # 检查Excel文件是否存在
            if not os.path.exists(excel_file_path):
                raise FileNotFoundError(f"未找到Excel文件: {excel_file_path}")

            # 检查输出目录是否存在，如果不存在则创建
            os.makedirs(output_dir, exist_ok=True)

            # 读取Excel文件的所有工作表
            xl = pd.ExcelFile(excel_file_path)
            sheet_names = xl.sheet_names

            generated_files = []

            # 处理每个工作表
            for sheet_name in sheet_names:
                # 读取工作表数据
                df = pd.read_excel(excel_file_path,
                                   sheet_name=sheet_name,
                                   header=None)

                # 创建ExcelTable实例
                excel_table = ExcelTable(df)

                # 生成TypeScript接口
                interface_code = self._generate_interface(
                    sheet_name, excel_table)

                # 生成TypeScript常量数据
                constants_code = self._generate_constants(
                    sheet_name, excel_table)

                # 保存TypeScript文件
                base_filename = self._sanitize_filename(sheet_name)

                # 保存接口文件
                interface_file_path = os.path.join(
                    output_dir, f"{base_filename}.interface.ts")
                with open(interface_file_path, "w", encoding="utf-8") as f:
                    f.write(interface_code)
                generated_files.append(interface_file_path)

                # 保存常量文件
                constants_file_path = os.path.join(output_dir,
                                                   f"{base_filename}.data.ts")
                with open(constants_file_path, "w", encoding="utf-8") as f:
                    f.write(constants_code)
                generated_files.append(constants_file_path)

            return generated_files

        except Exception as e:
            error_msg = f"将Excel转换为TypeScript时出错: {str(e)}\n{traceback.format_exc()}"
            raise ValueError(error_msg)

    def _sanitize_filename(self, name: str) -> str:
        """
        将工作表名称转换为有效的文件名。
        
        参数:
            name (str): 需要处理的工作表名称
            
        返回:
            str: 处理后的文件名
        """
        # 将空格和特殊字符替换为下划线
        sanitized = "".join(c if c.isalnum() else "_" for c in name)

        # 转换为驼峰命名法
        parts = sanitized.split("_")
        sanitized = parts[0].lower() + "".join(p.capitalize()
                                               for p in parts[1:] if p)

        return sanitized

    def _generate_interface(self, sheet_name: str,
                            excel_table: ExcelTable) -> str:
        """
        从Excel数据生成TypeScript接口。
        
        参数:
            sheet_name (str): Excel工作表名称
            excel_table (ExcelTable): 包含数据的ExcelTable实例
            
        返回:
            str: TypeScript接口代码
        """
        # 将工作表名称转换为帕斯卡命名法作为接口名称
        interface_name = "".join(word.capitalize()
                                 for word in sheet_name.split())

        # 开始接口声明
        ts_code = [
            "// 自动生成的TypeScript接口",
            f"export interface {interface_name} {{",
        ]

        # 为每列添加属性
        for key, column_info in excel_table.get_all_column_info().items():
            # 如果有注释，添加JSDoc注释
            if column_info.comment:
                ts_code.append(f"  /** {column_info.comment} */")

            # 添加属性及其类型(默认使用'any')
            ts_type = getattr(column_info, 'type', 'any')
            ts_code.append(f"  {key}: {ts_type};")

        # 闭合接口
        ts_code.append("}")

        # 将代码作为字符串返回
        return "\n".join(ts_code)

    def _generate_constants(self, sheet_name: str,
                            excel_table: ExcelTable) -> str:
        """
        从Excel数据生成TypeScript常量。
        
        参数:
            sheet_name (str): Excel工作表名称
            excel_table (ExcelTable): 包含数据的ExcelTable实例
            
        返回:
            str: TypeScript常量代码
        """
        # 将工作表名称转换为帕斯卡命名法作为类型名称，并为变量名使用驼峰命名法
        type_name = "".join(word.capitalize() for word in sheet_name.split())
        var_name = type_name[0].lower() + type_name[1:] + "Data"

        # 开始导入语句和常量声明
        ts_code = [
            "// 自动生成的TypeScript常量",
            f"import {{ {type_name} }} from './{self._sanitize_filename(sheet_name)}.interface';",
            "",
            f"export const {var_name}: {type_name}[] = [",
        ]

        # 将每行添加为对象
        for idx, row in excel_table.for_rows():
            # 开始对象
            ts_code.append("  {")

            # 为每列添加属性
            for key in excel_table.get_all_column_info().keys():
                value = row[key]

                # 根据值的类型格式化
                if value is None:
                    formatted_value = "null"
                elif isinstance(value, bool):
                    formatted_value = str(value).lower()
                elif isinstance(value, (int, float)):
                    formatted_value = str(value)
                else:
                    # 转义特殊字符并用引号包围
                    formatted_value = f'"{str(value).replace(' "', '\\" ')}"'

                ts_code.append(f'    {key}: {formatted_value},')

            # 闭合对象
            ts_code.append("  },")

        # 闭合数组并导出
        ts_code.append("];")

        # 将代码作为字符串返回
        return "\n".join(ts_code)


# 使用示例:
if __name__ == "__main__":
    converter = ExcelToTypeScript()
    excel_path = "example.xlsx"
    output_dir = "ts_output"

    try:
        generated_files = converter.convert_excel_to_ts(excel_path, output_dir)
        print(f"生成了 {len(generated_files)} 个TypeScript文件:")
        for file_path in generated_files:
            print(f"  - {file_path}")
    except Exception as e:
        print(f"错误: {str(e)}")
