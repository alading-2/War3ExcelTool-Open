import os  # 导入操作系统模块，用于处理文件路径
import sys  # 导入系统模块，用于访问与Python解释器和系统相关的变量和函数
import argparse
from typing import Dict, Any

from PyQt5.QtWidgets import QApplication
from src.ui.main_window import MainWindow

from src.utils.logger import setup_logger
from src.utils.json_config import JsonConfigManager  # 使用新的JSON配置管理类

def parse_args():
    """解析命令行参数."""
    parser = argparse.ArgumentParser(
        description="War3ExcelTool",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,  # 显示默认值
    )

    # 只保留必要的输入/输出路径参数
    parser.add_argument("-i", "--input", required=True, help="设置Excel输入目录或文件")
    parser.add_argument("-o", "--output", required=True, help="设置基础输出目录")

    # 解析命令行参数
    return parser, parser.parse_args()

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
    # 判断运行模式
    is_cli_mode = len(sys.argv) > 1

    # 实例化配置管理器（不传参数，使用默认路径）
    config_manager = None
    # 获取当前脚本所在的目录
    base_dir = os.path.dirname(os.path.abspath(__file__))
    config_path = os.path.join(base_dir, "config.cfg")

    if is_cli_mode:
        # 命令行模式
        parser, args = parse_args()
        
        # 初始化配置管理器，如果指定了配置文件则使用指定的
        
        config_manager = JsonConfigManager(config_path)
        
        # 从配置中获取日志级别
        log_level = config_manager.get("log_level", "INFO")
        logger = setup_logger(log_level)
        logger.info("在命令行模式下运行。")
        
        # 关闭载入画面
        closesplash()
        
        # 构建配置字典，命令行参数优先级高于配置文件
        config = config_manager.get_all()  # 获取所有配置
        
        # 命令行参数覆盖配置文件中的路径设置
        config["input_path"] = os.path.normpath(args.input)
        config["output_path"] = os.path.normpath(args.output)
        
        # 验证是否有启用的转换类型
        if not any([config.get("convert_to_ts"), config.get("convert_to_lua"), 
                   config.get("convert_to_ini"), config.get("convert_ini_to_excel")]):
            logger.error("错误: 没有启用任何转换类型。请在配置文件中启用至少一种转换类型。")
            parser.print_help()
            sys.exit(1)
        
        # 运行核心处理器
        try:
            from src.core.processor import process_files
            results = process_files(config)
            logger.info(f"命令处理完成。已处理: {results.get('processed', 0)}, 已跳过: {results.get('skipped', 0)}, 错误: {results.get('errors', 0)}")
            # 退出程序
            sys.exit(0 if results.get("errors", 0) == 0 else 1)
        except Exception as e:
            logger.error(f"命令行模式处理期间发生意外错误: {e}", exc_info=True)
            sys.exit(1)
    else:
        # GUI模式
        config_manager = JsonConfigManager()
        log_level = config_manager.get("log_level", "INFO")
        logger = setup_logger(log_level)
        logger.info("GUI模式下运行。")
        
        # 关闭载入画面
        closesplash()
        
        try:
            app = QApplication(sys.argv)
            app.setApplicationName("Excel到TypeScript转换工具")
            # MainWindow将使用JsonConfigManager加载配置
            main_window = MainWindow(config_path)
            main_window.show()
            sys.exit(app.exec_())
        except Exception as e:
            logger.error(f"启动GUI时发生错误: {e}", exc_info=True)
            sys.exit(1)

# 这个条件判断确保只有直接运行此文件时才会执行main()函数
# 如果这个文件被作为模块导入，则不会执行main()
if __name__ == "__main__":
    main()  # 调用主函数开始程序执行
