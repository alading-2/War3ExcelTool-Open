import os
import logging
# # 设置输出的格式
# LOG_FORMAT = "时间：%(asctime)s - 日志等级：%(levelname)s - 日志信息：%(message)s"
# # 对logger进行配置——日志等级&输出格式
# logging.basicConfig(level=logging.INFO, format=LOG_FORMAT)
logger = logging.getLogger(__name__)
recursive=True
input_dir = "C:/Users"
patterns = [
        os.path.join(input_dir, "**" if recursive else "", ext)
        for ext in ["*.xls", "*.xlsx"]
    ]
print(patterns)
logger.info(patterns)