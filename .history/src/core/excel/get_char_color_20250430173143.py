#!/usr/bin/env python
# -*- coding: utf-8 -*-

import xlwings as xw
import traceback
from typing import Dict, List, Tuple, Union, Optional
import os
import pandas as pd
import openpyxl
import logging


class ExcelCharColorReader:
    """
    Excel字符颜色读取器
    用于读取Excel单元格中每个字符的颜色信息，并转换为特定格式
    """

    def __init__(self, default_color: str = "000000"):
        """
        初始化Excel字符颜色读取器

        参数:
            default_color: 默认颜色（RGB格式，例如"000000"表示黑色）
        """
        # 默认颜色值，用于没有指定颜色的字符
        self.default_color = default_color
        # Excel应用程序实例
        self.app = None
        # 当前打开的工作簿
        self.workbook = None
        # 标记是否由本实例创建的Excel应用程序
        self.is_opened_by_me = False
        # 添加日志记录器
        self.logger = logging.getLogger(__name__)

    def open_workbook(self, file_path: str) -> None:
        """
        打开Excel工作簿

        参数:
            file_path: Excel文件路径
        """
        try:
            # 尝试获取已经打开的应用程序实例
            self.app = xw.apps.active
            if self.app is None:
                self.app = xw.App(visible=False)
                self.is_opened_by_me = True

            self.workbook = self.app.books.open(file_path)
        except Exception as e:
            print(f"打开Excel文件时出错: {str(e)}")
            print(f"异常堆栈: {traceback.format_exc()}")
            print(f"请求参数: file_path={file_path}")
            self.close()
            raise

    def close(self) -> None:
        """
        关闭工作簿和Excel应用程序
        """
        try:
            if self.workbook:
                self.workbook.close()
                self.workbook = None

            if self.is_opened_by_me and self.app:
                self.app.quit()
                self.app = None
                self.is_opened_by_me = False
        except Exception as e:
            print(f"关闭Excel时出错: {str(e)}")
            print(f"异常堆栈: {traceback.format_exc()}")

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()

    def rgb_to_formatted_color(self, rgb: Tuple[int, int, int]) -> str:
        """
        将RGB颜色转换为特定格式(|cffRRGGBB)

        参数:
            rgb: RGB颜色元组，例如(255, 0, 0)表示红色

        返回:
            格式化的颜色代码
        """
        try:
            if not rgb:
                return f"|cff{self.default_color}"

            # 将RGB颜色值解包为r,g,b三个分量
            r, g, b = rgb
            # 使用format()函数将每个分量转换为2位的16进制字符串
            # 例如: rgb=(255,0,0) -> |cffff0000
            return f"|cff{format(r, '02x')}{format(g, '02x')}{format(b, '02x')}"
        except Exception as e:
            print(f"转换RGB颜色时出错: {str(e)}")
            print(f"异常堆栈: {traceback.format_exc()}")
            print(f"请求参数: rgb={rgb}")
            return f"|cff{self.default_color}"

    def get_cell_with_color_tags(self, sheet_name: str, cell_address: str) -> Tuple[str, bool]:
        """
        获取单元格内容，并为每个不同颜色的字符添加颜色标签
        黑色文本(0,0,0)不添加颜色标签

        参数:
            sheet_name: 工作表名称
            cell_address: 单元格地址，例如"A1"

        返回:
            元组(添加了颜色标签的文本, 是否有颜色标签)
            第二个布尔值表示文本中是否包含非黑色(非0,0,0)颜色标签
        """
        try:
            if not self.workbook:
                raise ValueError("工作簿未打开，请先调用open_workbook方法")

            # 打印所有可用工作表，帮助调试
            available_sheets = [sheet.name for sheet in self.workbook.sheets]
            self.logger.debug(f"可用工作表列表: {available_sheets}")

            # 尝试获取工作表，避免直接使用in操作符
            try:
                sheet = self.workbook.sheets[sheet_name]
            except Exception as e:
                self.logger.warning(f"无法访问工作表'{sheet_name}'，错误: {str(e)}")
                self.logger.warning(f"可用工作表: {available_sheets}")
                # 尝试大小写不敏感的匹配
                found = False
                for available_sheet in available_sheets:
                    if available_sheet.lower() == sheet_name.lower():
                        self.logger.info(f"找到大小写不敏感匹配: '{available_sheet}'")
                        sheet = self.workbook.sheets[available_sheet]
                        found = True
                        break
                if not found:
                    return "", False

            try:
                # 尝试获取单元格
                cell = sheet.range(cell_address)
            except Exception as e:
                self.logger.warning(f"获取单元格失败: {cell_address}, 错误: {str(e)}")
                return "", False

            # 如果单元格为空，直接返回空字符串和False
            if not cell.value:
                return "", False

            # 将单元格值转换为字符串
            cell_value = str(cell.value)
            # 存储最终带颜色标签的结果
            result = ""
            # 记录当前处理的字符颜色
            current_color = None
            # 记录当前颜色下累积的文本
            current_text = ""
            # 是否有非黑色文本
            has_colored_text = False

            # 获取单元格中每个字符的格式信息
            for i in range(1, len(cell_value) + 1):
                # 使用xlwings获取字符的颜色信息
                char_range = cell.characters[i - 1]
                font = char_range.font

                # 获取RGB颜色, 添加异常处理
                try:
                    rgb_color = font.color
                except Exception:
                    # 如果获取颜色失败，使用默认黑色
                    self.logger.warning(f"获取字符{cell_value[i - 1]}颜色失败，使用默认黑色")
                    rgb_color = (0, 0, 0)

                # 如果没有颜色信息，使用默认黑色
                if rgb_color is None:
                    rgb_color = (0, 0, 0)

                # 检查是否有非黑色文本
                if rgb_color != (0, 0, 0):
                    has_colored_text = True

                # 如果颜色发生变化，添加颜色标签
                if rgb_color != current_color:
                    if current_text:
                        if current_color and current_color != (0, 0, 0):
                            # 添加前一段文本和结束标签（非黑色文本才添加颜色标签）
                            result += f"{self.rgb_to_formatted_color(current_color)}{current_text}|r"
                        else:
                            # 黑色文本或第一段文本没有颜色标签
                            result += current_text

                    current_color = rgb_color
                    current_text = cell_value[i - 1]
                else:
                    # 颜色相同，继续累积文本
                    current_text += cell_value[i - 1]

            # 处理最后一段文本
            if current_text:
                if current_color and current_color != (0, 0, 0):
                    result += f"{self.rgb_to_formatted_color(current_color)}{current_text}|r"
                else:
                    result += current_text

            return result, has_colored_text

        except Exception as e:
            self.logger.error(f"获取单元格颜色标签时出错: {str(e)}")
            self.logger.error(f"异常堆栈: {traceback.format_exc()}")
            self.logger.error(f"请求参数: sheet_name={sheet_name}, cell_address={cell_address}")
            # 发生异常时，返回原始单元格值（如果可获取）
            if "cell" in locals() and hasattr(cell, "value") and cell.value:
                return str(cell.value), False
            return "", False

    def process_workbook(self, file_path: str, sheet_name: str, df: pd.DataFrame) -> pd.DataFrame:
        """
        处理工作表中的数据行，为有颜色的单元格添加颜色标签

        参数:
            file_path: Excel文件路径
            sheet_name: 工作表名称
            df: 包含Excel数据的DataFrame

        返回:
            处理后的DataFrame，其中有颜色的单元格已添加颜色标签
        """
        try:
            self.open_workbook(file_path)

            # 从第三行开始处理数据（索引从0开始，所以是索引2）
            for row_idx in range(2, len(df)):
                for col_idx in range(len(df.columns)):
                    # 获取单元格地址，如A3, B4等
                    col_letter = openpyxl.utils.get_column_letter(col_idx + 1)
                    cell_address = f"{col_letter}{row_idx + 1}"  # Excel行从1开始，所以+1

                    # 获取带颜色标签的单元格内容和是否有颜色
                    cell_content, has_color = self.get_cell_with_color_tags(sheet_name, cell_address)

                    # 如果单元格有颜色，更新DataFrame中的值
                    if has_color:
                        df.iloc[row_idx, col_idx] = cell_content

            return df

        except Exception as e:
            print(f"处理工作簿时出错: {str(e)}")
            print(f"异常堆栈: {traceback.format_exc()}")
            print(f"请求参数: file_path={file_path}, sheet_name={sheet_name}")
            return df
        finally:
            self.close()

    # 保留原始的process_workbook方法，但重命名为process_cells
    def process_cells(self, file_path: str, cells_to_process: List[Tuple[str, str]]) -> Dict[str, str]:
        """
        处理工作簿中的多个单元格

        参数:
            file_path: Excel文件路径
            cells_to_process: 要处理的单元格列表，每个元素为(sheet_name, cell_address)元组

        返回:
            包含处理结果的字典，键为"sheet_name:cell_address"，值为带颜色标签的文本
        """
        result = {}
        try:
            self.open_workbook(file_path)

            for sheet_name, cell_address in cells_to_process:
                key = f"{sheet_name}:{cell_address}"
                cell_content, _ = self.get_cell_with_color_tags(sheet_name, cell_address)
                result[key] = cell_content

        except Exception as e:
            print(f"处理工作簿单元格时出错: {str(e)}")
            print(f"异常堆栈: {traceback.format_exc()}")
            print(f"请求参数: file_path={file_path}, cells_to_process={cells_to_process}")
        finally:
            self.close()

        return result


# 示例用法
if __name__ == "__main__":
    try:
        # 示例：读取指定Excel文件中的指定单元格，并添加颜色标签
        file_path = r"else\Test\input\test\test.xlsx"
        cells_to_process = [("Sheet1", "C3")]

        reader = ExcelCharColorReader()
        result = reader.process_cells(file_path, cells_to_process)

        for key, value in result.items():
            print(f"{key}: {value}")

    except Exception as e:
        print(f"示例运行时出错: {str(e)}")
        print(f"异常堆栈: {traceback.format_exc()}")
