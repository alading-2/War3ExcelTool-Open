import re
import pandas as pd
import numpy as np
from typing import Dict, Any, List, Set, Tuple, Optional, Callable
import logging
from src.utils.logger import get_logger

# 获取日志记录器
logger = get_logger(__name__)

# 有效的预处理指令集合
VALID_PREPROCESSORS = ["#default", "#path"]

# 预处理函数类型注解
PreprocessorFn = Callable[[Any, Any], Any]


def extract_preprocessor_directives(
        df: pd.DataFrame,
        max_directive_rows: int = 3) -> Tuple[Dict[str, Dict[str, Any]], pd.DataFrame]:
    """
    从DataFrame的前几行提取预处理指令。
    
    Args:
        df: 包含Excel数据的DataFrame
        max_directive_rows: 最大检查的指令行数，默认为3
        
    Returns:
        Tuple包含:
        - 字典，键为列键名，值为该列的预处理规则字典
        - 更新后的DataFrame，已清理预处理指令
    """
    column_preprocessors: Dict[str, Dict[str, Any]] = {}
    # 创建DataFrame的副本，避免SettingWithCopyWarning
    df_new = df.copy()

    # 确定实际检查的行数（不超过DataFrame实际行数或最大指定行数）
    check_rows = min(len(df_new), max_directive_rows)
    if check_rows < 3:
        # 至少需要两行（可能包含指令的行和表头行）
        logger.warning("DataFrame行数不足，无法提取预处理指令")
        return {}, df_new  # 返回空结果和原始DataFrame

    # 正则表达式模式，用于在文本中查找预处理指令
    # 这个模式会匹配 #指令名 后跟可选的空格和值
    """ #default 10
        1. (#\w+)功能：匹配以 # 开头，后面紧跟一个或多个字母、数字或下划线的字符串。
            #：匹配字符 #。
            \w+：匹配一个或多个“单词字符”（包括字母、数字和下划线）。
            ()：将这部分括起来，表示这是一个捕获组。捕获组会提取匹配的内容供后续使用。
        2. (?:...)功能：定义一个非捕获组，用于分组但不提取内容。
            细节：?:：表示这是一个非捕获组，不会保存匹配的结果。
        3. \s+：功能：匹配一个或多个空白字符（如空格、制表符等）。
            细节：这部分出现在非捕获组中，用于匹配指令名和值之间的空格。
        4. ([^\s#]+)：功能：匹配指令后面的值，要求值不能包含空白字符或 #。
            细节：
            [^\s#]+：匹配一个或多个非空白字符且不是 # 的字符。
            ()：将这部分括起来，表示这是一个捕获组，用于提取值。
        5. ?
            功能：使前面的非捕获组变为可选项。
            细节：表示指令后面的值是可选的。例如，#path 不需要值，而 #default 10 需要值。 """
    pattern = r'(#\w+)(?:\s+([^\s#]+))?'

    # 遍历可能包含指令的行
    for row_idx in range(check_rows - 1):  # 排除最后一行，因为最后一行必须是表头
        # 遍历这一行的所有单元格
        for col_idx, cell_value in enumerate(df_new.iloc[row_idx]):
            # 跳过空单元格
            if pd.isna(cell_value):
                continue

            # 转换为字符串
            cell_str = str(cell_value).strip()
            # 使用re.findall查找所有预处理指令
            directives = re.findall(pattern, cell_str)
            
            # 清理单元格中的指令 - 使用re.sub一次性替换所有指令和换行符，然后删除首尾空格
            if directives:
                # 使用re.sub一次性替换所有指令
                cleaned_cell = re.sub(pattern, '', cell_str).replace("\n", "").strip()
                # 安全地修改DataFrame
                df_new.iloc[row_idx, col_idx] = cleaned_cell
                
                # 获取列键名，并去除首尾空格
                col_key = str(df_new.iloc[1, col_idx]).strip()
                # 检查列键名是否有效（不是NaN且不为空字符串）
                if pd.notna(col_key) and col_key:
                    # 如果这个列标识符还没有对应的预处理规则字典，则创建一个
                    if col_key not in column_preprocessors:
                        column_preprocessors[col_key] = {}  # 初始化空字典，后续会添加具体的预处理规则

                    # 处理找到的每个指令
                    for directive, value in directives:
                        # 验证指令是否有效
                        if directive not in VALID_PREPROCESSORS:
                            logger.warning(
                                f"未知的预处理指令 '{directive}' 在行 {row_idx + 1}, 列 {col_idx + 1}"
                            )
                            continue

                        # 根据指令类型处理值
                        if directive == '#default':
                            if not value:
                                logger.warning(
                                    f"#default指令在行 {row_idx + 1}, 列 {col_idx + 1} 缺少值"
                                )
                            else:
                                # 存储默认值
                                column_preprocessors[col_key]['#default'] = value
                        elif directive == '#path':
                            # #path指令不需要值
                            column_preprocessors[col_key]['#path'] = True

    return column_preprocessors, df_new


# 预处理器调用映射
PREPROCESSOR_ACTIONS: Dict[str, PreprocessorFn] = {
    '#default':
    #功能：当值为空（NaN 或 None）时，使用默认值替换。
    lambda value, directive_value: directive_value
    if pd.isna(value) else value,
    '#path':
    #如果值是字符串类型，则将反斜杠 \ 替换为双反斜杠 \\。
    lambda value, _: value.replace('\\', '\\\\')
    if pd.notna(value) and isinstance(value, str) else value
}


def apply_column_preprocessors(
        df: pd.DataFrame, preprocessors: Dict[str, Dict[str,
                                                        Any]]) -> pd.DataFrame:
    """
    对DataFrame的指定列应用预处理规则
    
    Args:
        df: 目标DataFrame
        preprocessors: 预处理规则字典，键为列名，值为该列的预处理规则字典
        
    Returns:
        处理后的DataFrame
    """
    # 创建DataFrame的副本，以避免警告和副作用
    df_new = df.copy()
    
    # 从第二行（索引1）获取键名
    try:
        # 获取所有列键名
        raw_keys = df_new.iloc[1].tolist()
        
        # 遍历所有列
        for col_idx, key_any in enumerate(raw_keys):
            # 获取键名并去除首尾空格
            key = str(key_any).strip()
            
            # 只处理键名不为空且在预处理规则中的列
            if pd.notna(key_any) and key != "" and key in preprocessors:
                # 获取该列的预处理规则
                col_preprocessors = preprocessors[key]
                
                # 只处理第三行（索引2）及之后的数据行
                # 使用pandas的向量化操作处理整列数据
                if len(df_new) > 2:
                    # 定义列处理函数
                    def process_cell(cell_value):
                        
                        
                        # 处理非字符串类型
                        if pd.isna(cell_value):
                            # 应用#default规则
                            if '#default' in col_preprocessors:
                                return col_preprocessors['#default']
                            return cell_value
                            
                        # 处理字符串值
                        if isinstance(cell_value, str):
                            # 应用#path规则
                            if '#path' in col_preprocessors and col_preprocessors['#path']:
                                cell_value = cell_value.replace('\\', '\\\\')
                            return cell_value
                        
                        # 如果值不是字符串也不是NaN，保持原值
                        return cell_value
                    
                    # 使用apply方法向量化处理列
                    df_new.iloc[2:, col_idx] = df_new.iloc[2:, col_idx].apply(process_cell)
        
        return df_new
        
    except Exception as e:
        logger.error(f"应用预处理规则时出错: {str(e)}")
        # 出错时返回原始DataFrame
        return df.copy()


def apply_preprocessors(value: Any, preprocessors: Dict[str, Any]) -> Any:
    """
    对给定值应用预处理规则
    
    Args:
        value: 要处理的原始值
        preprocessors: 包含预处理规则的字典
        
    Returns:
        处理后的值
    """
    try:
        # 如果没有预处理规则，直接返回原值
        if not preprocessors:
            return value
        
        result = value
        
        # 应用 #default 规则（处理空值）
        if pd.isna(value) and '#default' in preprocessors:
            return preprocessors['#default']
        
        # 应用 #path 规则（转义反斜杠）
        if '#path' in preprocessors and pd.notna(value) and isinstance(value, str):
            result = value.replace('\\', '\\\\')
        
        # 返回处理后的值
        return result
    
    except Exception as e:
        # 发生错误时记录并返回原始值
        logger.error(f"应用预处理规则时出错: {str(e)}")
        return value
