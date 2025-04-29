# src/core/lua_generator.py
# Lua代码生成器模块

import os
import logging
from typing import Dict, List, Any, Tuple

from src.core.excel.excel_parser import ExcelParser
from src.core.excel.data_handler import ExcelTable


class LuaGenerator:
    """生成Lua代码的类
    
    这个类负责将从Excel提取的数据转换成Lua代码文件，
    包括生成表结构和数据常量。
    """

    def __init__(self):
        """初始化LuaGenerator类的新实例"""
        # 获取日志记录器
        self.logger = logging.getLogger(__name__)
        self.excel_parser = ExcelParser()

    def _value_to_lua_string(self, value: Any, indent_level: int = 2) -> str:
        """递归地将Python值转换为Lua表字符串表示形式"""
        indent = "    " * indent_level  # 4个空格作为一级缩进
        next_indent = "    " * (indent_level + 1)

        if isinstance(value, dict):
            items = []
            for k, v in value.items():
                # 键强制为字符串
                key_str = f'["{k}"]'
                # 递归转换值
                val_str = self._value_to_lua_string(v, indent_level + 1)
                items.append(f"{next_indent}{key_str} = {val_str}")
            if not items:
                return "{}"
            return f"{{\n{',\n'.join(items)}\n{indent}}}"  # 添加换行和缩进
        elif isinstance(value, list):
            items = []
            for item in value:
                # 递归转换列表项
                val_str = self._value_to_lua_string(item, indent_level + 1)
                items.append(f"{next_indent}{val_str}")
            if not items:
                return "{}"
            return f"{{\n{',\n'.join(items)}\n{indent}}}"  # 添加换行和缩进
        elif isinstance(value, str):
            type = ExcelParser.infer_type_single(value)
            if type == "string":
                return f'"{repr(value)[1:-1]}"'
            elif type == "bool":
                return value.lower()
        elif isinstance(value, bool):
            return str(value).lower()  # true/false
        elif isinstance(value, (int, float)):
            return str(value)
        elif value is None:
            return "nil"
        else:
            return value

    def generate_lua_file(self, excel_name: str,
                          sheets_data: List[Dict[str, Any]], output_dir: str):
        """
        生成Lua文件
        
        Args:
            excel_name: Excel文件名（不含扩展名）
            sheets_data: 工作表数据列表
            output_dir: 输出目录
        """
        # 过滤掉物编表格
        non_object_sheets = [
            metadata for metadata in sheets_data
            if not metadata.get("is_object_table", False)
        ]

        if not non_object_sheets:
            self.logger.info(f"所有sheet都是物编表格，跳过生成Lua文件: {excel_name}")
            return

        # 如果只有一个sheet，省略sheet名
        if len(non_object_sheets) == 1:
            metadata = non_object_sheets[0]

            # 生成Lua文件
            output_file_name = self.lua_handle(excel_name, metadata,
                                               output_dir)
            self.logger.info(f"成功生成 lua 文件: {output_file_name}")

        else:
            # 有多个sheet，为每个sheet生成独立的Lua文件
            for metadata in non_object_sheets:
                sheet_name = metadata["sheet_name"]
                # 为了确保sheet名适合作为变量名的一部分，替换掉不允许的字符
                safe_sheet_name = self._sanitize_sheet_name(sheet_name)

                # 生成带有sheet名的文件名
                sheet_excel_name = f"{excel_name}_{safe_sheet_name}"

                try:
                    # 生成Lua文件
                    output_file_name = self.lua_handle(
                        sheet_excel_name,
                        metadata,
                        output_dir,
                    )

                    self.logger.info(
                        f"正在处理{sheet_name}，成功生成: {output_file_name}")
                except Exception as sheet_e:
                    self.logger.error(
                        f"处理sheet {sheet_name} 时出错: {str(sheet_e)}")

    def _sanitize_sheet_name(self, sheet_name: str) -> str:
        """
        清理sheet名称，使其适合作为变量名的一部分
        
        Args:
            sheet_name: 原始sheet名称
            
        Returns:
            清理后的sheet名称
        """
        # 替换空格为下划线
        sanitized = sheet_name.replace(" ", "_")

        # 过滤出合法的标识符字符
        sanitized = "".join(c for c in sanitized if c.isalnum() or c == "_")

        # 确保不以数字开头
        if sanitized and sanitized[0].isdigit():
            sanitized = "s" + sanitized

        # 如果清理后为空，使用默认名称
        if not sanitized:
            sanitized = "sheet"

        return sanitized

    def lua_handle(self, excel_name: str, metadata: Dict[str, Any],
                   output_dir: str):
        """
        生成Lua文件内容
        
        Args:
            excel_name: Excel文件名（不含扩展名）
            metadata: Excel元数据
            output_dir: 输出目录
            
        Returns:
            生成的文件路径
        """
        try:
            excel_table: ExcelTable = metadata.get("excel_table")
            filename: str = metadata.get("filename")
            # 文件名，扩展名
            name, extension = os.path.splitext(filename)
            extension = extension.replace(r".", "")
            # 表格第一行注释
            comments = excel_table.get_comments()
            # 表格第二行注释key
            keys = excel_table.get_keys()

            # 生成不同Lua元素的名称，基于Excel文件名
            # 键名常量
            keys_name = f"{extension}_keys_{excel_name}"
            # 数据表名称
            data_name = f"{extension}_data_{excel_name}"

            # 用于收集生成的Lua代码片段
            lua_code = []

            # 添加键名表
            lua_code.extend([
                f"{keys_name} = {{",  # 表开始
                "    " + ", ".join(f'"{key}"'
                                   for key in keys if key != "code"),  # 所有键名
                "}",
                "",  # 空行分隔
            ])

            # 添加数据表定义
            lua_code.extend([
                f"{data_name} = {{",  # 表开始
            ])

            # 遍历所有数据行，为每行生成对应的Lua表
            for row_idx in range(2, excel_table.num_rows):
                row_entries = []
                # 获取当前行第一列作为数据项的key值
                data_key = excel_table.get_value(row_idx, 0)

                if not data_key:
                    continue

                # 添加行开始 - 强制使用字符串键名
                lua_code.append(f'    ["{data_key}"] = {{')

                # 遍历所有键，处理当前行中的每个字段
                for col_idx, key in enumerate(keys):
                    # 获取当前行的单元格值
                    value = excel_table.get_value(row_idx, col_idx)
                    # 跳过空值或code列
                    if ExcelTable.custom_isna(value) or key == "code":
                        continue

                    # 使用辅助函数转换值为Lua字符串
                    # 注意：顶层缩进是2级（行内），所以传入 indent_level=2
                    lua_value_str = self._value_to_lua_string(value,
                                                              indent_level=2)
                    lua_code.append(
                        f'        ["{key}"] = {lua_value_str},')  # 键总是字符串形式

                # 添加行结束
                lua_code.append("    },")

            # 添加数据表结束
            lua_code.extend([
                "}",
                "",  # 空行分隔
            ])

            # 构造输出文件路径
            output_file = os.path.join(output_dir,
                                       f"{extension}_{excel_name}.lua")

            # 写入文件
            with open(output_file, "w", encoding="utf-8") as f:
                f.write("\n".join(lua_code))

            self.logger.info(f"成功生成Lua文件: {output_file}")
            return output_file

        except Exception as e:
            self.logger.error(f"生成Lua文件时出错: {str(e)}")
            raise
