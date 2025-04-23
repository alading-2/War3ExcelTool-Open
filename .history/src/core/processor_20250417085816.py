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
import logging

logger = logging.getLogger(__name__)

def process_files(config: dict):
    """文件转换的核心处理逻辑。"""
    logger.info("Starting file processing...")
    results = {
        "processed": 0,
        "skipped": 0,
        "errors": 0,
        "details": []
    }

    excel_input_path = config.get("input_path", "")
    ini_input_path = config.get("ini_input_path", "")
    base_output_dir = config.get("output_path", "")

    convert_to_ts = config.get("convert_to_ts", False)
    convert_to_lua = config.get("convert_to_lua", False)
    convert_to_ini = config.get("convert_to_ini", False)
    convert_ini_to_excel = config.get("convert_ini_to_excel", False)

    # --- Excel 到 X 的转换 ---
    if excel_input_path and (convert_to_ts or convert_to_lua or convert_to_ini):
        logger.info(f"Scanning for Excel files in: {excel_input_path}")
        excel_files = find_excel_files(excel_input_path, (".xlsx", ".xls"))
        logger.info(f"Found {len(excel_files)} Excel file(s).")

        for excel_file in excel_files:
            try:
                logger.info(f"Processing Excel file: {excel_file}")
                parser = ExcelParser(excel_file)
                data = parser.parse()

                if not data:
                    logger.warning(f"No data parsed from {excel_file}, skipping.")
                    results["skipped"] += 1
                    results["details"].append({"file": excel_file, "status": "skipped", "reason": "No data parsed"})
                    continue

                relative_path = os.path.relpath(excel_file, excel_input_path)
                base_filename = os.path.splitext(os.path.basename(excel_file))[0]

                if convert_to_ts:
                    ts_output_dir = os.path.join(base_output_dir, "output", "ts", os.path.dirname(relative_path))
                    ensure_directory(ts_output_dir)
                    ts_output_path = os.path.join(ts_output_dir, f"{base_filename}.ts")
                    logger.info(f"Generating TypeScript file: {ts_output_path}")
                    # 假设 generate_ts_file 需要数据和输出路径
                    ts_gen = TSGenerator.generate_ts_file(data, config.get("template_path", "")) # 根据需要调整
                    ts_content = ts_gen.generate()
                    with open(ts_output_path, 'w', encoding='utf-8') as f:
                        f.write(ts_content)
                    logger.info(f"Successfully generated TypeScript: {ts_output_path}")

                if convert_to_lua:
                    lua_output_dir = os.path.join(base_output_dir, "output", "lua", os.path.dirname(relative_path))
                    ensure_directory(lua_output_dir)
                    lua_output_path = os.path.join(lua_output_dir, f"{base_filename}.lua")
                    logger.info(f"Generating Lua file: {lua_output_path}")
                    # lua_gen = LuaGenerator(data) # 创建Lua生成器实例
                    # lua_content = lua_gen.generate() # 生成Lua内容
                    # with open(lua_output_path, 'w', encoding='utf-8') as f: # 写入Lua文件
                    #     f.write(lua_content)
                    # logger.info(f"成功生成Lua文件: {lua_output_path}")
                    logger.warning(f"Lua generation not yet implemented for {excel_file}")

                if convert_to_ini:
                    ini_output_dir = os.path.join(base_output_dir, "output", "ini", os.path.dirname(relative_path))
                    ensure_directory(ini_output_dir)
                    ini_output_path = os.path.join(ini_output_dir, f"{base_filename}.ini")
                    logger.info(f"Generating Ini file: {ini_output_path}")
                    # ini_gen = IniGenerator(data) # 创建Ini生成器实例
                    # ini_content = ini_gen.generate() # 生成Ini内容
                    # with open(ini_output_path, 'w', encoding='utf-8') as f: # 写入Ini文件
                    #     f.write(ini_content)
                    # logger.info(f"成功生成Ini文件: {ini_output_path}")
                    logger.warning(f"Ini generation not yet implemented for {excel_file}")

                results["processed"] += 1
                results["details"].append({"file": excel_file, "status": "processed"})

            except Exception as e:
                logger.error(f"Error processing Excel file {excel_file}: {e}", exc_info=True)
                results["errors"] += 1
                results["details"].append({"file": excel_file, "status": "error", "reason": str(e)})

    # --- Ini 到 Excel 的转换 ---
    if ini_input_path and convert_ini_to_excel:
        logger.info(f"Scanning for Ini files in: {ini_input_path}")
        ini_files = find_excel_files(ini_input_path, (".ini",))
        logger.info(f"Found {len(ini_files)} Ini file(s).")

        for ini_file in ini_files:
            try:
                logger.info(f"Processing Ini file: {ini_file}")
                # ini_parser = IniParser(ini_file) # 创建Ini解析器实例
                # parsed_ini_data = ini_parser.parse() # 解析Ini数据

                # if not parsed_ini_data:
                #     logger.warning(f"未从 {ini_file} 解析到数据，跳过。")
                #     results["skipped"] += 1 # 增加跳过计数
                #     results["details"].append({"file": ini_file, "status": "skipped", "reason": "未解析到数据"})
                #     continue

                # relative_path = os.path.relpath(ini_file, ini_input_path)
                # base_filename = os.path.splitext(os.path.basename(ini_file))[0]

                # excel_output_dir = os.path.join(base_output_dir, "output", "excel", os.path.dirname(relative_path))
                # ensure_directory(excel_output_dir)
                # excel_output_path = os.path.join(excel_output_dir, f"{base_filename}.xlsx")
                # logger.info(f"Generating Excel file: {excel_output_path}")

                # excel_writer = ExcelWriter(parsed_ini_data) # 创建Excel写入器实例
                # excel_writer.write(excel_output_path) # 写入Excel文件
                # logger.info(f"成功生成Excel文件: {excel_output_path}")

                logger.warning(f"Ini to Excel conversion not yet implemented for {ini_file}")
                results["processed"] += 1 # 即使尚未实现，也计为已处理
                results["details"].append({"file": ini_file, "status": "已处理 (未实现)"})

            except Exception as e:
                logger.error(f"Error processing Ini file {ini_file}: {e}", exc_info=True)
                results["errors"] += 1
                results["details"].append({"file": ini_file, "status": "error", "reason": str(e)})

    logger.info(f"Processing finished. Processed: {results['processed']}, Skipped: {results['skipped']}, Errors: {results['errors']}")
    return results