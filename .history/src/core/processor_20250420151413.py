# src/core/processor.py

from ast import Dict
import os
from .excel_parser import ExcelParser
from .ts_generator import TSGenerator
# 当其他生成器/解析器创建时导入它们
from .lua_generator import LuaGenerator # Lua生成器
from .ini_generator import IniGenerator # Ini生成器
from .ini_parser import IniParser,War3IniParser # Ini解析器

from .excel_writer import ExcelWriter # Excel写入器
import configparser
from ..utils.file_utils import find_type_files, ensure_directory
import logging

logger = logging.getLogger(__name__)
Excel_Parser=ExcelParser()
TS_Generator=TSGenerator()

def process_files(config: Dict[str, Any]) -> Dict[str, Any]:
    """
    处理文件，根据配置执行各种转换操作。
    
    Args:
        config: 包含所有转换配置的字典
        
    Returns:
        包含处理结果统计的字典
    """
    logger.info("开始处理文件...")
    
    # 获取基本配置
    input_path = config.get("input_path", "")
    output_path = config.get("output_path", "")
    recursive = config.get("recursive", True)
    
    # 获取转换选项
    convert_to_ts = config.get("convert_to_ts", False)
    convert_to_lua = config.get("convert_to_lua", False)
    convert_to_ini = config.get("convert_to_ini", False)
    convert_ini_to_excel = config.get("convert_ini_to_excel", False)
    
    # 获取新增配置
    ini_output = config.get("ini_output", "")
    w3x2lni_path = config.get("w3x2lni_path", "")
    parse_w3x = config.get("parse_w3x", False)
    
    # 验证输入和输出路径
    if not input_path or not os.path.exists(input_path):
        logger.error(f"输入路径不存在: {input_path}")
        return {"processed": 0, "skipped": 0, "errors": 1, "details": [
            {"file": input_path, "status": "错误", "reason": "输入路径不存在"}
        ]}
    
    if not output_path:
        logger.error("未提供输出路径")
        return {"processed": 0, "skipped": 0, "errors": 1, "details": [
            {"file": "未设置", "status": "错误", "reason": "未提供输出路径"}
        ]}
    
    # 如果启用了w3x解析，但未设置w3x2lni路径，则记录错误
    if parse_w3x and (not w3x2lni_path or not os.path.exists(w3x2lni_path)):
        logger.error(f"启用了w3x解析，但w3x2lni路径不存在或未设置: {w3x2lni_path}")
        return {"processed": 0, "skipped": 0, "errors": 1, "details": [
            {"file": "未设置", "status": "错误", "reason": f"w3x2lni路径不存在或未设置: {w3x2lni_path}"}
        ]}
    
    # 确保输出目录存在
    os.makedirs(output_path, exist_ok=True)
    
    # 如果设置了ini输出目录，确保它存在
    if ini_output:
        os.makedirs(ini_output, exist_ok=True)
    
    # 初始化统计计数器
    processed = 0
    skipped = 0
    errors = 0
    details = []
    
    # 创建文件查找器，获取所有需要处理的文件
    files = find_files(input_path, recursive)
    
    # 处理w3x文件
    if parse_w3x:
        logger.info("开始处理w3x文件...")
        try:
            from src.core.w3x_parser import W3xParser
            
            # 查找w3x文件
            w3x_files = [f for f in files if f.lower().endswith('.w3x')]
            
            if w3x_files:
                # 创建w3x解析器
                w3x_parser = W3xParser(w3x2lni_path)
                
                for w3x_file in w3x_files:
                    logger.info(f"处理w3x文件: {w3x_file}")
                    
                    # 创建临时输出目录
                    w3x_basename = os.path.basename(w3x_file).replace('.w3x', '')
                    temp_output_dir = os.path.join(output_path, f"w3x_temp_{w3x_basename}")
                    
                    # 处理w3x文件
                    result = w3x_parser.process_w3x(w3x_file, temp_output_dir)
                    
                    if result["success"]:
                        processed += 1
                        logger.info(f"成功处理w3x文件: {w3x_file}")
                        details.append({
                            "file": w3x_file,
                            "status": "成功",
                            "reason": f"提取了 {len(result['tables'])} 个数据表"
                        })
                        
                        # 可以在这里添加更多对解析数据的处理...
                        # 例如将w3x数据转换为Excel等
                        
                        # 清理临时文件
                        w3x_parser.cleanup(temp_output_dir)
                    else:
                        errors += 1
                        logger.error(f"处理w3x文件失败: {w3x_file}, 错误: {', '.join(result['errors'])}")
                        details.append({
                            "file": w3x_file,
                            "status": "错误",
                            "reason": f"处理失败: {', '.join(result['errors'])}"
                        })
            else:
                logger.info("未找到任何w3x文件")
        except Exception as e:
            logger.error(f"处理w3x文件时发生错误: {e}", exc_info=True)
            errors += 1
            details.append({
                "file": "w3x处理",
                "status": "错误",
                "reason": f"处理w3x文件时发生错误: {e}"
            })
    
    # 处理Excel文件 (Excel -> TypeScript / Lua / Ini)
    logger.info("开始处理Excel文件...")
    
    # 查找Excel文件
    excel_files = [f for f in files if f.lower().endswith(('.xlsx', '.xls'))]
    
    if not excel_files and not files:
        logger.warning(f"在路径 {input_path} 下未找到任何文件")
        return {"processed": processed, "skipped": skipped, "errors": errors, "details": details}
    
    if not excel_files and files:
        logger.warning(f"在路径 {input_path} 下未找到任何Excel文件")
    
    # 处理每个Excel文件
    for excel_file in excel_files:
        try:
            logger.info(f"处理Excel文件: {excel_file}")
            
            # 解析Excel文件
            excel_parser = ExcelParser()
            excel_data = excel_parser.parse(excel_file)
            
            if excel_data is None:
                errors += 1
                logger.error(f"无法解析Excel文件: {excel_file}")
                details.append({
                    "file": excel_file,
                    "status": "错误",
                    "reason": "无法解析Excel文件"
                })
                continue
            
            # 生成TypeScript
            if convert_to_ts:
                try:
                    ts_outdir = os.path.join(output_path, "ts")
                    os.makedirs(ts_outdir, exist_ok=True)
                    TS_Generator.generate_ts(excel_data, ts_outdir)
                    logger.info(f"已生成TypeScript文件，输出到: {ts_outdir}")
                except Exception as e:
                    logger.error(f"生成TypeScript失败: {e}", exc_info=True)
            
            # 生成Lua
            if convert_to_lua:
                try:
                    lua_outdir = os.path.join(output_path, "lua")
                    os.makedirs(lua_outdir, exist_ok=True)
                    lua_generator = LuaGenerator()
                    lua_generator.generate(excel_data, lua_outdir)
                    logger.info(f"已生成Lua文件，输出到: {lua_outdir}")
                except Exception as e:
                    logger.error(f"生成Lua失败: {e}", exc_info=True)
            
            # 生成Ini
            if convert_to_ini:
                try:
                    ini_outdir = ini_output if ini_output else os.path.join(output_path, "ini")
                    os.makedirs(ini_outdir, exist_ok=True)
                    ini_generator = IniGenerator()
                    ini_generator.generate(excel_data, ini_outdir)
                    logger.info(f"已生成Ini文件，输出到: {ini_outdir}")
                except Exception as e:
                    logger.error(f"生成Ini失败: {e}", exc_info=True)
            
            processed += 1
            details.append({
                "file": excel_file,
                "status": "成功",
                "reason": "已处理"
            })
            
        except Exception as e:
            errors += 1
            logger.error(f"处理Excel文件时发生错误: {excel_file} - {e}", exc_info=True)
            details.append({
                "file": excel_file,
                "status": "错误",
                "reason": f"处理失败: {e}"
            })
    
    # 处理Ini文件 (Ini -> Excel)
    if convert_ini_to_excel:
        logger.info("开始处理Ini文件...")
        
        # 查找Ini文件
        ini_files = [f for f in files if f.lower().endswith('.ini')]
        
        if not ini_files:
            logger.warning(f"在路径 {input_path} 下未找到任何Ini文件")
        
        # 处理每个Ini文件
        for ini_file in ini_files:
            try:
                logger.info(f"处理Ini文件: {ini_file}")
                
                # 确定输出目录
                excel_outdir = os.path.join(output_path, "excel")
                os.makedirs(excel_outdir, exist_ok=True)
                
                # 解析Ini文件并转换为Excel
                excel_writer = ExcelWriter()
                excel_writer.ini_to_excel(ini_file, excel_outdir)
                
                processed += 1
                logger.info(f"已将Ini转换为Excel，输出到: {excel_outdir}")
                details.append({
                    "file": ini_file,
                    "status": "成功",
                    "reason": "已转换为Excel"
                })
                
            except Exception as e:
                errors += 1
                logger.error(f"将Ini转换为Excel时发生错误: {ini_file} - {e}", exc_info=True)
                details.append({
                    "file": ini_file,
                    "status": "错误",
                    "reason": f"转换失败: {e}"
                })
    
    # 返回处理结果
    logger.info(f"文件处理完成。已处理: {processed}, 已跳过: {skipped}, 错误: {errors}")
    return {
        "processed": processed,
        "skipped": skipped,
        "errors": errors,
        "details": details
    }