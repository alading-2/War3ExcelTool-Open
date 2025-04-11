import sys  # 导入系统模块，用于访问系统级功能，如命令行参数和程序退出
import os  # 导入操作系统模块，用于处理文件路径
import argparse  # 导入命令行参数解析模块，用于解析命令行参数
from typing import Dict, Any, List, Optional  # 导入类型提示功能
from PyQt5.QtWidgets import QApplication  # 从PyQt5导入QApplication类，用于创建GUI应用
import traceback

# 从项目中导入自定义模块
from src.ui.main_window import MainWindow  # 导入主窗口界面类
from src.utils.logger import setup_logger  # 导入日志设置函数
from src.utils.config_manager import ConfigManager  # 导入配置管理器类
from src.core.excel_to_ts import ExcelToTypeScript  # 导入Excel到TypeScript转换器

def parse_arguments() -> argparse.Namespace:
    """
    Parse command line arguments.
    
    Returns:
        argparse.Namespace: Parsed command line arguments
    """
    parser = argparse.ArgumentParser(
        description="Convert Excel files to TypeScript interfaces and constants"
    )
    
    parser.add_argument(
        "excel_file",
        type=str,
        help="Path to the Excel file to convert"
    )
    
    parser.add_argument(
        "-o", "--output-dir",
        type=str,
        default="ts_output",
        help="Directory where the TypeScript files will be saved (default: ts_output)"
    )
    
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Enable verbose output"
    )
    
    return parser.parse_args()

def main():
    """Main entry point for the Excel to TypeScript converter."""
    try:
        args = parse_arguments()
        
        # Get absolute paths
        excel_file = os.path.abspath(args.excel_file)
        output_dir = os.path.abspath(args.output_dir)
        
        if args.verbose:
            print(f"Excel file: {excel_file}")
            print(f"Output directory: {output_dir}")
        
        # Create the converter
        converter = ExcelToTypeScript()
        
        # Convert the Excel file
        generated_files = converter.convert_excel_to_ts(excel_file, output_dir)
        
        # Print the results
        print(f"Successfully generated {len(generated_files)} TypeScript files:")
        for file_path in generated_files:
            print(f"  - {os.path.relpath(file_path, os.getcwd())}")
        
        return 0
    
    except FileNotFoundError as e:
        print(f"Error: {str(e)}")
        return 1
    
    except Exception as e:
        print(f"Error: {str(e)}")
        if args.verbose:
            print(traceback.format_exc())
        return 1

# 这个条件判断确保只有直接运行此文件时才会执行main()函数
# 如果这个文件被作为模块导入，则不会执行main()
if __name__ == "__main__":
    sys.exit(main()) 