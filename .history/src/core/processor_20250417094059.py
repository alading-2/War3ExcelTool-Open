# src/core/processor.py

import os
from .excel_parser import ExcelParser
from .ts_generator import TSGenerator
# 当其他生成器/解析器创建时导入它们
# from .lua_generator import LuaGenerator # Lua生成器
# from .ini_generator import IniGenerator # Ini生成器
# from .ini_parser import IniParser # Ini解析器
# from .excel_writer import ExcelWriter # Excel写入器
from ..utils.file_utils import find_excel_files, ensure_directory
from PyQt5.QtCore import  QThread, pyqtSignal
import logging

logger = logging.getLogger(__name__)

class ConversionWorker(QThread):
    """处理文件转换的后台线程类"""

    progress_updated = pyqtSignal(int, int, str)  # 当前进度, 总数, 当前文件
    conversion_done = pyqtSignal(bool, str)  # 成功/失败, 消息
    log_message = pyqtSignal(str)  # 日志消息

    def __init__(self, config: dict):
        """
        初始化转换工作线程

        Args:
            config: 包含所有转换配置的字典
        """
        super().__init__()
        self.config = config
        # 不再需要像 input_dir, output_dir 等单独的属性
        # 核心组件现在在 process_files 中使用

    def run(self):
        """运行转换过程，调用核心处理函数"""
        try:
            self.log_message.emit("开始文件转换...")
            # 调用核心处理逻辑，该函数负责实际的文件处理
            # 注意：process_files 理想情况下应处理日志记录和进度报告
            # 目前，我们将依赖其返回值和此处的基日志记录。
            results = self.process_files(self.config)

            # --- 处理转换结果 --- 
            # 从返回的字典中提取处理统计信息
            processed_count = results.get("processed", 0) # 成功处理的文件数
            skipped_count = results.get("skipped", 0)   # 跳过的文件数
            error_count = results.get("errors", 0)     # 发生错误的文件数
            total_attempted = processed_count + skipped_count + error_count # 尝试处理的总数

            # 发送最终进度更新信号 (简化处理，视为100%完成)
            # 使用 "完成" 作为当前文件名占位符
            self.progress_updated.emit(total_attempted, total_attempted, "完成") # 简化处理

            # --- 记录详细日志 --- 
            # 遍历结果中的详细信息列表
            for detail in results.get("details", []):
                file = detail.get("file", "未知文件")
                status = detail.get("status", "未知状态")
                reason = detail.get("reason", "")
                # 根据状态记录不同类型的日志消息
                if status == "error":
                    self.log_message.emit(f"错误: 处理 {file} 失败 - {reason}")
                elif status == "skipped":
                     self.log_message.emit(f"跳过: {file} - {reason}")
                # else: # 已处理 (成功处理的消息应由 process_files 内部记录)
                #     self.log_message.emit(f"成功: 处理 {file}") # process_files 应记录成功信息

            # --- 发送最终状态信号 --- 
            # 根据是否有错误发送不同的完成信号和消息
            if error_count > 0:
                message = f"转换完成，但有 {error_count} 个错误。查看日志获取详情。"
                self.conversion_done.emit(False, message) # 发送失败信号
            else:
                message = f"转换成功完成。处理: {processed_count}, 跳过: {skipped_count}."
                self.conversion_done.emit(True, message) # 发送成功信号

        except Exception as e:
            # 捕获转换过程中未预料的异常
            self.log_message.emit(f"转换过程中发生严重错误: {str(e)}")
            # 记录完整的错误堆栈信息，便于调试
            import traceback
            self.log_message.emit(traceback.format_exc())
            # 发送失败信号，包含错误信息
            self.conversion_done.emit(False, f"转换过程出错: {str(e)}")

    # _sanitize_sheet_name 现在可能在特定的生成器中需要，而不是在这里。

    def process_files(self,config: dict):
        """文件转换的核心处理逻辑。"""
        logger.info("开始文件处理...")
        results = {
            "processed": 0,
            "skipped": 0,
            "errors": 0,
            "details": []
        }

        input_path = config.get("input_path", "") # 统一输入路径
        base_output_dir = config.get("output_path", "")

        convert_to_ts = config.get("convert_to_ts")
        convert_to_lua = config.get("convert_to_lua")
        convert_to_ini = config.get("convert_to_ini")
        convert_ini_to_excel = config.get("convert_ini_to_excel")
        recursive = config.get("recursive")

        logger.info(f"开始在 {input_path} 中搜索Excel文件...")
        # 搜索输入路径下的所有Excel文件，包括xls和xlsx，返回字符串列表
        excel_files = find_excel_files(input_path, recursive)
        logger.info(f"找到 {len(excel_files)} 个 Excel 文件。")

        for excel_file in excel_files:
            try:
                logger.info(f"正在处理 Excel 文件: {excel_file}")
                parser = ExcelParser(excel_file)
                data = parser.parse()

                if not data:
                    logger.warning(f"未从 {excel_file} 解析到数据，跳过。")
                    results["skipped"] += 1
                    results["details"].append({"file": excel_file, "status": "skipped", "reason": "未解析到数据"})
                    continue

                # 使用统一的 input_path 计算相对路径
                relative_path = os.path.relpath(excel_file, input_path)
                base_filename = os.path.splitext(os.path.basename(excel_file))[0]

                if convert_to_ts:
                    ts_output_dir = os.path.join(base_output_dir, "output", "ts", os.path.dirname(relative_path))
                    ensure_directory(ts_output_dir)
                    ts_output_path = os.path.join(ts_output_dir, f"{base_filename}.ts")
                    logger.info(f"正在生成 TypeScript 文件: {ts_output_path}")
                    # 假设 generate_ts_file 需要数据和输出路径
                    ts_gen = TSGenerator.generate_ts_file(data, config.get("template_path", "")) # 根据需要调整
                    ts_content = ts_gen.generate()
                    with open(ts_output_path, 'w', encoding='utf-8') as f:
                        f.write(ts_content)
                    logger.info(f"成功生成 TypeScript 文件: {ts_output_path}")

                if convert_to_lua:
                    lua_output_dir = os.path.join(base_output_dir, "output", "lua", os.path.dirname(relative_path))
                    ensure_directory(lua_output_dir)
                    lua_output_path = os.path.join(lua_output_dir, f"{base_filename}.lua")
                    logger.info(f"正在生成 Lua 文件: {lua_output_path}")
                    # lua_gen = LuaGenerator(data) # 创建Lua生成器实例
                    # lua_content = lua_gen.generate() # 生成Lua内容
                    # with open(lua_output_path, 'w', encoding='utf-8') as f: # 写入Lua文件
                    #     f.write(lua_content)
                    # logger.info(f"成功生成Lua文件: {lua_output_path}")
                    logger.warning(f"尚未为 {excel_file} 实现 Lua 生成")

                if convert_to_ini:
                    ini_output_dir = os.path.join(base_output_dir, "output", "ini", os.path.dirname(relative_path))
                    ensure_directory(ini_output_dir)
                    ini_output_path = os.path.join(ini_output_dir, f"{base_filename}.ini")
                    logger.info(f"正在生成 Ini 文件: {ini_output_path}")
                    # ini_gen = IniGenerator(data) # 创建Ini生成器实例
                    # ini_content = ini_gen.generate() # 生成Ini内容
                    # with open(ini_output_path, 'w', encoding='utf-8') as f: # 写入Ini文件
                    #     f.write(ini_content)
                    # logger.info(f"成功生成Ini文件: {ini_output_path}")
                    logger.warning(f"尚未为 {excel_file} 实现 Ini 生成")

                results["processed"] += 1
                results["details"].append({"file": excel_file, "status": "已处理"})

            except Exception as e:
                logger.error(f"处理 Excel 文件 {excel_file} 时出错: {e}", exc_info=True)
                results["errors"] += 1
                results["details"].append({"file": excel_file, "status": "错误", "reason": str(e)})

        # --- Ini 到 Excel 的转换 ---
        # 使用统一的 input_path
        if input_path and convert_ini_to_excel:
            logger.info(f"正在扫描 Ini 文件于: {input_path}")
            ini_files = find_excel_files(input_path, (".ini",)) # 使用 input_path 查找 ini 文件
            logger.info(f"找到 {len(ini_files)} 个 Ini 文件。")

            for ini_file in ini_files:
                try:
                    logger.info(f"正在处理 Ini 文件: {ini_file}")
                    # ini_parser = IniParser(ini_file) # 创建Ini解析器实例
                    # parsed_ini_data = ini_parser.parse() # 解析Ini数据

                    # if not parsed_ini_data:
                    #     logger.warning(f"未从 {ini_file} 解析到数据，跳过。")
                    #     results["skipped"] += 1 # 增加跳过计数
                    #     results["details"].append({"file": ini_file, "status": "skipped", "reason": "未解析到数据"})
                    #     continue

                    # 使用统一的 input_path 计算相对路径
                    # relative_path = os.path.relpath(ini_file, input_path)
                    # base_filename = os.path.splitext(os.path.basename(ini_file))[0]

                    # excel_output_dir = os.path.join(base_output_dir, "output", "excel", os.path.dirname(relative_path))
                    # ensure_directory(excel_output_dir)
                    # excel_output_path = os.path.join(excel_output_dir, f"{base_filename}.xlsx")
                    # logger.info(f"正在生成 Excel 文件: {excel_output_path}")

                    # excel_writer = ExcelWriter(parsed_ini_data) # 创建Excel写入器实例
                    # excel_writer.write(excel_output_path) # 写入Excel文件
                    # logger.info(f"成功生成Excel文件: {excel_output_path}")

                    logger.warning(f"尚未为 {ini_file} 实现 Ini 到 Excel 的转换")
                    results["processed"] += 1 # 即使尚未实现，也计为已处理
                    results["details"].append({"file": ini_file, "status": "已处理 (未实现)"})

                except Exception as e:
                    logger.error(f"处理 Ini 文件 {ini_file} 时出错: {e}", exc_info=True)
                    results["errors"] += 1
                    results["details"].append({"file": ini_file, "status": "错误", "reason": str(e)})

        logger.info(f"处理完成。已处理: {results['processed']}, 已跳过: {results['skipped']}, 错误: {results['errors']}")
        return results

