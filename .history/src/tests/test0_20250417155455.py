import os
import logging
from PyQt5.QtWidgets import QApplication  # 从PyQt5导入QApplication类，用于创建GUI应用
import sys
import argparse
from .src.core.ini_parser import IniParser
parser=argparse.ArgumentParser()
# 设置输出的格式
LOG_FORMAT = "时间：%(asctime)s - 日志等级：%(levelname)s - 日志信息：%(message)s"
# 对logger进行配置——日志等级&输出格式
logging.basicConfig(level=logging.INFO, format=LOG_FORMAT)
logger = logging.getLogger(__name__)

Ini_Parser = IniParser()
logger.info("folder:"+"${folder}")

pass