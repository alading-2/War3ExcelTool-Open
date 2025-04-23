"""
命令行参数处理模块
用于解析和存储命令行参数
"""

import argparse
from dataclasses import dataclass
from typing import Optional


@dataclass
class MainArgs:
    """程序启动的命令行参数"""
    input_dir: Optional[str] = None  # 输入目录路径
    output_dir: Optional[str] = None  # 输出目录路径

    @classmethod
    def parse_args(cls):
        """解析命令行参数"""
        parser = argparse.ArgumentParser(description="Excel数据转换工具")
        parser.add_argument('-i', '--input', dest='input_dir', help='输入目录路径')
        parser.add_argument('-o', '--output', dest='output_dir', help='输出目录路径')

        args = parser.parse_args()
        return cls(input_dir=args.input_dir, output_dir=args.output_dir)
