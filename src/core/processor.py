# src/core/processor.py

import os
import shutil
import concurrent.futures
import traceback
import uuid  # 添加uuid模块导入

from src.utils.project_info import ProjectInfo
from src.utils.temp_file_manager import TempFileManager  # 导入临时文件管理器
from .excel.excel_parser import ExcelParser
from .ts.ts_generator import TSGenerator
# 当其他生成器/解析器创建时导入它们
from .lua.lua_generator import LuaGenerator  # Lua生成器
from .json.json_generator import JSONGenerator  # JSON生成器
from .ini.ini_parser import War3IniParser, OBJECT_TYPE_MAPPING  # Ini解析器

from .excel.excel_writer import ExcelWriter  # Excel写入器
from ..utils.file_utils import FileUtils
import logging
from typing import Dict, Any, List, Tuple, Optional, Callable
from src.utils.config_manager import ConfigManager
from .ini.excel_to_ini_generate import ExcelToIniGenerator

logger = logging.getLogger(__name__)

# 定义进度回调函数类型
ProgressCallback = Callable[[str, int, int, str], None]


def process_excel_file(
        excel_file: str,
        input_path: str,
        base_output_dir: str,
        convert_to_ts: bool,
        convert_to_lua: bool,
        convert_to_json: bool,
        convert_to_ini: bool,
        ini_generator: ExcelToIniGenerator,
        progress_callback: Optional[ProgressCallback] = None) -> Dict:
    """
    处理单个Excel文件
    
    参数:
        excel_file: Excel文件路径
        input_path: 输入路径
        base_output_dir: 基础输出路径
        convert_to_ts: 是否转换为TypeScript
        convert_to_lua: 是否转换为Lua
        convert_to_json: 是否转换为JSON
        convert_to_ini: 是否转换为INI
        ini_generator: ExcelToIniGenerator实例
        progress_callback: 进度回调函数，用于更新UI
        
    返回:
        包含处理结果的字典
    """
    result = {"file": excel_file, "status": "错误", "reason": "", "processed": 0}

    try:
        if progress_callback:
            progress_callback("解析Excel", 0, 100, excel_file)

        logger.info(f"正在处理 Excel 文件: {excel_file}")
        excel_parser = ExcelParser()
        excel_datas = excel_parser.parse_excel(excel_file)

        if not excel_datas:
            logger.warning(f"未从 {excel_file} 解析到数据，跳过。")
            result["status"] = "skipped"
            result["reason"] = "未解析到数据"
            return result

        if progress_callback:
            progress_callback("解析Excel完成", 30, 100, excel_file)

        # 获取相对路径
        relative_path = os.path.relpath(excel_file, input_path)
        relative_dir = os.path.dirname(relative_path)
        # 从文件路径中提取文件名，不包括扩展名
        excel_name = FileUtils.get_file_name(excel_file)

        # 检查是否所有sheet都是物编表格
        is_all_object_tables = True
        for metadata in excel_datas:
            if not metadata.get("is_object_table", False):
                is_all_object_tables = False
                break

        # excel_to_ts 转换，非物编表格才转换
        if convert_to_ts and not is_all_object_tables:
            if progress_callback:
                progress_callback("生成TypeScript", 40, 100, excel_file)

            # 输出路径：基础输出路径+output+ts+相对路径
            ts_output_dir = os.path.join(base_output_dir, "output", "ts",
                                         relative_dir)
            FileUtils.ensure_directory(ts_output_dir)
            ts_output_path = os.path.join(ts_output_dir, f"{excel_name}.ts")
            logger.info(f"正在生成 TypeScript 文件: {ts_output_path}")
            # 生成ts文件
            ts_generator = TSGenerator()
            ts_generator.generate_ts_file(excel_name, excel_datas,
                                          ts_output_dir)

            if progress_callback:
                progress_callback("TypeScript生成完成", 60, 100, excel_file)

        elif convert_to_ts and is_all_object_tables:
            logger.info(f"检测到物编表格 {excel_file}，跳过生成 TypeScript 文件")

        # excel_to_lua 转换，非物编表格才转换
        if convert_to_lua and not is_all_object_tables:
            if progress_callback:
                progress_callback("生成Lua", 70, 100, excel_file)

            # 输出路径：基础输出路径+output+lua+相对路径
            lua_output_dir = os.path.join(base_output_dir, "output", "lua",
                                          relative_dir)
            FileUtils.ensure_directory(lua_output_dir)
            lua_output_path = os.path.join(lua_output_dir, f"{excel_name}.lua")
            logger.info(f"正在生成 Lua 文件: {lua_output_path}")
            # 生成lua文件
            lua_generator = LuaGenerator()
            lua_generator.generate_lua_file(excel_name, excel_datas,
                                            lua_output_dir)
            logger.info(f"成功生成Lua文件: {lua_output_path}")

            if progress_callback:
                progress_callback("Lua生成完成", 80, 100, excel_file)

        elif convert_to_lua and is_all_object_tables:
            logger.info(f"检测到物编表格 {excel_file}，跳过生成 Lua 文件")

        # excel_to_json 转换，非物编表格才转换
        if convert_to_json and not is_all_object_tables:
            if progress_callback:
                progress_callback("生成JSON", 85, 100, excel_file)

            # 输出路径：基础输出路径+output+json+相对路径
            json_output_dir = os.path.join(base_output_dir, "output", "json",
                                           relative_dir)
            FileUtils.ensure_directory(json_output_dir)
            json_output_path = os.path.join(json_output_dir,
                                            f"{excel_name}.json")
            logger.info(f"正在生成 JSON 文件: {json_output_path}")
            # 生成json文件
            json_generator = JSONGenerator()
            json_generator.generate_json_file(excel_name, excel_datas,
                                              json_output_dir)
            logger.info(f"成功生成JSON文件: {json_output_path}")

            if progress_callback:
                progress_callback("JSON生成完成", 90, 100, excel_file)

        elif convert_to_json and is_all_object_tables:
            logger.info(f"检测到物编表格 {excel_file}，跳过生成 JSON 文件")

        if convert_to_ini:
            if progress_callback:
                progress_callback("生成INI", 95, 100, excel_file)

            # excel转ini主流程集成
            try:
                # 使用线程安全方式处理当前excel文件的数据
                ini_generator.process_excel_to_ini(excel_datas, excel_file)
            except Exception as e:
                logger.error(f"Excel数据汇总成INI处理失败: {e}", exc_info=True)
                result["status"] = "错误"
                result["reason"] = f"Excel数据汇总成INI处理失败: {e}"
                return result

        if progress_callback:
            progress_callback("处理完成", 100, 100, excel_file)

        result["status"] = "已处理"
        result["processed"] = 1
        return result

    except Exception as e:
        error_msg = f"处理 Excel 文件 {excel_file} 时出错: {e}"
        logger.error(error_msg, exc_info=True)
        result["reason"] = str(e)
        return result


def process_w3x_file(
        w3x_file: str,
        base_output_dir: str,
        w3x_parser,
        results: Dict,
        progress_callback: Optional[ProgressCallback] = None) -> Dict:
    """
    处理单个W3X文件
    
    参数:
        w3x_file: W3X文件路径
        base_output_dir: 基础输出路径
        w3x_parser: W3xParser实例
        results: 结果字典，用于线程安全地更新处理结果
        progress_callback: 进度回调函数，用于更新UI
        
    返回:
        包含处理结果的字典
    """
    result = {
        "file": w3x_file,
        "status": "错误",
        "reason": "",
        "processed": 0,
        "output_dir": ""
    }
    try:
        logger.info(f"处理w3x文件: {w3x_file}")

        if progress_callback:
            progress_callback("解析W3X文件", 0, 100, w3x_file)

        # 创建临时输出目录
        w3x_basename = FileUtils.get_file_name(w3x_file)

        # 使用临时文件管理器创建唯一的临时目录
        temp_file_manager = TempFileManager()
        temp_output_dir = temp_file_manager.create_temp_dir(
            f"w3x_{w3x_basename}")

        # 在输出目录创建固定路径
        output_dir = os.path.join(base_output_dir, "output", "w3x",
                                  w3x_basename)
        FileUtils.ensure_directory(output_dir)

        if progress_callback:
            progress_callback("处理W3X文件", 30, 100, w3x_file)

        # 处理w3x文件
        result_process = w3x_parser.process_w3x(w3x_file, temp_output_dir)

        if progress_callback:
            progress_callback("提取W3X数据", 70, 100, w3x_file)

        if result_process["success"]:
            # 将临时目录的内容复制到最终输出目录
            for item in os.listdir(temp_output_dir):
                s = os.path.join(temp_output_dir, item)
                d = os.path.join(output_dir, item)
                if os.path.isdir(s):
                    shutil.copytree(s, d, dirs_exist_ok=True)
                else:
                    shutil.copy2(s, d)

            result["processed"] = 1
            result["status"] = "已处理"
            result["reason"] = f"提取了 {len(result_process['tables'])} 个数据表"
            result["output_dir"] = output_dir
            logger.info(f"成功处理w3x文件: {w3x_file}")

            if progress_callback:
                progress_callback("W3X处理完成", 100, 100, w3x_file)
        else:
            result["status"] = "错误"
            result["reason"] = f"处理失败: {', '.join(result_process['errors'])}"
            logger.error(
                f"处理w3x文件失败: {w3x_file}, 错误: {', '.join(result_process['errors'])}"
            )

        # 清理临时目录
        temp_file_manager.remove_temp_dir(temp_output_dir)

    except Exception as e:
        logger.error(f"处理w3x文件时发生错误: {w3x_file} - {e}", exc_info=True)
        result["status"] = "错误"
        result["reason"] = f"处理失败: {e}"

    return result


def process_ini_file(
        ini_file: str,
        ini_data_dict: Dict,
        results: Dict,
        progress_callback: Optional[ProgressCallback] = None) -> Dict:
    """
    处理单个INI文件
    
    参数:
        ini_file: INI文件路径
        ini_data_dict: 存储INI数据的字典
        results: 结果字典
        progress_callback: 进度回调函数，用于更新UI
        
    返回:
        包含处理结果的字典
    """
    result = {
        "file": ini_file,
        "status": "错误",
        "reason": "",
        "processed": 0,
        "ini_type": "",
        "data": None
    }

    try:
        logger.info(f"正在处理 Ini 文件: {ini_file}")

        if progress_callback:
            progress_callback("解析INI文件", 0, 100, ini_file)

        file_name = FileUtils.get_file_name(ini_file)
        ini_type = War3IniParser.detect_ini_type(file_name)  # 检测Ini类型

        if not ini_type:
            result["status"] = "skipped"
            result[
                "reason"] = f"无法识别 {ini_file} 的物编类型，仅支持这些类型: {OBJECT_TYPE_MAPPING.keys()}。"
            logger.warning(result["reason"])
            return result

        if progress_callback:
            progress_callback("解析INI数据", 30, 100, ini_file)

        # 解析Ini数据
        result_dict = War3IniParser.parse_ini(ini_file)
        parsed_ini_data = result_dict["data"]
        if not parsed_ini_data:
            result["status"] = "skipped"
            result["reason"] = "未解析到数据"
            logger.warning(f"未从 {ini_file} 解析到数据，跳过。")
            return result

        if progress_callback:
            progress_callback("INI处理完成", 100, 100, ini_file)

        # 返回解析的数据
        result["status"] = "已处理"
        result["processed"] = 1
        result["ini_type"] = ini_type
        result["data"] = parsed_ini_data
        logger.info(f"成功处理 Ini 文件: {ini_file}, 类型: {ini_type}")

    except Exception as e:
        logger.error(f"处理 Ini 文件 {ini_file} 时出错: {e}", exc_info=True)
        result["status"] = "错误"
        result["reason"] = str(e)

    return result


def ini_process_files(
        input_path: str,
        base_output_dir: str,
        excel_name: str,
        recursive: bool,
        thread_count: int,
        results: Dict,
        progress_callback: Optional[ProgressCallback] = None) -> None:
    """
    处理给定路径的INI文件并转换为Excel
    
    参数:
        input_path: 输入路径
        base_output_dir: 输出目录
        excel_name: 生成的Excel文件名
        recursive: 是否递归搜索
        thread_count: 线程数量
        results: 结果统计字典
        progress_callback: 进度回调函数，用于更新UI
    """
    config_manager = ConfigManager()
    convert_ini_to_excel = config_manager.get("convert_ini_to_excel")

    if not convert_ini_to_excel:
        return

    logger.info(f"正在扫描 Ini 文件于: {input_path}")

    if progress_callback:
        progress_callback("扫描INI文件", 0, 100, input_path)

    ini_files = FileUtils.find_files(input_path, recursive, ("*.ini", ))
    logger.info(f"找到 {len(ini_files)} 个 Ini 文件。")

    if progress_callback:
        progress_callback(f"发现{len(ini_files)}个INI文件", 10, 100, input_path)

    if not ini_files:
        logger.warning("没有找到Ini文件!")
        return

    # 确保输出目录存在
    excel_output_dir = os.path.join(base_output_dir, "output", "excel")
    FileUtils.ensure_directory(excel_output_dir)
    excel_output_path = os.path.join(excel_output_dir, excel_name,
                                     f"{excel_name}.xlsx")

    # 存储ini文件数据的字典 - 按物编类型分类
    ini_data_dict = {}

    # 使用线程安全的字典来存储结果
    from threading import Lock
    ini_data_lock = Lock()

    total_files = len(ini_files)
    processed_files = 0

    # 使用多线程处理ini文件
    with concurrent.futures.ThreadPoolExecutor(
            max_workers=thread_count) as executor:
        # 提交任务处理每个ini文件
        future_to_file = {
            executor.submit(process_ini_file, ini_file, ini_data_dict, results, progress_callback):
            ini_file
            for ini_file in ini_files
        }

        # 处理完成的任务
        for future in concurrent.futures.as_completed(future_to_file):
            file = future_to_file[future]
            try:
                result = future.result()
                # 更新计数
                processed_files += 1

                if progress_callback:
                    file_progress = int(
                        50 + (processed_files / total_files) * 40)  # 50%-90%
                    progress_callback(f"处理INI {processed_files}/{total_files}",
                                      file_progress, 100,
                                      f"INI到Excel转换 - {file}")

                if result["status"] == "已处理":
                    results["processed"] += result["processed"]
                    results["details"].append({"file": file, "status": "已处理"})

                    # 安全合并数据到结果字典
                    with ini_data_lock:
                        ini_type = result["ini_type"]
                        parsed_ini_data = result["data"]

                        if ini_type in ini_data_dict:
                            # 合并数据
                            for section, section_data in parsed_ini_data.items(
                            ):
                                if section in ini_data_dict[ini_type]:
                                    logger.warning(
                                        f"发现重复Section: {section}，已跳过")
                                else:
                                    ini_data_dict[ini_type][
                                        section] = section_data
                            logger.info(f"合并 {ini_type} 类型的数据: {file}")
                        else:
                            # 添加新数据
                            ini_data_dict[ini_type] = parsed_ini_data
                            logger.info(f"添加新的 {ini_type} 类型数据: {file}")

                elif result["status"] == "skipped":
                    results["skipped"] += 1
                    results["details"].append({
                        "file": file,
                        "status": "skipped",
                        "reason": result["reason"]
                    })
                else:  # 错误
                    results["errors"] += 1
                    results["details"].append({
                        "file": file,
                        "status": "错误",
                        "reason": result["reason"]
                    })
            except Exception as e:
                logger.error(f"处理INI任务结果时出错: {file} - {e}", exc_info=True)
                results["errors"] += 1
                results["details"].append({
                    "file": file,
                    "status": "错误",
                    "reason": str(e)
                })

    # 如果有解析到的数据，则写入Excel
    if ini_data_dict:
        try:
            if progress_callback:
                progress_callback("生成Excel文件", 90, 100, excel_output_path)

            # 创建Excel写入器
            excel_writer = ExcelWriter()
            # 将数据写入Excel
            logger.info(f"正在将数据写入Excel: {excel_output_path}")
            success = excel_writer.write_to_excel(ini_data_dict,
                                                  excel_output_path)

            if success:
                logger.info(f"成功将Ini数据写入Excel: {excel_output_path}")

                if progress_callback:
                    progress_callback("INI转Excel完成", 100, 100,
                                      excel_output_path)
            else:
                logger.error(f"写入Excel失败: {excel_output_path}")
        except Exception as e:
            logger.error(f"写入Excel时出错: {e}", exc_info=True)
    else:
        logger.warning("没有有效的Ini数据可写入Excel。")


def process_files(progress_callback: Optional[ProgressCallback] = None):
    """
    文件转换的核心处理逻辑。
    
    参数:
        progress_callback: 进度回调函数，格式为 callback(operation, current, total, file_path)
        
    返回:
        包含处理结果的字典
    """
    logger.info("开始文件处理...")
    # 创建结果字典用于跟踪处理状态
    results = {
        "processed": 0,  # 已成功处理的文件数
        "skipped": 0,  # 跳过的文件数
        "errors": 0,  # 处理出错的文件数
        "details": [],  # 存储每个文件的详细处理信息
        "id_conflicts": {
            "has_conflicts": False,  # 是否有ID冲突
            "conflict_count": 0,  # 冲突数量
            "markdown_path": ""  # 冲突报告路径
        }
    }

    # 初始化临时文件管理器
    temp_file_manager = TempFileManager()

    config_manager = ConfigManager()
    input_path = config_manager.get("input_path", "")  # 统一输入路径
    base_output_dir = config_manager.get("output_path", "")
    ini_output = config_manager.get("ini_output", "")

    convert_to_ts = config_manager.get("convert_to_ts")
    convert_to_lua = config_manager.get("convert_to_lua")
    convert_to_json = config_manager.get("convert_to_json")
    convert_to_ini = config_manager.get("convert_to_ini")
    convert_ini_to_excel = config_manager.get("convert_ini_to_excel")
    recursive = config_manager.get("recursive")
    # 获取白泽框架设置
    baize_frame = config_manager.get("baize_frame", True)
    # 获取w3x解析相关配置
    w3x2lni_path = config_manager.get("w3x2lni_path", "")
    parse_w3x = config_manager.get("parse_w3x", False)
    # 获取多线程配置
    thread_count = config_manager.get("thread_count", 0)
    # 获取Excel解析缓存配置
    use_excel_cache = config_manager.get("use_excel_cache", True)

    # 启用或禁用Excel解析缓存
    ExcelParser.enable_cache(use_excel_cache)

    # 如果启用了缓存，先清除之前的缓存数据
    if use_excel_cache:
        ExcelParser.clear_cache()
        logger.info("已清除Excel解析缓存，准备开始处理")

    # 如果未指定或设为0，则使用CPU核心数+4的线程数（但最大不超过32）
    if thread_count <= 0:
        thread_count = min(32, os.cpu_count() + 4) if os.cpu_count() else 4
    logger.info(f"使用 {thread_count} 个线程处理文件")

    # 删除output目录下的所有文件
    output_dir = os.path.join(base_output_dir, "output")
    # 清空并重新创建 output 目录
    if os.path.exists(output_dir):
        try:
            if progress_callback:
                progress_callback("清理输出目录", 0, 100, output_dir)

            shutil.rmtree(output_dir)
            logger.info(f"已清空目录: {output_dir}")
        except Exception as e:
            logger.error(f"无法清空目录 {output_dir}. 原因: {e}")
            # 根据错误处理策略，可以选择继续或停止
            # 例如，如果无法清空，可能需要通知用户或停止处理
    FileUtils.ensure_directory(output_dir)

    logger.info(f"开始在 {input_path} 中搜索Excel文件...")

    if progress_callback:
        progress_callback("搜索Excel文件", 5, 100, input_path)

    # 搜索输入路径下的所有Excel文件，包括xls和xlsx，返回字符串列表
    excel_files = FileUtils.find_files(input_path, recursive)
    if not excel_files:
        logger.warning("没有找到Excel文件!")
        return results

    if progress_callback:
        progress_callback(f"发现{len(excel_files)}个Excel文件", 10, 100, input_path)

    logger.info(f"找到 {len(excel_files)} 个 Excel 文件。")

    # 存储w3x文件解析路径
    w3x_parse_paths = []

    # 创建ExcelToIniGenerator实例 - 使用线程锁保护
    ini_generator = None
    from threading import Lock
    ini_generator_lock = Lock()

    if convert_to_ini:
        ini_generator = ExcelToIniGenerator()

    total_files = len(excel_files)
    processed_files = 0

    # 使用多线程处理Excel文件
    with concurrent.futures.ThreadPoolExecutor(
            max_workers=thread_count) as executor:

        # 修改处理单个Excel文件的函数，使其线程安全
        def thread_safe_process_excel(excel_file):
            """线程安全地处理单个Excel文件"""
            nonlocal ini_generator, ini_generator_lock

            file_progress_callback = None
            if progress_callback:
                # 为每个文件创建特定的回调
                def file_progress(operation, current, total, file):
                    nonlocal processed_files
                    # 计算总体进度: 10-45%区间用于Excel处理
                    overall_progress = int(10 +
                                           (processed_files / total_files) *
                                           35 + (current / total) *
                                           (35 / total_files))
                    progress_callback(operation, overall_progress, 100, file)

                file_progress_callback = file_progress

            try:
                # 处理Excel文件，传递特定的进度回调
                with ini_generator_lock:
                    result = process_excel_file(excel_file, input_path,
                                                base_output_dir, convert_to_ts,
                                                convert_to_lua,
                                                convert_to_json,
                                                convert_to_ini, ini_generator,
                                                file_progress_callback)
                return result

            except Exception as e:
                error_msg = f"处理 Excel 文件 {excel_file} 时出错: {e}"
                logger.error(error_msg, exc_info=True)
                return {"file": excel_file, "status": "错误", "reason": str(e)}

        # 提交处理任务
        future_to_file = {
            executor.submit(thread_safe_process_excel, excel_file): excel_file
            for excel_file in excel_files
        }

        # 处理完成的任务
        for future in concurrent.futures.as_completed(future_to_file):
            file = future_to_file[future]
            processed_files += 1

            try:
                result = future.result()
                # 更新统计信息
                if result["status"] == "已处理":
                    results["processed"] += result["processed"]
                    results["details"].append({"file": file, "status": "已处理"})
                elif result["status"] == "skipped":
                    results["skipped"] += 1
                    results["details"].append({
                        "file": file,
                        "status": "skipped",
                        "reason": result["reason"]
                    })
                else:  # 错误
                    results["errors"] += 1
                    results["details"].append({
                        "file": file,
                        "status": "错误",
                        "reason": result["reason"]
                    })
            except Exception as e:
                logger.error(f"处理任务结果时出错: {file} - {e}", exc_info=True)
                results["errors"] += 1
                results["details"].append({
                    "file": file,
                    "status": "错误",
                    "reason": str(e)
                })

    # excel_to_ini
    if convert_to_ini and ini_generator and hasattr(
            ini_generator,
            "list_excel_table_path") and ini_generator.list_excel_table_path:
        if progress_callback:
            progress_callback("处理INI数据", 50, 100, "正在生成INI文件")

        ini_output_dir = os.path.join(base_output_dir, "output")
        FileUtils.ensure_directory(ini_output_dir)

        # 输出ini和ts映射文件
        error_messages = ini_generator.finish_processing(ini_output_dir)

        # 检查是否有ID冲突，如果有则生成冲突报告并通过回调通知UI
        if error_messages and len(error_messages) > 0:
            results["id_conflicts"]["has_conflicts"] = True
            results["id_conflicts"]["conflict_count"] = len(error_messages)
            # 使用os.path.normpath规范化路径，确保路径分隔符一致
            conflict_path = os.path.normpath(
                os.path.join(base_output_dir, "output", "物编ID冲突详情.md"))
            results["id_conflicts"]["markdown_path"] = conflict_path

            if progress_callback:
                conflict_msg = f"发现{len(error_messages)}个物编ID冲突，请查看冲突详情报告"
                progress_callback("物编ID冲突警告", -1, -1, conflict_msg)

    # --- 处理w3x文件 ---
    # 在Excel到ts/lua/ini转换之后，ini到Excel转换之前处理w3x文件
    if parse_w3x:
        logger.info("开始处理w3x文件...")

        if progress_callback:
            progress_callback("搜索W3X文件", 60, 100, input_path)

        try:
            from .w3x.w3x_parser import W3xParser

            if not w3x2lni_path:
                string = "开启了解析w3x文件功能，但是没有配置w3x2lni_path"
                logger.error(string)
                raise ValueError(string)

            # 查找w3x文件
            w3x_files = FileUtils.find_files(input_path, recursive,
                                             ("*.w3x", ))
            logger.info(f"找到 {len(w3x_files)} 个 w3x 文件。")

            if progress_callback:
                progress_callback(f"发现{len(w3x_files)}个W3X文件", 65, 100,
                                  input_path)

            if w3x_files:
                # 创建w3x解析器
                w3x_parser = W3xParser(w3x2lni_path)

                total_w3x = len(w3x_files)
                processed_w3x = 0

                # 使用多线程处理w3x文件
                with concurrent.futures.ThreadPoolExecutor(
                        max_workers=thread_count) as executor:
                    # 提交任务
                    future_to_file = {}

                    for w3x_file in w3x_files:
                        # 为每个W3X文件创建特定的回调
                        if progress_callback:

                            def w3x_progress_callback(operation,
                                                      current,
                                                      total,
                                                      file,
                                                      w3x_file=w3x_file,
                                                      processed=processed_w3x):
                                # 60-75%区间用于W3X处理
                                overall_progress = int(
                                    65 + (processed / total_w3x) * 10 +
                                    (current / total) * (10 / total_w3x))
                                progress_callback(operation, overall_progress,
                                                  100, file)

                            future_to_file[executor.submit(
                                process_w3x_file, w3x_file, base_output_dir,
                                w3x_parser, results,
                                w3x_progress_callback)] = w3x_file
                        else:
                            future_to_file[executor.submit(
                                process_w3x_file, w3x_file, base_output_dir,
                                w3x_parser, results)] = w3x_file

                    # 处理完成的任务
                    for future in concurrent.futures.as_completed(
                            future_to_file):
                        file = future_to_file[future]
                        processed_w3x += 1
                        try:
                            result = future.result()
                            if result["status"] == "已处理":
                                results["processed"] += 1
                                w3x_parse_paths.append(result["output_dir"])
                                results["details"].append({
                                    "file":
                                    file,
                                    "status":
                                    "已处理",
                                    "reason":
                                    result["reason"]
                                })
                            elif result["status"] == "skipped":
                                results["skipped"] += 1
                                results["details"].append({
                                    "file":
                                    file,
                                    "status":
                                    "skipped",
                                    "reason":
                                    result["reason"]
                                })
                            else:  # 错误
                                results["errors"] += 1
                                results["details"].append({
                                    "file":
                                    file,
                                    "status":
                                    "错误",
                                    "reason":
                                    result["reason"]
                                })
                        except Exception as e:
                            logger.error(f"处理W3X任务结果时出错: {file} - {e}",
                                         exc_info=True)
                            results["errors"] += 1
                            results["details"].append({
                                "file": file,
                                "status": "错误",
                                "reason": str(e)
                            })
            else:
                logger.info("未找到任何w3x文件")
        except Exception as e:
            logger.error(f"处理w3x文件时发生错误: {e}", exc_info=True)
            results["errors"] += 1
            results["details"].append({
                "file": "w3x处理",
                "status": "错误",
                "reason": f"处理w3x文件时发生错误: {e}"
            })

    # --- Ini 到 Excel 的转换 ---
    if convert_ini_to_excel:
        if progress_callback:
            progress_callback("INI转Excel", 80, 100, "处理INI文件")

        # 处理主目录的ini文件
        ini_process_files(input_path, base_output_dir, "物编", recursive,
                          thread_count, results, progress_callback)

        # 处理w3x解析文件的ini文件 - 并行处理多个w3x目录
        if w3x_parse_paths:
            w3x_progress = 0
            total_w3x_dirs = len(w3x_parse_paths)

            with concurrent.futures.ThreadPoolExecutor(
                    max_workers=thread_count) as executor:
                # 提交每个w3x目录的ini处理任务
                futures = []
                for path in w3x_parse_paths:
                    w3x_name = os.path.basename(path)

                    # 为每个W3X目录创建特定的回调
                    if progress_callback:

                        def w3x_ini_progress(operation,
                                             current,
                                             total,
                                             file,
                                             idx=w3x_progress,
                                             total_dirs=total_w3x_dirs):
                            # 80-95%区间用于W3X目录INI处理
                            overall_progress = int(80 +
                                                   (idx / total_dirs) * 15 +
                                                   (current / total) *
                                                   (15 / total_dirs))
                            progress_callback(f"W3X INI: {operation}",
                                              overall_progress, 100, file)

                        # 创建一个新线程处理每个w3x目录的ini文件
                        future = executor.submit(
                            ini_process_files, path, base_output_dir, w3x_name,
                            recursive,
                            max(1, thread_count // len(w3x_parse_paths)),
                            results, w3x_ini_progress)
                    else:
                        future = executor.submit(
                            ini_process_files, path, base_output_dir, w3x_name,
                            recursive,
                            max(1,
                                thread_count // len(w3x_parse_paths)), results)

                    futures.append(future)
                    w3x_progress += 1

                # 等待所有处理完成
                for future in concurrent.futures.as_completed(futures):
                    try:
                        future.result()  # 获取结果，处理可能的异常
                    except Exception as e:
                        logger.error(f"处理w3x文件的ini文件时出错: {e}", exc_info=True)

    # 如果启用了Excel解析缓存，输出缓存统计信息
    if use_excel_cache:
        cache_stats = ExcelParser.get_cache_stats()
        logger.info(
            f"Excel解析缓存统计: 命中{cache_stats['hits']}次, 未命中{cache_stats['misses']}次, "
            f"命中率{cache_stats['hit_ratio']:.2%}, 缓存大小{cache_stats['size']}")

    # 输出临时文件管理器状态
    logger.info(f"临时文件管理器状态: {temp_file_manager.temp_files_count}个临时文件, "
                f"{temp_file_manager.temp_dirs_count}个临时目录")

    # 最终进度更新
    if progress_callback:
        if results["id_conflicts"]["has_conflicts"]:
            progress_callback(
                "处理完成", 100, 100,
                f"全部任务完成，但存在{results['id_conflicts']['conflict_count']}个物编ID冲突"
            )
        else:
            progress_callback("处理完成", 100, 100, "全部任务完成")

    logger.info(
        f"处理完成。已处理: {results['processed']}, 已跳过: {results['skipped']}, 错误: {results['errors']}"
    )
    return results
