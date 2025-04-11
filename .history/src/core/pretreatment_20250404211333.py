import re
import pandas as pd
import numpy as np
from typing import Dict, Any, List, Set, Tuple, Optional, Callable
import logging
from src.utils.logger import get_logger

# 获取日志记录器
logger = get_logger(__name__)

# 有效的预处理指令集合
VALID_PREPROCESSORS = {"#default", "#path"}

# 预处理函数类型注解
PreprocessorFn = Callable[[Any, Any], Any]

def extract_preprocessor_directives(
    df: pd.DataFrame, 
    max_directive_rows: int = 5
) -> Tuple[Dict[Tuple[int, str], Dict[str, Any]], Set[int], int]:
    """
    从DataFrame的前几行提取预处理指令。
    
    Args:
        df: 包含Excel数据的DataFrame
        max_directive_rows: 最大检查的指令行数，默认为5
        
    Returns:
        Tuple包含:
        - 字典，键为(列索引, 列键名)元组，值为该列的预处理规则字典
        - 包含指令行索引的集合
        - 实际表头行的索引
    """
    column_preprocessors: Dict[Tuple[int, str], Dict[str, Any]] = {}
    directive_rows: Set[int] = set()
    
    # 确定实际检查的行数（不超过DataFrame实际行数或最大指定行数）
    check_rows = min(len(df), max_directive_rows)
    if check_rows < 2:
        # 至少需要两行（可能包含指令的行和表头行）
        logger.warning("DataFrame行数不足，无法提取预处理指令")
        return {}, set(), 1  # 返回空结果，默认表头在第二行（索引1）
    
    header_row_idx = 1  # 默认表头在第二行（索引1）
    
    # 遍历可能包含指令的行
    for row_idx in range(check_rows - 1):  # 排除最后一行，因为最后一行必须是表头
        has_directive = False
        
        # 遍历这一行的所有单元格
        for col_idx, cell_value in enumerate(df.iloc[row_idx]):
            # 跳过空单元格
            if pd.isna(cell_value):
                continue
                
            # 转换为字符串并检查是否包含预处理指令
            cell_str = str(cell_value).strip()
            if cell_str.startswith('#'):
                has_directive = True
                
                # 使用正则表达式提取指令和值
                match = re.match(r'^\s*(#\w+)\s*(.*?)\s*$', cell_str)
                if match:
                    directive, value = match.groups()
                    
                    # 验证指令是否有效
                    if directive not in VALID_PREPROCESSORS:
                        logger.warning(f"未知的预处理指令 '{directive}' 在行 {row_idx + 1}, 列 {col_idx + 1}")
                        continue
                    
                    # 获取下一行的列键名（如果存在）
                    if row_idx + 1 < len(df):
                        col_key = str(df.iloc[row_idx + 1, col_idx]).strip()
                        if pd.notna(col_key) and col_key:
                            # 为该列创建或更新预处理规则
                            col_tuple = (col_idx, col_key)
                            if col_tuple not in column_preprocessors:
                                column_preprocessors[col_tuple] = {}
                            
                            # 根据指令类型处理值
                            if directive == '#default':
                                if not value:
                                    logger.warning(f"#default指令在行 {row_idx + 1}, 列 {col_idx + 1} 缺少值")
                                else:
                                    # 尝试转换值为适当的类型
                                    column_preprocessors[col_tuple]['#default'] = parse_directive_value(value)
                            elif directive == '#path':
                                # #path指令不需要值
                                column_preprocessors[col_tuple]['#path'] = True
        
        # 如果这一行包含指令，记录该行索引
        if has_directive:
            directive_rows.add(row_idx)
            # 更新表头行索引（应该是最后一个指令行之后的那一行）
            header_row_idx = row_idx + 1
    
    return column_preprocessors, directive_rows, header_row_idx

def parse_directive_value(value: str) -> Any:
    """
    尝试将指令值解析为适当的类型
    
    Args:
        value: 指令的字符串值
        
    Returns:
        解析后的值，可能的类型包括：int, float, bool, str
    """
    # 尝试解析为布尔值
    if value.lower() == 'true':
        return True
    if value.lower() == 'false':
        return False
    
    # 尝试解析为整数
    try:
        return int(value)
    except ValueError:
        pass
    
    # 尝试解析为浮点数
    try:
        return float(value)
    except ValueError:
        pass
    
    # 如果都解析失败，保留为字符串
    return value

def apply_preprocessors(value: Any, preprocessors: Dict[str, Any]) -> Any:
    """
    对给定值应用预处理规则
    
    Args:
        value: 要处理的原始值
        preprocessors: 包含预处理规则的字典
        
    Returns:
        处理后的值
    """
    # 如果没有预处理规则，直接返回原值
    if not preprocessors:
        return value
    
    # 应用 #default 规则（处理空值）
    if '#default' in preprocessors and pd.isna(value):
        return preprocessors['#default']
    
    # 对非空值应用其他规则
    if not pd.isna(value):
        # 应用 #path 规则（转义反斜杠）
        if '#path' in preprocessors and isinstance(value, str):
            return value.replace('\\', '\\\\')
    
    # 返回处理后的值
    return value

# 预处理器调用映射
PREPROCESSOR_ACTIONS: Dict[str, PreprocessorFn] = {
    '#default': lambda value, directive_value: directive_value if pd.isna(value) else value,
    '#path': lambda value, _: value.replace('\\', '\\\\') if isinstance(value, str) else value
}

def apply_column_preprocessors(df: pd.DataFrame, col_idx: int, preprocessors: Dict[str, Any]) -> None:
    """
    对DataFrame的指定列应用预处理规则（直接修改DataFrame）
    
    Args:
        df: 目标DataFrame
        col_idx: 要处理的列索引
        preprocessors: 预处理规则字典
    """
    # 定义处理单个值的函数
    def process_value(value: Any) -> Any:
        result = value
        # 按照预定的顺序应用规则
        for directive in ['#default', '#path']:
            if directive in preprocessors:
                # 使用映射调用对应的处理函数
                if directive in PREPROCESSOR_ACTIONS:
                    result = PREPROCESSOR_ACTIONS[directive](result, preprocessors[directive])
        return result
    
    # 对列中的每个值应用处理函数
    df.iloc[:, col_idx] = df.iloc[:, col_idx].apply(process_value)
