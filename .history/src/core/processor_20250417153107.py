# src/core/processor.py

import os
from .excel_parser import ExcelParser
from .ts_generator import TSGenerator
# 当其他生成器/解析器创建时导入它们
from .lua_generator import LuaGenerator # Lua生成器
from .ini_generator import IniGenerator # Ini生成器
from .ini_parser import IniParser # Ini解析器
from .excel_writer import ExcelWriter # Excel写入器
from ..utils.file_utils import find_type_files, ensure_directory
import logging

logger = logging.getLogger(__name__)
Excel_Parser=ExcelParser()
TS_Generator=TSGenerator()
Ini_Parser=IniParser()
def process_files(config: dict):
    """文件转换的核心处理逻辑。"""
    logger.info("开始文件处理...")
    # 创建结果字典用于跟踪处理状态
    results = {
        "processed": 0,  # 已成功处理的文件数
        "skipped": 0,    # 跳过的文件数
        "errors": 0,     # 处理出错的文件数
        "details": []    # 存储每个文件的详细处理信息
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
    excel_files = find_type_files(input_path, recursive)
    if not excel_files:
        logger.warning("没有找到Excel文件!")
        return
    logger.info(f"找到 {len(excel_files)} 个 Excel 文件。")

    for excel_file in excel_files:
        try:
            logger.info(f"正在处理 Excel 文件: {excel_file}")
            data = Excel_Parser.parse_excel(excel_file)

            if not data:
                logger.warning(f"未从 {excel_file} 解析到数据，跳过。")
                results["skipped"] += 1
                results["details"].append({"file": excel_file, "status": "skipped", "reason": "未解析到数据"})
                continue

            # 获取相对于输入路径的相对路径
            # 比如file_path=else\\Test\\excel\\test\\test.xlsx
            # 输入路径self.input_dir=else\\Test\\excel
            # relative_path=test\\test.xlsx
            # relative_dir=test
            # 这样的目的是根据输入路径的子目录路径生成输出目录的子目录结构
            relative_path = os.path.relpath(excel_file, input_path)
            relative_dir=os.path.dirname(relative_path)
            # 从文件路径中提取文件名，不包括扩展名
            excel_name = os.path.splitext(os.path.basename(excel_file))[0]

            # excel_to_ts 转换
            if convert_to_ts:
                # 输出路径：基础输出路径+output+ts+相对路径
                ts_output_dir = os.path.join(base_output_dir, "output", "ts", relative_dir)
                ensure_directory(ts_output_dir)
                ts_output_path = os.path.join(ts_output_dir, f"{excel_name}.ts")
                logger.info(f"正在生成 TypeScript 文件: {ts_output_path}")
                # 生成ts文件
                TS_Generator.generate_ts_file(excel_name,data, ts_output_dir)
            
            if convert_to_lua:
                lua_output_dir = os.path.join(base_output_dir, "output", "lua", os.path.dirname(relative_path))
                ensure_directory(lua_output_dir)
                lua_output_path = os.path.join(lua_output_dir, f"{excel_name}.lua")
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
                ini_output_path = os.path.join(ini_output_dir, f"{excel_name}.ini")
                logger.info(f"正在生成 Ini 文件: {ini_output_path}")
                # ini_gen = IniGenerator(data) # 创建Ini生成器实例
                # ini_content = ini_gen.generate() # 生成Ini内容
                # with open(ini_output_path, 'w', encoding='utf-8') as f: # 写入Ini文件
                #     f.write(ini_content)
                # logger.info(f"成功生成Ini文件: {ini_output_path}")
                logger.warning(f"尚未为 {excel_file} 实现 Ini 生成")

            results["processed"] += 1 # 已处理+1
            results["details"].append({"file": excel_file, "status": "已处理"})

        except Exception as e:
            logger.error(f"处理 Excel 文件 {excel_file} 时出错: {e}", exc_info=True)
            results["errors"] += 1
            results["details"].append({"file": excel_file, "status": "错误", "reason": str(e)})

    # --- Ini 到 Excel 的转换 ---
    # 使用统一的 input_path
    if convert_ini_to_excel:
        logger.info(f"正在扫描 Ini 文件于: {input_path}")
        ini_files = find_type_files(input_path, (".ini",)) # 使用 input_path 查找 ini 文件
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