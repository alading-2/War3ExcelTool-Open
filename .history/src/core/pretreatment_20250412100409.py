import re
import pandas as pd
import numpy as np
from typing import Dict, Any, List, Set, Tuple, Optional, Callable
import logging
from src.utils.logger import get_logger
from src.core.data_handler import ExcelTable

# 获取日志记录器
logger = get_logger(__name__)

# 有效的预处理指令集合
VALID_PREPROCESSORS = ["#default", "#path"]

# 预处理函数类型注解
PreprocessorFn = Callable[[Any, Any], Any]


excel_table = ExcelTable()


def extract_preprocessor_directives(
    df: pd.DataFrame,
) -> Tuple[Dict[str, Dict[str, Any]], pd.DataFrame]:
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

    # 创建DataFrame的副本，避免SettingWithCopyWarning
    df_new = df.copy()

    column_preprocessors: Dict[str, Dict[str, Any]] = {}

    # 确定实际检查的行数（不超过DataFrame实际行数或最大指定行数:3）
    # excel_parser已经判断过至少3行
    # if len(df_new) < 3:
    #     # 至少需要3行（可能包含指令的行和表头行）
    #     logger.warning("DataFrame行数不足3，不提取预处理指令")
    #     return {}, df_new  # 返回空结果和原始DataFrame

    # 正则表达式模式，用于在文本中查找预处理指令
    # 这个模式会匹配 #指令名 后跟可选的空格和值
    """ default 10
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
            细节：表示指令后面的值是可选的。例如，#path 不需要值，而 #default 10 需要值。"""
    pattern = r"(#\w+)(?:\s+([^\s#]+))?"
    # 遍历可能包含指令的行
    row_idx = 0
    # 遍历第一行的series
    for col_idx, value in df_new.iloc[0].items():
        # 跳过空单元格
        if excel_table.custom_isna(value):
            continue

        # 将单元格值转换为字符串，并去除首尾空格
        cell_str = str(value).strip()
        # 使用re.findall查找所有预处理指令，返回如果模式中存在一个或多个捕获组，则返回组列表；如果模式有多个组，这将是一个元组列表。
        # 所以directives是[(#default, 10)]
        directives = re.findall(pattern, cell_str)

        # 清理单元格中的指令 - 使用re.sub一次性替换所有指令和换行符，然后删除首尾空格
        if directives:
            # 使用re.sub一次性替换所有指令，以及\n、首尾空字符
            cleaned_cell = re.sub(pattern, "", cell_str).replace("\n", "").strip()
            # 安全地修改DataFrame
            # *注意：这里不能用iloc，因为loc是按标签进行操作的，而iloc是按位置进行操作的。col_idx是根据series的索引获取的，可能不连续，后面也是要用loc
            df_new.loc[row_idx, col_idx] = cleaned_cell

            # 获取列键名，并去除首尾空格
            col_key = str(df_new.loc[1, col_idx]).strip()
            # 检查列键名是否有效，其实也可以不判断，之前把空的都删了
            if col_key:
                # 如果这个列标识符还没有对应的预处理规则字典，则创建一个
                if col_key not in column_preprocessors:
                    column_preprocessors[col_key] = (
                        {}
                    )  # 初始化空字典，后续会添加具体的预处理规则

                # 处理找到的每个指令，directive是指令，比如#default，value是指令值，比如10
                for directive, value in directives:
                    # 验证指令是否有效
                    if directive not in VALID_PREPROCESSORS:
                        logger.warning(
                            f"未知的预处理指令 '{directive}' 在行 {row_idx + 1}, 列 {col_idx + 1}"
                        )
                        continue

                    # 根据指令类型处理值
                    if directive == "#default":
                        if not value:
                            logger.warning(
                                f"#default指令在行 {row_idx + 1}, 列 {col_idx + 1} 缺少值"
                            )
                        else:
                            # 存储默认值
                            column_preprocessors[col_key]["#default"] = value
                    elif directive == "#path":
                        # #path指令不需要值
                        column_preprocessors[col_key]["#path"] = True
                # 调用预处理器函数
                df_new.loc[2:, col_idx] = df_new.loc[2:, col_idx].apply(
                    lambda x: handle_value(x, column_preprocessors[col_key])
                )
    return column_preprocessors, df_new


# 预处理器调用映射
PREPROCESSOR_ACTIONS: Dict[str, PreprocessorFn] = {
    "#default":
    # #default处理：当值为空（NaN 或 None）时，使用默认值替换。
    lambda value, directive_value: (
        directive_value if excel_table.custom_isna(value) else value
    ),
    "#path":
    # #path处理：如果值不为空且为字符串类型，则将反斜杠 \ 替换为双反斜杠 \\。
    lambda value, _: (
        # 将任意个\替换为\\
        re.sub(r"\\+", r"\\", value)
        if excel_table.custom_notna(value) and isinstance(value, str)
        else value
    ),
}


def handle_value(value, preprocessor):
    """
    根据预处理指令处理单个值

    Args:
        value: 要处理的值
        preprocessor: 包含预处理指令的字典
    """
    for prep in VALID_PREPROCESSORS:  # 遍历所有设定的预处理指令 ["#default", "#path"]
        if prep in preprocessor:  # 该列包含预处理指令
            # 使用映射调用对应的处理函数
            value = PREPROCESSOR_ACTIONS[prep](value, preprocessor[prep])
    # 如果值不是字符串也不是NaN，保持原值
    return value
