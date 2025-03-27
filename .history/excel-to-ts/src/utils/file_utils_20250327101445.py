import os
import glob
from typing import List, Optional
import logging
from .logger import get_logger

logger = get_logger(__name__)

def find_excel_files(directory: str, recursive: bool = False) -> List[str]:
    """
    在指定目录中查找Excel文件
    
    Args:
        directory: 要搜索的目录
        recursive: 是否递归搜索子目录
        
    Returns:
        Excel文件路径列表
    """
    logger.info(f"在目录 {directory} 中查找Excel文件，递归={recursive}")
    pattern = os.path.join(directory, "**" if recursive else "", "*.xlsx")
    excel_files = glob.glob(pattern, recursive=recursive)
    logger.debug(f"找到 {len(excel_files)} 个Excel文件")
    return excel_files

def ensure_directory(path: str) -> bool:
    """
    确保目录存在，如果不存在则创建
    
    Args:
        path: 目录路径
        
    Returns:
        是否成功创建/确认目录
    """
    try:
        os.makedirs(path, exist_ok=True)
        return True
    except Exception as e:
        logger.error(f"创建目录时出错: {str(e)}")
        return False

def get_excel_name(file_path: str) -> str:
    """
    从Excel文件路径中提取文件名（不含扩展名）
    
    Args:
        file_path: Excel文件路径
        
    Returns:
        文件名（不含扩展名）
    """
    base_name = os.path.basename(file_path)
    excel_name = os.path.splitext(base_name)[0]
    return excel_name

def create_output_path(input_file: str, output_dir: str, extension: str = ".ts") -> str:
    """
    根据输入文件创建输出文件路径
    
    Args:
        input_file: 输入文件路径
        output_dir: 输出目录
        extension: 输出文件扩展名
        
    Returns:
        输出文件路径
    """
    excel_name = get_excel_name(input_file)
    output_name = f"xlsx_{excel_name}{extension}"
    return os.path.join(output_dir, output_name) 