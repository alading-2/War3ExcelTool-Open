import os
from src.utils.logger import get_logger
logger = get_logger()
recursive=True
input_dir = "C:/Users"
patterns = [
        os.path.join(input_dir, "**" if recursive else "", ext)
        for ext in ["*.xls", "*.xlsx"]
    ]
logger.info(patterns)