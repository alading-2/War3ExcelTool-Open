import os
import logging
from PyQt5.QtWidgets import QApplication  # 从PyQt5导入QApplication类，用于创建GUI应用
import sys
import argparse
parser=argparse.ArgumentParser()
# 设置输出的格式
LOG_FORMAT = "时间：%(asctime)s - 日志等级：%(levelname)s - 日志信息：%(message)s"
# 对logger进行配置——日志等级&输出格式
logging.basicConfig(level=logging.INFO, format=LOG_FORMAT)
logger = logging.getLogger(__name__)

parser=argparse.ArgumentParser()
# # 添加输入目录参数，用-i或--input指定，必需
# parser.add_argument("-i", "--input", help="设置Excel输入目录或文件")
# # 添加输出目录参数，用-o或--output指定，必需
# parser.add_argument("-o", "--output", help="设置基础输出目录")
# # 添加日志级别参数，用--log-level指定
# parser.add_argument(
#     "--log-level",
#     choices=["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],  # 可选值
#     default="INFO",  # 默认值
#     help="日志级别",
# )
logger.info("folder:"+"${folder}")

pass