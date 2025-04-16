import os
import logging
from PyQt5.QtWidgets import QApplication  # 从PyQt5导入QApplication类，用于创建GUI应用
import sys
# 设置输出的格式
LOG_FORMAT = "时间：%(asctime)s - 日志等级：%(levelname)s - 日志信息：%(message)s"
# 对logger进行配置——日志等级&输出格式
logging.basicConfig(level=logging.INFO, format=LOG_FORMAT)
logger = logging.getLogger(__name__)

# 创建Qt应用程序对象，传入命令行参数
app = QApplication()
# 设置应用程序名称，用于显示在标题栏等处
app.setApplicationName("War3ExcelTool")