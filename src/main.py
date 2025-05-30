import os  # 导入操作系统模块，用于处理文件路径
import sys  # 导入系统模块，用于访问与Python解释器和系统相关的变量和函数

project_root = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(project_root))
import argparse
from typing import Dict, Any

from PyQt5.QtWidgets import QApplication

from src.utils.logger import setup_logger

from src.utils.project_info import ProjectInfo  # 导入项目信息
from dataclasses import dataclass


def parse_args():
    """解析命令行参数."""
    parser = argparse.ArgumentParser(
        description=ProjectInfo.name,
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,  # 显示默认值
    )

    # 只保留必要的输入/输出路径参数
    parser.add_argument("-i", "--input", required=True, help="设置Excel输入目录或文件")
    parser.add_argument("-o", "--output", required=True, help="设置基础输出目录")
    parser.add_argument("--ini-output", help="设置生成INI文件的输出路径")
    # 解析命令行参数
    return parser, parser.parse_args()


def closesplash():
    """关闭exe的加载画面"""
    try:
        import pyi_splash  # type: ignore
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

    # 获取当前脚本所在的目录
    main_abs_path: str = os.path.abspath(__file__)
    main_base_dir = os.path.dirname(main_abs_path)

    # 判断是否在打包环境中运行
    if getattr(sys, 'frozen', False):
        # 如果是打包后的exe，使用exe所在目录
        exe_dir = os.path.dirname(sys.executable)
        config_path = os.path.join(exe_dir, "config.cfg")
    else:
        # 开发环境
        config_path = os.path.join(main_base_dir, "config.cfg")

    # 用ProjectInfo统一记录
    ProjectInfo.main_abs_path = main_abs_path
    ProjectInfo.main_base_dir = main_base_dir
    ProjectInfo.config_path = config_path

    from src.utils.config_manager import ConfigManager  # 使用配置管理类
    ConfigManager.config_path = config_path  # 设置配置文件路径
    config_manager = ConfigManager()

    # 读取初始化文件
    ProjectInfo.read_init_file()

    # 从配置中获取日志级别
    log_level = config_manager.get("log_level", "INFO")
    logger = setup_logger(log_level)

    if is_cli_mode:
        ProjectInfo.mode = "cli"  # 设置运行模式为cli
        # 命令行模式
        parser, args = parse_args()

        logger.info("在命令行模式下运行。")

        # 关闭载入画面
        closesplash()

        # 构建配置字典，命令行参数优先级高于配置文件
        config = config_manager.get_all()  # 获取所有配置

        # 命令行参数覆盖配置文件中的路径设置
        config["input_path"] = os.path.normpath(args.input)
        config["output_path"] = os.path.normpath(args.output)
        if args.ini_output:
            config["ini_output"] = os.path.normpath(args.ini_output)

        # 更新静态配置
        config_manager.update(config)

        # 验证是否有启用的转换类型
        if not any([
                config.get("convert_to_ts"),
                config.get("convert_to_lua"),
                config.get("convert_to_ini"),
                config.get("convert_ini_to_excel")
        ]):
            logger.error("错误: 没有启用任何转换类型。请在配置文件中启用至少一种转换类型。")
            parser.print_help()
            sys.exit(1)

        # 运行核心处理器
        try:
            from src.core.processor import process_files
            results = process_files()
            logger.info(
                f"命令处理完成。已处理: {results.get('processed', 0)}, 已跳过: {results.get('skipped', 0)}, 错误: {results.get('errors', 0)}"
            )
            # 退出程序
            sys.exit(0 if results.get("errors", 0) == 0 else 1)
        except Exception as e:
            logger.error(f"命令行模式处理期间发生意外错误: {e}", exc_info=True)
            sys.exit(1)
    else:
        # GUI模式
        ProjectInfo.mode = "gui"  # 设置运行模式为gui
        logger.info("GUI模式下运行。")

        # 关闭载入画面
        closesplash()

        try:
            app = QApplication(sys.argv)
            app.setApplicationName(ProjectInfo.name)
            # MainWindow将使用配置管理器加载配置
            from src.ui.main_window import MainWindow
            main_window = MainWindow()
            main_window.show()
            sys.exit(app.exec_())
        except Exception as e:
            logger.error(f"启动GUI时发生错误: {e}", exc_info=True)
            sys.exit(1)


# 这个条件判断确保只有直接运行此文件时才会执行main()函数
# 如果这个文件被作为模块导入，则不会执行main()
if __name__ == "__main__":
    main()  # 调用主函数开始程序执行
