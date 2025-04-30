#!/usr/bin/env python
# -*- coding: utf-8 -*-

import xlwings as xw
import traceback
from typing import Dict, List, Tuple, Union, Optional
import os


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

    def get_cell_with_color_tags(self, sheet_name: str, cell_address: str) -> str:
        """
        获取单元格内容，并为每个不同颜色的字符添加颜色标签

        参数:
            sheet_name: 工作表名称
            cell_address: 单元格地址，例如"A1"

        返回:
            添加了颜色标签的文本
        """
        try:
            if not self.workbook:
                raise ValueError("工作簿未打开，请先调用open_workbook方法")

            sheet = self.workbook.sheets[sheet_name]
            cell = sheet.range(cell_address)

            # 如果单元格为空，直接返回空字符串
            if not cell.value:
                return ""

            # 将单元格值转换为字符串
            cell_value = str(cell.value)
            # 存储最终带颜色标签的结果
            result = ""
            # 记录当前处理的字符颜色
            current_color = None
            # 记录当前颜色下累积的文本
            current_text = ""

            # 获取单元格中每个字符的格式信息
            for i in range(1, len(cell_value) + 1):
                # 使用xlwings获取字符的颜色信息
                char_range = cell.characters[i : i + 1]
                font = char_range.font

                # 获取RGB颜色
                rgb_color = font.color

                # 如果没有颜色信息，使用默认黑色
                if rgb_color is None:
                    rgb_color = (0, 0, 0)

                # 如果颜色发生变化，添加颜色标签
                if rgb_color != current_color:
                    if current_text:
                        if current_color:
                            # 添加前一段文本和结束标签
                            result += f"{self.rgb_to_formatted_color(current_color)}{current_text}|r"
                        else:
                            # 第一段文本没有前一段
                            result += current_text

                    current_color = rgb_color
                    current_text = cell_value[i - 1]
                else:
                    # 颜色相同，继续累积文本
                    current_text += cell_value[i - 1]

            # 处理最后一段文本
            if current_text:
                if current_color:
                    result += f"{self.rgb_to_formatted_color(current_color)}{current_text}|r"
                else:
                    result += current_text

            return result

        except Exception as e:
            print(f"获取单元格颜色标签时出错: {str(e)}")
            print(f"异常堆栈: {traceback.format_exc()}")
            print(f"请求参数: sheet_name={sheet_name}, cell_address={cell_address}")
            return str(cell.value) if "cell" in locals() and cell.value else ""

    def process_workbook(self, file_path: str, cells_to_process: List[Tuple[str, str]]) -> Dict[str, str]:
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
                result[key] = self.get_cell_with_color_tags(sheet_name, cell_address)

        except Exception as e:
            print(f"处理工作簿时出错: {str(e)}")
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
        result = reader.process_workbook(file_path, cells_to_process)

        for key, value in result.items():
            print(f"{key}: {value}")

    except Exception as e:
        print(f"示例运行时出错: {str(e)}")
        print(f"异常堆栈: {traceback.format_exc()}")
