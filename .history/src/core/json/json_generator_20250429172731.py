import os
import json
import logging
from typing import Dict, List, Any

from src.core.excel.excel_parser import ExcelParser
from src.core.excel.data_handler import ExcelTable


class JSONGenerator:
    """生成JSON文件的类
    
    这个类负责将从Excel提取的数据转换成JSON文件，
    使用Python的json库进行序列化。
    """

    def __init__(self):
        """初始化JSONGenerator类的新实例"""
        # 获取日志记录器
        self.logger = logging.getLogger(__name__)
        self.excel_parser = ExcelParser()

    def generate_json_file(self, excel_name: str,
                           sheets_data: List[Dict[str, Any]], output_dir: str):
        """
        生成JSON文件
        
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
            self.logger.info(f"所有sheet都是物编表格，跳过生成JSON文件: {excel_name}")
            return

        # 如果只有一个sheet，省略sheet名
        if len(non_object_sheets) == 1:
            metadata = non_object_sheets[0]

            # 生成JSON文件
            output_file_name = self.json_handle(excel_name, metadata,
                                                output_dir)
            self.logger.info(f"成功生成 json 文件: {output_file_name}")

        else:
            # 有多个sheet，为每个sheet生成独立的JSON文件
            for metadata in non_object_sheets:
                sheet_name = metadata["sheet_name"]
                # 为了确保sheet名适合作为变量名的一部分，替换掉不允许的字符
                safe_sheet_name = self._sanitize_sheet_name(sheet_name)

                # 生成带有sheet名的文件名
                sheet_excel_name = f"{excel_name}_{safe_sheet_name}"

                try:
                    # 生成JSON文件
                    output_file_name = self.json_handle(
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

    def json_handle(self, excel_name: str, metadata: Dict[str, Any],
                    output_dir: str):
        """
        生成JSON文件内容
        
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

            # 表格第二行注释key
            keys = excel_table.get_keys()

            # 生成不同JSON元素的名称，基于Excel文件名
            # 键名常量
            keys_name = f"{extension}_keys_{excel_name}"
            # 数据表名称
            data_name = f"{extension}_data_{excel_name}"

            # 创建JSON数据结构
            json_data = {}

            # 添加键名列表
            json_data[keys_name] = [key for key in keys if key != "code"]

            # 直接使用get_data_dict获取数据字典
            data_dict = excel_table.get_data_dict()

            # 添加数据字典到JSON数据结构
            json_data[data_name] = data_dict

            # 构造输出文件路径
            output_file = os.path.join(output_dir,
                                       f"{extension}_{excel_name}.json")

            # 写入JSON文件
            with open(output_file, "w", encoding="utf-8") as f:
                json.dump(json_data, f, ensure_ascii=False, indent=4)

            self.logger.info(f"成功生成JSON文件: {output_file}")
            return output_file

        except Exception as e:
            self.logger.error(f"生成JSON文件时出错: {str(e)}")
            raise
