import os
import sys
import argparse
import traceback
from typing import List, Optional
from src.core.excel_to_ts import ExcelToTypeScript


def parse_arguments() -> argparse.Namespace:
    """
    解析命令行参数。
    
    返回:
        argparse.Namespace: 解析后的命令行参数
    """
    parser = argparse.ArgumentParser(
        description="将Excel文件转换为TypeScript接口和常量"
    )
    
    parser.add_argument(
        "excel_file",
        type=str,
        help="要转换的Excel文件路径"
    )
    
    parser.add_argument(
        "-o", "--output-dir",
        type=str,
        default="ts_output",
        help="TypeScript文件保存的目录(默认: ts_output)"
    )
    
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="启用详细输出"
    )
    
    return parser.parse_args()


def main():
    """Excel到TypeScript转换器的主入口点。"""
    try:
        args = parse_arguments()
        
        # 获取绝对路径
        excel_file = os.path.abspath(args.excel_file)
        output_dir = os.path.abspath(args.output_dir)
        
        if args.verbose:
            print(f"Excel文件: {excel_file}")
            print(f"输出目录: {output_dir}")
        
        # 创建转换器
        converter = ExcelToTypeScript()
        
        # 转换Excel文件
        generated_files = converter.convert_excel_to_ts(excel_file, output_dir)
        
        # 打印结果
        print(f"成功生成了{len(generated_files)}个TypeScript文件:")
        for file_path in generated_files:
            print(f"  - {os.path.relpath(file_path, os.getcwd())}")
        
        return 0
    
    except FileNotFoundError as e:
        print(f"错误: {str(e)}")
        return 1
    
    except Exception as e:
        print(f"错误: {str(e)}")
        if 'args' in locals() and args.verbose:
            print(traceback.format_exc())
        return 1


if __name__ == "__main__":
    sys.exit(main()) 