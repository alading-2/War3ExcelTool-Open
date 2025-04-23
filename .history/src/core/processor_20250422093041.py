# src/core/processor.py

from ast import Dict
import os
from .excel.excel_parser import ExcelParser
from .ts.ts_generator import TSGenerator
# 当其他生成器/解析器创建时导入它们
from .lua.lua_generator import LuaGenerator  # Lua生成器
from .ini.ini_generator import IniGenerator  # Ini生成器
from .ini.ini_parser import IniParser, War3IniParser  # Ini解析器

from .excel.excel_writer import ExcelWriter  # Excel写入器
import configparser
from ..utils.file_utils import find_files, ensure_directory
import logging
from typing import Dict, Any, List
from src.utils.config_manager import ConfigManager

from src.core.ts import ts_generator  # 导入新的配置管理类

logger = logging.getLogger(__name__)


def process_files():
    """文件转换的核心处理逻辑。"""
    logger.info("开始文件处理...")
    # 创建结果字典用于跟踪处理状态
    results = {
        "processed": 0,  # 已成功处理的文件数
        "skipped": 0,  # 跳过的文件数
        "errors": 0,  # 处理出错的文件数
        "details": []  # 存储每个文件的详细处理信息
    }
    config_manager = ConfigManager()
    input_path = config_manager.get("input_path", "")  # 统一输入路径
    base_output_dir = config_manager.get("output_path", "")
    ini_output = config_manager.get("ini_output", "")

    convert_to_ts = config_manager.get("convert_to_ts")
    convert_to_lua = config_manager.get("convert_to_lua")
    convert_to_ini = config_manager.get("convert_to_ini")
    convert_ini_to_excel = config_manager.get("convert_ini_to_excel")
    recursive = config_manager.get("recursive")
    # 获取白泽框架设置
    baize_frame = config_manager.get("baize_frame", True)
    # 获取w3x解析相关配置
    w3x2lni_path = config_manager.get("w3x2lni_path", "")
    parse_w3x = config_manager.get("parse_w3x", False)

    logger.info(f"开始在 {input_path} 中搜索Excel文件...")
    # 搜索输入路径下的所有Excel文件，包括xls和xlsx，返回字符串列表
    excel_files = find_files(input_path, recursive)
    if not excel_files:
        logger.warning("没有找到Excel文件!")
        return
    logger.info(f"找到 {len(excel_files)} 个 Excel 文件。")

    for excel_file in excel_files:
        try:
            logger.info(f"正在处理 Excel 文件: {excel_file}")
            excel_parser = ExcelParser()
            ini_data = excel_parser.parse_excel(excel_file)

            if not ini_data:
                logger.warning(f"未从 {excel_file} 解析到数据，跳过。")
                results["skipped"] += 1
                results["details"].append({
                    "file": excel_file,
                    "status": "skipped",
                    "reason": "未解析到数据"
                })
                continue

            # 获取相对于输入路径的相对路径
            # 比如file_path=else\\Test\\excel\\test\\test.xlsx
            # 输入路径self.input_dir=else\\Test\\excel
            # relative_path=test\\test.xlsx
            # relative_dir=test
            # 这样的目的是根据输入路径的子目录路径生成输出目录的子目录结构
            relative_path = os.path.relpath(excel_file, input_path)
            relative_dir = os.path.dirname(relative_path)
            # 从文件路径中提取文件名，不包括扩展名
            excel_name = os.path.splitext(os.path.basename(excel_file))[0]

            # excel_to_ts 转换
            if convert_to_ts:
                # 输出路径：基础输出路径+output+ts+相对路径
                ts_output_dir = os.path.join(base_output_dir, "output", "ts",
                                             relative_dir)
                ensure_directory(ts_output_dir)
                ts_output_path = os.path.join(ts_output_dir,
                                              f"{excel_name}.ts")
                logger.info(f"正在生成 TypeScript 文件: {ts_output_path}")
                # 生成ts文件
                ts_generator = TSGenerator()
                ts_generator.generate_ts_file(excel_name, ini_data,
                                              ts_output_dir)

            if convert_to_lua:
                lua_output_dir = os.path.join(base_output_dir, "output", "lua",
                                              os.path.dirname(relative_path))
                ensure_directory(lua_output_dir)
                lua_output_path = os.path.join(lua_output_dir,
                                               f"{excel_name}.lua")
                logger.info(f"正在生成 Lua 文件: {lua_output_path}")
                # lua_gen = LuaGenerator(data) # 创建Lua生成器实例
                # lua_content = lua_gen.generate() # 生成Lua内容
                # with open(lua_output_path, 'w', encoding='utf-8') as f: # 写入Lua文件
                #     f.write(lua_content)
                # logger.info(f"成功生成Lua文件: {lua_output_path}")
                logger.warning(f"尚未为 {excel_file} 实现 Lua 生成")

            if convert_to_ini:
                ini_output_dir = os.path.join(base_output_dir, "output", "ini",
                                              os.path.dirname(relative_path))
                ensure_directory(ini_output_dir)
                ini_output_path = os.path.join(ini_output_dir,
                                               f"{excel_name}.ini")
                logger.info(f"正在生成 Ini 文件: {ini_output_path}")
                # ini_gen = IniGenerator(data) # 创建Ini生成器实例
                # ini_content = ini_gen.generate() # 生成Ini内容
                # with open(ini_output_path, 'w', encoding='utf-8') as f: # 写入Ini文件
                #     f.write(ini_content)
                # logger.info(f"成功生成Ini文件: {ini_output_path}")
                logger.warning(f"尚未为 {excel_file} 实现 Ini 生成")

            results["processed"] += 1  # 已处理+1
            results["details"].append({"file": excel_file, "status": "已处理"})

        except Exception as e:
            logger.error(f"处理 Excel 文件 {excel_file} 时出错: {e}", exc_info=True)
            results["errors"] += 1
            results["details"].append({
                "file": excel_file,
                "status": "错误",
                "reason": str(e)
            })

    # --- 处理w3x文件 ---
    # 在Excel到ts/lua/ini转换之后，ini到Excel转换之前处理w3x文件
    if parse_w3x and w3x2lni_path:
        logger.info("开始处理w3x文件...")
        try:
            from .w3x.w3x_parser import W3xParser

            # 查找w3x文件
            w3x_files = find_files(input_path, recursive, ("*.w3x", ))
            logger.info(f"找到 {len(w3x_files)} 个 w3x 文件。")

            if w3x_files:
                # 创建w3x解析器
                w3x_parser = W3xParser(w3x2lni_path)

                for w3x_file in w3x_files:
                    logger.info(f"处理w3x文件: {w3x_file}")

                    # 创建临时输出目录
                    w3x_basename = os.path.basename(w3x_file).replace(
                        '.w3x', '')
                    temp_output_dir = os.path.join(base_output_dir, "output",
                                                   "w3x", f"{w3x_basename}")
                    ensure_directory(temp_output_dir)

                    # 处理w3x文件
                    try:
                        # 解析w3x文件
                        result = w3x_parser.process_w3x(
                            w3x_file, temp_output_dir)

                        if result["success"]:
                            results["processed"] += 1
                            logger.info(f"成功处理w3x文件: {w3x_file}")
                            results["details"].append({
                                "file":
                                w3x_file,
                                "status":
                                "已处理",
                                "reason":
                                f"提取了 {len(result['tables'])} 个数据表"
                            })

                            # 可以在这里添加更多对解析数据的处理...
                            # 例如将w3x数据转换为Excel等
                        else:
                            results["errors"] += 1
                            logger.error(
                                f"处理w3x文件失败: {w3x_file}, 错误: {', '.join(result['errors'])}"
                            )
                            results["details"].append({
                                "file":
                                w3x_file,
                                "status":
                                "错误",
                                "reason":
                                f"处理失败: {', '.join(result['errors'])}"
                            })
                    except Exception as e:
                        results["errors"] += 1
                        logger.error(f"处理w3x文件时发生错误: {w3x_file} - {e}",
                                     exc_info=True)
                        results["details"].append({
                            "file": w3x_file,
                            "status": "错误",
                            "reason": f"处理失败: {e}"
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
    # 使用统一的 input_path
    if convert_ini_to_excel:
        logger.info(f"正在扫描 Ini 文件于: {input_path}")
        ini_files = find_files(input_path, recursive,
                               ("*.ini", ))  # 使用 input_path 查找 ini 文件
        logger.info(f"找到 {len(ini_files)} 个 Ini 文件。")

        if not ini_files:
            logger.warning("没有找到Ini文件!")
        else:
            # 确保输出目录存在
            excel_output_dir = os.path.join(base_output_dir, "output", "excel")
            ensure_directory(excel_output_dir)
            excel_output_path = os.path.join(excel_output_dir, "物编.xlsx")

            # 存储ini文件数据的字典 - 按物编类型分类
            ini_data_dict = {}

            for ini_file in ini_files:
                try:
                    logger.info(f"正在处理 Ini 文件: {ini_file}")
                    # Ini_Parser = IniParser() # 创建Ini解析器实例
                    # Ini_Parser = War3IniParser() # 创建Ini解析器实例

                    # 从文件名获取物编类型
                    file_name = os.path.splitext(os.path.basename(ini_file))[0]
                    ini_type = IniParser.detect_ini_type(
                        file_name)  # 检测Ini类型 - 使用类方法而非实例方法

                    if not ini_type:
                        logger.warning(f"无法识别 {ini_file} 的物编类型，跳过。")
                        results["skipped"] += 1
                        results["details"].append({
                            "file": ini_file,
                            "status": "skipped",
                            "reason": "无法识别物编类型"
                        })
                        continue

                    # 解析Ini数据
                    # parsed_ini_data = Ini_Parser.parse_ini(ini_file)
                    # Ini_Parser.read_file(ini_file)
                    # parsed_ini_data = Ini_Parser.data()
                    parsed_ini_data = War3IniParser.parse_ini(ini_file)

                    if not parsed_ini_data:
                        logger.warning(f"未从 {ini_file} 解析到数据，跳过。")
                        results["skipped"] += 1  # 增加跳过计数
                        results["details"].append({
                            "file": ini_file,
                            "status": "skipped",
                            "reason": "未解析到数据"
                        })
                        continue

                    # 将解析后的数据添加到对应类型的字典中
                    if ini_type in ini_data_dict:
                        # 如果物编类型已经在字典中，则使用data_add方法合并数据
                        ini_data_dict[ini_type].data_add(parsed_ini_data)
                        logger.info(f"合并 {ini_type} 类型的数据: {ini_file}")
                    else:
                        # 如果ini_type不在字典中，则创建新的键值对
                        ini_data_dict[ini_type] = parsed_ini_data
                        logger.info(f"添加新的 {ini_type} 类型数据: {ini_file}")

                    results["processed"] += 1
                    results["details"].append({
                        "file": ini_file,
                        "status": "已处理"
                    })

                except Exception as e:
                    logger.error(f"处理 Ini 文件 {ini_file} 时出错: {e}",
                                 exc_info=True)
                    results["errors"] += 1
                    results["details"].append({
                        "file": ini_file,
                        "status": "错误",
                        "reason": str(e)
                    })

            # 如果有解析到的数据，则写入Excel
            if ini_data_dict:
                try:
                    # 创建Excel写入器
                    excel_writer = ExcelWriter()
                    # 将数据写入Excel
                    logger.info(f"正在将数据写入Excel: {excel_output_path}")
                    success = excel_writer.write_to_excel(
                        ini_data_dict, excel_output_path)

                    if success:
                        logger.info(f"成功将Ini数据写入Excel: {excel_output_path}")
                    else:
                        logger.error(f"写入Excel失败: {excel_output_path}")
                except Exception as e:
                    logger.error(f"写入Excel时出错: {e}", exc_info=True)
            else:
                logger.warning("没有有效的Ini数据可写入Excel。")

    logger.info(
        f"处理完成。已处理: {results['processed']}, 已跳过: {results['skipped']}, 错误: {results['errors']}"
    )
    return results
