import os  # 导入操作系统模块，用于处理文件路径
import sys  # 导入系统模块，用于访问与Python解释器和系统相关的变量和函数
import os
import sys
import argparse
from typing import Dict, Any

from PyQt5.QtWidgets import QApplication
from src.ui.main_window import MainWindow

from src.utils.logger import setup_logger
from src.utils.config_manager import ConfigManager # 保留用于潜在的默认值
# 需要时导入处理器函数
# from src.core.processor import process_files

def parse_args():
    """解析命令行参数."""
    parser = argparse.ArgumentParser(
        description="War3ExcelTool",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,  # 显示默认值
    )

    # 添加输入目录参数，用-i或--input指定，必需
    parser.add_argument("-i", "--input",required=True, help="设置Excel输入目录或文件")
    # 添加输出目录参数，用-o或--output指定，必需
    parser.add_argument("-o", "--output",required=True, help="设置基础输出目录")
    # 添加递归处理选项，用-r或--recursive指定，是一个开关型参数 (此参数逻辑已调整，不再直接使用)
    parser.add_argument(
        "-r",
        "--recursive",
        # * 注意：此参数的 action 和 help 已更新，不再遵循旧逻辑
        action="store_true", # 默认不递归
        help="递归处理输入目录中的Excel文件", # 帮助信息更新
    )
    # 启用 Excel -> TS 转换
    parser.add_argument(
        "--to-ts", # 参数名规范化
        action="store_true", # 默认不开启
        help="启用 Excel -> TypeScript 转换", # 帮助信息更新
    )
    # 启用 Excel -> Lua 转换
    parser.add_argument(
        "--to-lua", # 参数名规范化
        action="store_true", # 默认不开启
        help="启用 Excel -> Lua 转换", # 帮助信息更新
    )
    # 启用 Excel -> Ini 转换
    parser.add_argument(
        "--to-ini", # 参数名规范化
        action="store_true", # 默认不开启
        help="启用 Excel -> Ini 转换", # 帮助信息更新
    )
    # 启用 Ini -> Excel 转换
    parser.add_argument(
        "--ini-to-excel", # 参数名规范化
        action="store_true", # 默认不开启
        help="启用 Ini -> Excel 转换", # 帮助信息更新
    )
    # 添加日志级别参数，用--log-level指定
    parser.add_argument(
        "--log-level",
        choices=["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],  # 可选值
        default="INFO",  # 默认值
        help="日志级别",
    )
    # 解析命令行参数
    return parser,parser.parse_args()

def closesplash():
    """关闭exe的加载画面"""
    try:
        import pyi_splash
        pyi_splash.close()
    except:
        pass

def main():
    """程序入口点

    这是程序的主函数，负责初始化应用程序，包括：
    1. 解析命令行参数
    2. 加载和更新配置
    3. 设置日志系统
    4. 创建并启动GUI应用

    程序执行从这里开始，直到GUI应用关闭为止。
    """
    # 使用命令行参数或默认值设置日志级别
    log_level = "INFO"
    # 获取用户主目录路径
    user_home = os.path.expanduser("~")
    # 在用户主目录下创建日志目录
    log_dir = os.path.join(user_home, ".war3exceltool", "logs")
    # 设置日志记录器
    logger = setup_logger(log_dir, log_level)

    # 关闭载入画面
    closesplash()

    # --- 判断运行模式 --- 
    # 参数>1，命令行模型，否则GUI模式
    is_cli_mode = len(sys.argv) > 1

    # --- 根据模式执行 --- 
    if is_cli_mode: 
        # 命令行模式
        logger.info("在命令行模式下运行。")
        # 解析命令行参数
        parser,args = parse_args()
        # --- 命令行 参数验证 ---
        # 必须指定至少一种转换类型
        if not (args.to_ts or args.to_lua or args.to_ini or args.ini_to_excel): 
            logger.error("错误: 命令行模式必须指定至少一种转换类型 (--to-ts, --to-lua, --to-ini, --ini-to-excel)。")
            parser.print_help() # 打印帮助信息
            sys.exit(1) # 退出程序

        # --- 为处理器构建配置字典 --- 
        config = {
            # 路径
            "input_path": args.input,
            "output_path": args.output,
            # 转换标志
            "convert_to_ts": args.to_ts,
            "convert_to_lua": args.to_lua,
            "convert_to_ini": args.to_ini,
            "convert_ini_to_excel": args.ini_to_excel,
            # 其他设置 (直接从参数获取或使用默认值)
            "recursive": args.recursive, # 递归标志
            # "template_path": args.template_path or "", # 模板路径 (如果需要)
            "log_level": log_level, # 日志级别
        }

        # --- 运行核心处理器 --- 
        try:
            # 在此处导入以避免仅运行GUI时的依赖
            from src.core.processor import process_files 
            results = process_files(config) # 调用核心处理函数
            logger.info(f"命令处理完成。已处理: {results.get('processed', 0)}, 已跳过: {results.get('skipped', 0)}, 错误: {results.get('errors', 0)}")
            # 如果发生错误，则以错误代码退出
            sys.exit(1 if results.get("errors", 0) > 0 else 0)
        except Exception as e: # 捕获GUI启动错误 # 捕获其他意外错误
            logger.error(f"命令行模式 处理期间发生意外错误: {e}", exc_info=True)
            sys.exit(1) # 退出程序

    else: # 否则，进入GUI模式
        # --- GUI 模式 --- 
        logger.info("GUI模式下运行。")
        
        try:
            app = QApplication(sys.argv) # 创建Qt应用
            app.setApplicationName("War3ExcelTool") # 设置应用名称
            # MainWindow 将通过 ConfigManager 从文件加载自己的配置
            main_window = MainWindow() # 创建主窗口
            main_window.show() # 显示主窗口
            sys.exit(app.exec_()) # 启动Qt事件循环
        except Exception as e: # 捕获GUI启动错误 # 捕获其他意外错误
            logger.error(f"启动GUI时发生错误: {e}", exc_info=True)
            sys.exit(1) # 退出程序


# 这个条件判断确保只有直接运行此文件时才会执行main()函数
# 如果这个文件被作为模块导入，则不会执行main()
if __name__ == "__main__":
    main()  # 调用主函数开始程序执行
