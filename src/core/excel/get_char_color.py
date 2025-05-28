#!/usr/bin/env python
# -*- coding: utf-8 -*-

import xlwings as xw
import traceback
from typing import Dict, List, Tuple, Union, Optional
import os
import pandas as pd
import openpyxl
import logging
import concurrent.futures
from functools import lru_cache
import time
import uuid
import shutil
import tempfile
import atexit

from src.core.excel.data_handler import ExcelTable


class TempFileManager:
    """
    临时文件管理器
    负责创建、管理和清理临时文件
    """

    _instance = None
    _temp_files = set()  # 记录所有创建的临时文件
    _temp_dir = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(TempFileManager, cls).__new__(cls)
            cls._instance._initialize()
        return cls._instance

    def _initialize(self):
        """初始化临时文件管理器"""
        self.logger = logging.getLogger(__name__ + ".TempFileManager")
        # 创建临时目录
        self._temp_dir = tempfile.mkdtemp(prefix="war3excel_")
        self.logger.info(f"创建临时目录: {self._temp_dir}")
        # 注册退出时清理
        atexit.register(self.cleanup_all)

    def create_temp_file(self, source_file: str, prefix: str = "") -> str:
        """
        创建临时文件
        
        参数:
            source_file: 源文件路径
            prefix: 文件名前缀
            
        返回:
            临时文件路径
        """
        if not os.path.exists(source_file):
            raise FileNotFoundError(f"源文件不存在: {source_file}")

        # 生成唯一文件名
        base_name = os.path.basename(source_file)
        unique_id = str(uuid.uuid4())[:8]
        if prefix:
            temp_filename = f"{prefix}_{unique_id}_{base_name}"
        else:
            temp_filename = f"{unique_id}_{base_name}"

        temp_file_path = os.path.join(self._temp_dir, temp_filename)

        try:
            # 复制文件
            shutil.copy2(source_file, temp_file_path)
            # 记录临时文件
            self._temp_files.add(temp_file_path)
            self.logger.debug(f"创建临时文件: {temp_file_path}")
            return temp_file_path
        except Exception as e:
            self.logger.error(f"创建临时文件失败: {str(e)}", exc_info=True)
            raise

    def remove_temp_file(self,
                         temp_file_path: str,
                         max_retries: int = 5,
                         retry_delay: float = 0.5) -> bool:
        """
        安全删除临时文件，支持多次重试
        
        参数:
            temp_file_path: 临时文件路径
            max_retries: 最大重试次数
            retry_delay: 重试间隔(秒)
            
        返回:
            是否删除成功
        """
        if not os.path.exists(temp_file_path):
            # 如果文件已经不存在，从集合中移除并返回成功
            if temp_file_path in self._temp_files:
                self._temp_files.remove(temp_file_path)
            return True

        success = False
        attempts = 0

        while not success and attempts < max_retries:
            try:
                os.remove(temp_file_path)
                # 删除成功，从集合中移除
                if temp_file_path in self._temp_files:
                    self._temp_files.remove(temp_file_path)
                self.logger.debug(f"删除临时文件成功: {temp_file_path}")
                success = True
            except Exception as e:
                attempts += 1
                if attempts >= max_retries:
                    self.logger.warning(
                        f"无法删除临时文件 {temp_file_path} (尝试 {attempts}/{max_retries}): {str(e)}"
                    )
                else:
                    self.logger.debug(
                        f"删除临时文件失败，将在{retry_delay}秒后重试: {temp_file_path}")
                    # 等待一小段时间，让系统释放文件句柄
                    time.sleep(retry_delay)

        return success

    def cleanup_all(self):
        """清理所有临时文件和临时目录"""
        # 复制一份文件列表，因为在循环中会修改原集合
        temp_files = self._temp_files.copy()

        for temp_file in temp_files:
            try:
                self.remove_temp_file(temp_file)
            except Exception as e:
                self.logger.warning(f"清理临时文件时出错: {temp_file} - {str(e)}")

        # 尝试删除临时目录
        if self._temp_dir and os.path.exists(self._temp_dir):
            try:
                shutil.rmtree(self._temp_dir)
                self.logger.info(f"删除临时目录: {self._temp_dir}")
            except Exception as e:
                self.logger.warning(f"删除临时目录时出错: {self._temp_dir} - {str(e)}")


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
        # Excel解析器实例
        from src.core.excel.excel_parser import ExcelParser

        self.excel_parser = ExcelParser()
        # 添加颜色缓存以减少重复计算
        self.color_cache = {}
        # 临时文件管理器
        self.temp_file_manager = TempFileManager()
        # 当前使用的临时文件路径
        self.current_temp_file = None

    def open_workbook(self, file_path: str) -> None:
        """
        打开Excel工作簿

        参数:
            file_path: Excel文件路径
        """
        try:
            # 创建临时文件以避免直接修改原文件
            temp_file = self.temp_file_manager.create_temp_file(
                file_path, "color_reader")
            self.current_temp_file = temp_file

            # 尝试获取已经打开的应用程序实例
            self.app = xw.apps.active
            if self.app is None:
                self.app = xw.App(visible=False)
                self.is_opened_by_me = True

            self.workbook = self.app.books.open(temp_file)
        except Exception as e:
            self.logger.error(f"打开Excel文件时出错: {str(e)}", exc_info=True)
            self.logger.error(f"请求参数: file_path={file_path}")
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

            # 清理临时文件
            if self.current_temp_file:
                self.temp_file_manager.remove_temp_file(self.current_temp_file)
                self.current_temp_file = None

        except Exception as e:
            self.logger.error(f"关闭Excel时出错: {str(e)}", exc_info=True)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()

    @lru_cache(maxsize=128)
    def rgb_to_formatted_color(self, r: int, g: int, b: int) -> str:
        """
        将RGB颜色转换为特定格式(|cffRRGGBB)，添加缓存以提高性能

        参数:
            r: 红色分量 (0-255)
            g: 绿色分量 (0-255)
            b: 蓝色分量 (0-255)

        返回:
            格式化的颜色代码
        """
        try:
            # 使用format()函数将每个分量转换为2位的16进制字符串
            # 例如: rgb=(255,0,0) -> |cffff0000
            return f"|cff{format(r, '02x')}{format(g, '02x')}{format(b, '02x')}"
        except Exception as e:
            self.logger.error(f"转换RGB颜色时出错: {str(e)}", exc_info=True)
            self.logger.error(f"请求参数: r={r}, g={g}, b={b}")
            return f"|cff{self.default_color}"

    def format_rgb_color(self, rgb: Tuple[int, int, int]) -> str:
        """
        将RGB元组转换为格式化的颜色代码

        参数:
            rgb: RGB颜色元组，例如(255, 0, 0)表示红色

        返回:
            格式化的颜色代码
        """
        if not rgb:
            return f"|cff{self.default_color}"

        # 将RGB颜色值解包为r,g,b三个分量
        r, g, b = rgb
        # 使用带缓存的方法
        return self.rgb_to_formatted_color(r, g, b)

    def get_cell_with_color_tags(self, sheet_name: str,
                                 cell_address: str) -> Tuple[str, bool]:
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
            cell_value = str(cell.value).strip(r' "')
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
                            result += f"{self.format_rgb_color(current_color)}{current_text}|r"
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
                    result += f"{self.format_rgb_color(current_color)}{current_text}|r"
                else:
                    result += current_text

            return result, has_colored_text

        except Exception as e:
            self.logger.error(f"获取单元格颜色标签时出错: {str(e)}")
            self.logger.error(f"异常堆栈: {traceback.format_exc()}")
            self.logger.error(
                f"请求参数: sheet_name={sheet_name}, cell_address={cell_address}")
            # 发生异常时，返回原始单元格值（如果可获取）
            if "cell" in locals() and hasattr(cell, "value") and cell.value:
                return str(cell.value), False
            return "", False

    def process_cell_batch(
            self, file_path: str, sheet_name: str,
            batch_cells: List[Tuple[int, int,
                                    int]]) -> List[Tuple[int, int, str]]:
        """
        批量处理一组单元格，用于多线程处理

        参数:
            file_path: Excel文件路径
            sheet_name: 工作表名称
            batch_cells: 要处理的单元格列表，每个元素为(row_idx, col_idx, col_letter)元组

        返回:
            处理结果列表，每个元素为(row_idx, col_idx, content)元组
        """
        try:
            results = []
            # 使用with语句确保无论是否发生异常，文件都会被正确关闭
            with self:
                self.open_workbook(file_path)
                for row_idx, col_idx, col_letter in batch_cells:
                    cell_address = f"{col_letter}{row_idx + 1}"  # Excel行从1开始，所以+1
                    # 获取带颜色标签的单元格内容和是否有颜色
                    cell_content, has_color = self.get_cell_with_color_tags(
                        sheet_name, cell_address)
                    if has_color:
                        results.append((row_idx, col_idx, cell_content))
            return results
        except Exception as e:
            self.logger.error(f"处理批量单元格时出错: {str(e)}")
            self.logger.error(f"异常堆栈: {traceback.format_exc()}")
            return []

    def process_workbook(self, file_path: str, sheet_name: str,
                         df: pd.DataFrame) -> pd.DataFrame:
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
            # 检查是否启用颜色识别
            from src.utils.config_manager import ConfigManager
            config_manager = ConfigManager()
            if not config_manager.get("enable_color_recognition", True):
                self.logger.info("颜色识别功能已禁用，跳过颜色处理")
                return df

            # 收集需要处理的单元格
            cells_to_process = []
            for row_idx in range(2, len(df)):
                for col_idx in range(len(df.columns)):
                    # 获取单元格值和注释
                    value = df.iloc[row_idx, col_idx]
                    comment = df.iloc[0, col_idx]  # 第一行的注释，用于识别#color预处理指令
                    type_value = self.excel_parser.infer_type_single(value)

                    # 只处理非数字和布尔值的单元格，还有非空的单元格，没有#color不处理
                    if type_value in ("number", "boolean") or \
                       ExcelTable.custom_isna(value) or \
                       not isinstance(comment, str) or \
                       "#color" not in comment:
                        continue

                    # 获取列字母
                    col_letter = openpyxl.utils.get_column_letter(col_idx + 1)
                    cells_to_process.append((row_idx, col_idx, col_letter))

            # 如果没有需要处理的单元格，直接返回
            if not cells_to_process:
                return df

            # 获取系统可用线程数
            from src.utils.config_manager import ConfigManager
            config_manager = ConfigManager()
            thread_count = config_manager.get("thread_count", 0)
            if thread_count <= 0:
                thread_count = min(8,
                                   os.cpu_count() + 4) if os.cpu_count() else 4

            # 创建临时文件
            temp_file = self.temp_file_manager.create_temp_file(
                file_path, "color_batch")

            # 如果处理的单元格数量很少，不使用多线程
            if len(cells_to_process) < 10:
                # 直接处理所有单元格
                try:
                    with self:
                        self.open_workbook(temp_file)
                        for row_idx, col_idx, col_letter in cells_to_process:
                            cell_address = f"{col_letter}{row_idx + 1}"
                            cell_content, has_color = self.get_cell_with_color_tags(
                                sheet_name, cell_address)
                            if has_color:
                                df.iloc[row_idx, col_idx] = cell_content
                except Exception as e:
                    self.logger.error(f"处理单元格颜色标签时出错: {str(e)}", exc_info=True)
            else:
                # 使用多线程处理大量单元格
                try:
                    # 将单元格分批，每批包含thread_count个单元格
                    batch_size = max(10,
                                     len(cells_to_process) // thread_count + 1)
                    batches = [
                        cells_to_process[i:i + batch_size]
                        for i in range(0, len(cells_to_process), batch_size)
                    ]

                    results = []
                    # 使用多线程处理每批单元格
                    with concurrent.futures.ThreadPoolExecutor(
                            max_workers=thread_count) as executor:
                        # 提交任务，为每个批次创建一个新的ExcelCharColorReader实例
                        futures = [
                            executor.submit(
                                ExcelCharColorReader().process_cell_batch,
                                temp_file, sheet_name, batch)
                            for batch in batches
                        ]

                        # 收集结果
                        for future in concurrent.futures.as_completed(futures):
                            batch_results = future.result()
                            if batch_results:
                                results.extend(batch_results)

                    # 更新DataFrame中的单元格值
                    for row_idx, col_idx, content in results:
                        df.iloc[row_idx, col_idx] = content
                except Exception as e:
                    self.logger.error(f"使用多线程处理单元格时出错: {str(e)}",
                                      exc_info=True)

            # 处理完成后删除临时文件
            self.temp_file_manager.remove_temp_file(temp_file)
            return df

        except Exception as e:
            self.logger.error(f"处理工作簿时出错: {str(e)}", exc_info=True)
            return df

    # 保留原始的process_cells方法，但使用新的rgb_to_formatted_color方法
    def process_cells(
            self, file_path: str,
            cells_to_process: List[Tuple[str, str]]) -> Dict[str, str]:
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
            # 使用with语句确保无论是否发生异常，文件都会被正确关闭
            with self:
                self.open_workbook(file_path)

                for sheet_name, cell_address in cells_to_process:
                    key = f"{sheet_name}:{cell_address}"
                    cell_content, _ = self.get_cell_with_color_tags(
                        sheet_name, cell_address)
                    result[key] = cell_content

        except Exception as e:
            print(f"处理工作簿单元格时出错: {str(e)}")
            print(f"异常堆栈: {traceback.format_exc()}")
            print(
                f"请求参数: file_path={file_path}, cells_to_process={cells_to_process}"
            )

        return result


# 示例用法
if __name__ == "__main__":
    try:
        # 示例：读取指定Excel文件中的指定单元格，并添加颜色标签
        file_path = r"else\Test\input\test\test.xlsx"
        cells_to_process = [("Sheet1", "C3")]

        # 使用with语句确保资源正确关闭
        with ExcelCharColorReader() as reader:
            result = reader.process_cells(file_path, cells_to_process)

            for key, value in result.items():
                print(f"{key}: {value}")

    except Exception as e:
        print(f"示例运行时出错: {str(e)}")
        print(f"异常堆栈: {traceback.format_exc()}")
