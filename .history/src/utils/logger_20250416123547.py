import os  # 导入操作系统模块，用于处理文件路径和目录创建
import logging  # 导入日志模块，Python的标准日志系统
import sys  # 导入系统模块，用于访问标准输出流
from logging.handlers import RotatingFileHandler  # 导入滚动文件处理器，用于管理日志文件大小和数量
import colorlog  # 导入彩色日志模块，用于在控制台显示彩色日志
from typing import Optional  # 导入可选类型提示

# 普通日志格式，用于写入文件
# %(asctime)s：日期和时间
# %(levelname)s：日志级别（DEBUG, INFO, WARNING, ERROR, CRITICAL）
# %(name)s：日志记录器名称
# %(message)s：日志消息内容
LOG_FORMAT = "[时间]：%(asctime)s ，[等级]：%(levelname)s，[name]: %(name)s，[message]: %(message)s"

# 彩色日志格式，用于控制台输出
# 添加了colorlog特有的颜色标记：log_color和reset
COLOR_LOG_FORMAT = "%(log_color)s，[时间]：%(asctime)s [%(levelname)s] %(name)s: %(message)s%(reset)s"

# 颜色映射字典，指定不同日志级别对应的颜色
# 这样在控制台查看日志时更容易区分不同级别的信息
color_mapping = {
    'DEBUG': 'cyan',      # 调试信息显示为青色
    'INFO': 'green',      # 普通信息显示为绿色
    'WARNING': 'yellow',  # 警告信息显示为黄色
    'ERROR': 'red',       # 错误信息显示为红色
    'CRITICAL': 'red,bg_white',  # 严重错误显示为红色文字白色背景
}

def setup_logger(log_dir: Optional[str] = None, log_level: str = "INFO") -> logging.Logger:
    """
    设置全局日志配置
    
    此函数配置Python的日志系统，包括输出格式、颜色、日志级别等。
    可以同时将日志输出到控制台（彩色）和文件（普通格式）。
    
    Args:
        log_dir: 日志文件目录路径，如果为None则仅输出到控制台
        log_level: 日志级别字符串，可以是"DEBUG"、"INFO"、"WARNING"、"ERROR"或"CRITICAL"
        
    Returns:
        配置好的根日志记录器对象
        
    Example:
        >>> logger = setup_logger("logs", "DEBUG")
        >>> logger.debug("这是一条调试信息")
        >>> logger.info("这是一条普通信息")
        >>> logger.warning("这是一条警告信息")
    """
    # 创建根日志记录器，这是所有日志记录器的父级
    # 配置根记录器会影响所有子记录器
    root_logger = logging.getLogger()
    
    # 清除现有的日志处理器，避免重复配置导致日志重复输出
    for handler in root_logger.handlers[:]:
        root_logger.removeHandler(handler)
    
    # 将日志级别字符串转换为logging模块中的常量
    # getattr函数从logging模块获取对应级别的常量值
    # 如果指定的级别不存在，则默认使用INFO级别
    level = getattr(logging, log_level.upper(), logging.INFO)
    # 设置根日志记录器的日志级别
    root_logger.setLevel(level)
    
    # 创建控制台处理器，将日志输出到标准输出（屏幕）
    console_handler = logging.StreamHandler(sys.stdout)
    # 设置控制台处理器的日志级别
    console_handler.setLevel(level)
    
    # 为控制台处理器创建彩色日志格式化器
    # 这样在控制台看到的日志会带有颜色
    color_formatter = colorlog.ColoredFormatter(
        COLOR_LOG_FORMAT,  # 使用之前定义的彩色日志格式
        log_colors=color_mapping  # 使用之前定义的颜色映射
    )
    # 将彩色格式化器应用到控制台处理器
    console_handler.setFormatter(color_formatter)
    # 将控制台处理器添加到根日志记录器
    root_logger.addHandler(console_handler)
    
    # 如果指定了日志目录，还添加文件处理器用于将日志写入文件
    if log_dir:
        # 确保日志目录存在，如果不存在则创建
        os.makedirs(log_dir, exist_ok=True)
        
        # 创建滚动文件处理器
        # 当日志文件达到指定大小时，会自动创建新文件并保留一定数量的备份
        file_handler = RotatingFileHandler(
            os.path.join(log_dir, "excel_to_ts.log"),  # 日志文件路径
            maxBytes=10 * 1024 * 1024,  # 单个日志文件最大大小：10 MB
            backupCount=5,  # 最多保留5个备份文件
            encoding="utf-8"  # 使用UTF-8编码写入文件
        )
        # 设置文件处理器的日志级别
        file_handler.setLevel(level)
        
        # 为文件处理器创建普通格式化器（不带颜色）
        file_formatter = logging.Formatter(LOG_FORMAT)
        # 将普通格式化器应用到文件处理器
        file_handler.setFormatter(file_formatter)
        # 将文件处理器添加到根日志记录器
        root_logger.addHandler(file_handler)
    
    # 返回配置好的根日志记录器
    return root_logger

def get_logger(name: str) -> logging.Logger:
    """
    获取指定名称的日志记录器
    
    这个函数返回一个指定名称的日志记录器。通常每个模块都应该有自己的日志记录器，
    这样可以在日志中标识出是哪个模块产生的日志信息。
    
    Args:
        name: 日志记录器名称，通常使用模块的名称（如`__name__`变量的值）
        
    Returns:
        指定名称的日志记录器对象
        
    Example:
        >>> logger = get_logger(__name__)  # 在模块中使用
        >>> logger.info("这是一条来自特定模块的日志消息")
    """
    # 使用logging.getLogger函数获取指定名称的日志记录器
    # 如果该名称的记录器不存在，会创建一个新的记录器
    # 这个记录器会继承根记录器的配置，但可以有自己的设置
    return logging.getLogger(name)