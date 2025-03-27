import sys
import os
import argparse
from typing import Dict, Any
from PyQt5.QtWidgets import QApplication

from .ui.main_window import MainWindow
from .utils.logger import setup_logger
from .utils.config_manager import ConfigManager

def parse_args():
    """解析命令行参数"""
    parser = argparse.ArgumentParser(description="Excel到TypeScript转换工具")
    
    parser.add_argument(
        "-i", "--input", 
        help="输入目录，包含要转换的Excel文件"
    )
    parser.add_argument(
        "-o", "--output", 
        help="输出目录，生成的TypeScript文件将保存在此处"
    )
    parser.add_argument(
        "-r", "--recursive", 
        action="store_true",
        help="递归处理子目录中的Excel文件"
    )
    parser.add_argument(
        "--log-level", 
        choices=["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],
        default="INFO",
        help="日志级别"
    )
    parser.add_argument(
        "--batch-size", 
        type=int, 
        default=10,
        help="批处理大小"
    )
    
    return parser.parse_args()

def main():
    """程序入口点"""
    # 解析命令行参数
    args = parse_args()
    
    # 加载配置
    config_manager = ConfigManager()
    
    # 如果提供了命令行参数，更新配置
    if args.input:
        config_manager.set("input_dir", args.input)
    if args.output:
        config_manager.set("output_dir", args.output)
    if args.recursive:
        config_manager.set("recursive", True)
    if args.log_level:
        config_manager.set("log_level", args.log_level)
    if args.batch_size:
        config_manager.set("batch_size", args.batch_size)
    
    # 设置日志记录器
    log_level = config_manager.get("log_level", "INFO")
    user_home = os.path.expanduser("~")
    log_dir = os.path.join(user_home, ".excel_to_ts", "logs")
    logger = setup_logger(log_dir, log_level)
    
    # 创建应用程序
    app = QApplication(sys.argv)
    app.setApplicationName("Excel到TypeScript转换工具")
    
    # 创建并显示主窗口
    main_window = MainWindow()
    main_window.show()
    
    # 运行应用程序
    sys.exit(app.exec_())

if __name__ == "__main__":
    main() 