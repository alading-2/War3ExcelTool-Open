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
    max_directive_rows: int = 3
) -> Tuple[Dict[str, Dict[str, Any]], Set[int], int]:
    """
    从DataFrame的前几行提取预处理指令。
    
    Args:
        df: 包含Excel数据的DataFrame
        max_directive_rows: 最大检查的指令行数，默认为3
        
    Returns:
        Tuple包含:
        - 字典，键为(列索引, 列键名)元组，值为该列的预处理规则字典
        - 包含指令行索引的集合
        - 实际表头行的索引
    """
    column_preprocessors: Dict[str, Dict[str, Any]] = {}
    directive_rows: Set[int] = set()

    # 确定实际检查的行数（不超过DataFrame实际行数或最大指定行数）
    check_rows = min(len(df), max_directive_rows)
    if check_rows < 3:
        # 至少需要两行（可能包含指令的行和表头行）
        logger.warning("DataFrame行数不足，无法提取预处理指令")
        return {}, set(), 1  # 返回空结果，默认表头在第二行（索引1）

    header_row_idx = 1  # 默认表头在第二行（索引1）

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
        has_directive = False

        # 遍历这一行的所有单元格
        for col_idx, cell_value in enumerate(df.iloc[row_idx]):
            # 跳过空单元格
            if pd.isna(cell_value):
                continue

            # 转换为字符串
            cell_str = str(cell_value).strip()

            # 使用re.findall查找所有预处理指令
            directives = re.findall(pattern, cell_str)
            if directives:
                has_directive = True

                # 获取列键名，并去除首尾空格
                col_key = str(df.iloc[1, col_idx]).strip()
                # 检查列键名是否有效（不是NaN且不为空字符串）
                if pd.notna(col_key) and col_key:
                    # 如果这个列标识符还没有对应的预处理规则字典，则创建一个
                    if col_key not in column_preprocessors:
                        column_preprocessors[col_key] = {
                        }  # 初始化空字典，后续会添加具体的预处理规则

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
                                # 尝试转换值为适当的类型
                                column_preprocessors[col_key][
                                    '#default'] = value
                        elif directive == '#path':
                            # #path指令不需要值
                            column_preprocessors[col_key]['#path'] = True

        # 如果这一行包含指令，记录该行索引
        if has_directive:
            directive_rows.add(row_idx)
            # 更新表头行索引（应该是最后一个指令行之后的那一行）
            header_row_idx = row_idx + 1

    return column_preprocessors, directive_rows, header_row_idx


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

    # 应用 #path 规则（转义反斜杠）
    if '#path' in preprocessors and pd.notna(value) and isinstance(value, str):
        return value.replace('\\', '\\\\')

    # 返回处理后的值
    return value


# 预处理器调用映射
PREPROCESSOR_ACTIONS: Dict[str, PreprocessorFn] = {
    '#default':
    lambda value, directive_value: directive_value
    if pd.isna(value) else value,
    '#path':
    lambda value, _: value.replace('\\', '\\\\')
    if isinstance(value, str) else value
}


def apply_column_preprocessors(df: pd.DataFrame, col_idx: int,
                               preprocessors: Dict[str, Any]) -> None:
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
                    result = PREPROCESSOR_ACTIONS[directive](
                        result, preprocessors[directive])
        return result

    # 对列中的每个值应用处理函数
    df.iloc[:, col_idx] = df.iloc[:, col_idx].apply(process_value)
