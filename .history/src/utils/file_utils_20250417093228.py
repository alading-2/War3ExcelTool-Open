import os  # 导入操作系统模块，用于处理文件路径和目录操作
import glob  # 导入glob模块，用于文件路径模式匹配
from typing import List, Optional  # 导入类型提示功能
import logging  # 导入日志模块
import re

# 获取当前模块的日志记录器
logger = logging.getLogger(__name__)  # __name__是Python的特殊变量，表示当前模块名称


def find_excel_files(input_dir: str, recursive: bool = False,extension=("*.xls", "*.xlsx")) -> List[str]:
    """
    在指定目录中查找Excel文件

    扫描指定目录，查找所有扩展名为.xlsx的Excel文件。
    如果启用递归，还会搜索所有子目录。

    Args:
        input_dir: 要搜索的目录路径，如"C:/data"
        recursive: 是否递归搜索子目录，默认为False（只搜索当前目录）

    Returns:
        Excel文件路径列表，包含所有找到的Excel文件的完整路径

    Example:
        >>> files = find_excel_files("C:/data", True)
        >>> print(files)
        ['C:/data/file1.xlsx', 'C:/data/subfolder/file2.xlsx']
    """
    # 记录日志，表示开始在指定目录中查找Excel文件
    logger.info(f"在目录 {input_dir} 中查找Excel文件，递归={recursive}")

    # 匹配.xls和.xlsx文件
    # 递归：'input_dir\\**\\*.xls', 'input_dir\\**\\*.xlsx'
    # 不递归：'input_dir\\*.xls', 'input_dir\\*.xlsx'
    patterns = [
        os.path.join(input_dir, "**" if recursive else "", ext)
        for ext in extension
    ]

    # 合并两种扩展名的搜索结果
    excel_files = []
    for pattern in patterns:
        excel_files.extend(glob.glob(pattern, recursive=recursive))

    # 过滤掉临时文件~$
    excel_files = [f for f in excel_files if not os.path.basename(f).startswith("~$")]

    logger.debug(f"找到 {len(excel_files)} 个Excel文件")
    return excel_files


def ensure_directory(path: str) -> bool:
    """
    确保目录存在，如果不存在则创建
    如果父目录不存在，会自动创建所有必要的父目录。
    Args:
        path: 要确保存在的目录路径
    Returns:
        是否成功创建/确认目录：True表示成功，False表示失败
    Example:
        >>> success = ensure_directory("C:/data/output")
        >>> if success:
        ...     print("目录已准备好")
        ... else:
        ...     print("无法创建目录")
    """
    try:
        # 使用os.makedirs创建目录及其所有必要的父目录
        # exist_ok=True表示如果目录已存在也不报错，直接返回
        os.makedirs(path, exist_ok=True)
        # 成功创建或确认目录存在，返回True
        return True
    except Exception as e:
        # 如果发生任何错误（如权限问题、磁盘已满等），记录错误并返回False
        logger.error(f"创建目录时出错: {str(e)}")
        return False

def get_excel_name(file_path: str) -> str:
    """
    从Excel文件路径中提取文件名（不含扩展名）
    """
    # os.path.basename 从路径中提取文件名（含扩展名）
    # 例如，从"C:/data/example.xlsx"提取"example.xlsx"
    base_name = os.path.basename(file_path)

    # os.path.splitext 将文件名分割为名称和扩展名
    # 返回一个元组：(名称, 扩展名)
    # 例如，将"example.xlsx"分割为("example", ".xlsx")
    # [0]表示获取元组的第一个元素，即不含扩展名的文件名
    excel_name = os.path.splitext(base_name)[0]

    # 返回提取的Excel文件名（不含扩展名）
    return excel_name


def create_output_path(input_file: str, output_dir: str, extension: str = ".ts") -> str:
    """
    根据输入文件创建输出文件路径

    生成输出文件的完整路径，基于输入文件名、输出目录和文件扩展名。
    输出文件名会添加"xlsx_"前缀，以标识它是从Excel转换而来。

    Args:
        input_file: 输入文件的完整路径
        output_dir: 输出文件所在的目录
        extension: 输出文件的扩展名，默认为".ts"（TypeScript）

    Returns:
        输出文件的完整路径

    Example:
        >>> path = create_output_path("C:/data/example.xlsx", "C:/output", ".ts")
        >>> print(path)
        'C:/output/xlsx_example.ts'
    """
    # 从输入文件路径获取Excel文件名（不含扩展名）
    excel_name = get_excel_name(input_file)

    # 构建输出文件名：添加"xlsx_"前缀和指定的扩展名
    output_name = f"xlsx_{excel_name}{extension}"

    # 使用os.path.join将输出目录和文件名连接成完整路径
    # 这样可以正确处理不同操作系统的路径分隔符
    return os.path.join(output_dir, output_name)
