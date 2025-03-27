import os
import logging
import sys
from logging.handlers import RotatingFileHandler
import colorlog
from typing import Optional

# 日志格式
LOG_FORMAT = "%(asctime)s [%(levelname)s] %(name)s: %(message)s"
COLOR_LOG_FORMAT = "%(log_color)s%(asctime)s [%(levelname)s] %(name)s: %(message)s%(reset)s"

# 颜色映射
color_mapping = {
    'DEBUG': 'cyan',
    'INFO': 'green',
    'WARNING': 'yellow',
    'ERROR': 'red',
    'CRITICAL': 'red,bg_white',
}

def setup_logger(log_dir: Optional[str] = None, log_level: str = "INFO") -> logging.Logger:
    """
    设置全局日志配置
    
    Args:
        log_dir: 日志文件目录，如果为None则仅输出到控制台
        log_level: 日志级别
        
    Returns:
        日志记录器
    """
    # 创建根日志记录器
    root_logger = logging.getLogger()
    
    # 清除现有处理器
    for handler in root_logger.handlers[:]:
        root_logger.removeHandler(handler)
    
    # 设置日志级别
    level = getattr(logging, log_level.upper(), logging.INFO)
    root_logger.setLevel(level)
    
    # 创建控制台处理器
    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setLevel(level)
    
    # 添加颜色
    color_formatter = colorlog.ColoredFormatter(
        COLOR_LOG_FORMAT,
        log_colors=color_mapping
    )
    console_handler.setFormatter(color_formatter)
    root_logger.addHandler(console_handler)
    
    # 如果指定了日志目录，还添加文件处理器
    if log_dir:
        os.makedirs(log_dir, exist_ok=True)
        file_handler = RotatingFileHandler(
            os.path.join(log_dir, "excel_to_ts.log"),
            maxBytes=10 * 1024 * 1024,  # 10 MB
            backupCount=5,
            encoding="utf-8"
        )
        file_handler.setLevel(level)
        file_formatter = logging.Formatter(LOG_FORMAT)
        file_handler.setFormatter(file_formatter)
        root_logger.addHandler(file_handler)
    
    return root_logger

def get_logger(name: str) -> logging.Logger:
    """
    获取指定名称的日志记录器
    
    Args:
        name: 日志记录器名称
        
    Returns:
        日志记录器
    """
    return logging.getLogger(name) 