import pandas as pd
from typing import Any, Dict, Optional, Tuple, Iterator
import traceback
from collections.abc import Iterable
from dataclasses import (
    dataclass,
    field,
)  # 导入dataclass装饰器和field函数，用于创建数据类


# 定义用于存储列信息的 dataclass
@dataclass  # 使用dataclass装饰器自动生成特殊方法（如__init__, __repr__）
class ColumnInfo:
    """存储Excel表格中单列的元数据信息"""

    key: str  # 列的键名 (来自第二行)
    type: str  # 推断出的TypeScript类型
    comment: Optional[str] = None  # 列的注释 (来自第一行)，使用Optional表示可能为None
    preprocessing_rules: Dict[str, Any] = field(default_factory=dict)  # 预处理指令和值


class ExcelTable:
    """
    封装Excel表格数据及其元数据的类。

    该类负责管理从Excel文件读取的数据，执行一次性数据清洗和验证，
    并将清洗后的数据与列元数据(ColumnInfo)整合在一起进行管理。

    属性:
        _data (pd.DataFrame): 经过清洗和处理后的Excel文件数据。
        column_info (Dict[str, ColumnInfo]): 列元数据字典，以列名为键。
        num_rows (int): 清洗后数据的行数。
        num_cols (int): 清洗后数据的列数。
    """

    def __init__(self, df: pd.DataFrame = None):
        self._data = df  # 存储原始DataFrame
        self.column_info = {}  # 存储列元数据
        if df is not None:
            self.num_rows = df.shape[0]  # 行数
            self.num_cols = df.shape[1]  # 列数:

    # DataFrame
    @property
    def data(self) -> pd.DataFrame:
        return self._data

    @data.setter
    def data(self, df: pd.DataFrame):
        self._data = df
        self.num_rows = self._data.shape[0]  # 行数
        self.num_cols = self._data.shape[1]  # 列数

    # types
    @property
    def types(self) -> Dict[str, str]:
        return self._types

    @types.setter
    def types(self, val: Dict[str, str]):
        self._types = val

    # preprocessors
    @property
    def preprocessors(self) -> Dict[str, Dict[str, Any]]:
        return self._preprocessors

    @preprocessors.setter
    def preprocessors(self, val: Dict[str, Dict[str, Any]]):
        self._preprocessors = val

    # 获取DataFrame的键名列表。
    def get_keys(self) -> list:
        return self._data.iloc[1].tolist()

    # 获取注释行列表。
    def get_comments(self) -> list:
        return self._data.iloc[0].tolist()

    def custom_isna(self, obj) -> bool:
        """处理可迭代对象的NaN判断"""
        if isinstance(obj, Iterable) and not isinstance(obj, (str, bytes)):
            return False
        return pd.isna(obj) and obj != "null"

    def custom_notna(self, obj) -> bool:
        """处理可迭代对象的not NaN判断"""
        return not self.custom_isna(obj)

    def shape(self) -> Tuple[int, int]:
        """
        获取数据表格的行数列数。

        返回:
            Tuple[int, int]: 包含(行数, 列数)的元组
        """
        return self._data.shape

    def get_value(self, row_idx: int, col_idx: int) -> Any:
        """
        通过行列索引获取特定单元格的值。

        参数:
            row_idx (int): 基于0的行索引
            col_idx (int): 基于0的列索引

        返回:
            Any: 单元格的值

        异常:
            IndexError: 如果row_idx或col_idx超出范围
        """
        if row_idx < 0 or row_idx >= self.num_rows:
            raise IndexError(f"行索引{row_idx}超出范围(0-{self.num_rows-1})")

        if col_idx < 0 or col_idx >= self.num_cols:
            raise IndexError(f"列索引{col_idx}超出范围(0-{self.num_cols-1})")

        return self._data.iloc[row_idx, col_idx]

    def get_key_by_index(self, index: int) -> str:
        """
        通过索引获取列键名。
        """
        return self.get_value(1, index)

    def get_rowvalues_byindex(self, row_idx: int) -> list:
        """
        通过索引获取一行。

        参数:
            row_idx (int): 基于0的行索引

        返回:
            Optional[pd.Series]: 作为pandas Series的行，若索引无效则返回None

        异常:
            IndexError: 如果row_idx超出范围
        """
        if row_idx < 0 or row_idx >= self.num_rows:
            raise IndexError(f"行索引{row_idx}超出范围(0-{self.num_rows-1})")

        return self._data.iloc[row_idx].tolist()

    def get_colvalues_byindex(self, col_idx: int) -> list:
        """
        通过索引获取一列。

        参数:
            col_idx (int): 基于0的列索引

        返回:
            Optional[pd.Series]: 作为pandas Series的列，若索引无效则返回None

        异常:
            IndexError: 如果col_idx超出范围
        """
        if col_idx < 0 or col_idx >= self.num_cols:
            raise IndexError(f"列索引{col_idx}超出范围(0-{self.num_cols-1})")

        col_name = self._data.columns[col_idx]
        return self._data.loc[2:, col_name].tolist()  # 跳过前两行

    def get_col_by_key(self, key: str) -> Optional[pd.Series]:
        """
        通过键名(列名)获取一列。

        参数:
            key (str): 列键名(列名)

        返回:
            Optional[pd.Series]: 作为pandas Series的列，若未找到键名则返回None

        异常:
            KeyError: 如果在DataFrame中未找到键名
        """
        if key not in self._data.columns:
            raise KeyError(f"未找到列键名'{key}'")

        return self._data[key][2:]  # 跳过前两行

    def for_rows(self) -> Iterator[Tuple[int, pd.Series]]:
        """
        将DataFrame行作为(索引, Series)对进行迭代。

        返回:
            Iterator[Tuple[int, pd.Series]]: 产生(索引, 行)元组的迭代器
        例子：for index, row in excel_table.for_rows():
        """
        return self._data.iterrows()

    def for_cols(self) -> Iterator[Tuple[int, pd.Series]]:
        """
        将DataFrame列作为(索引, Series)对进行迭代。

        返回:
            Iterator[Tuple[int, pd.Series]]: 产生(索引, 列)元组的迭代器
        例子：for index, col in excel_table.for_cols():
        """
        return self._data.items()

    # def get_column_info(self, key: str) -> Optional[ColumnInfo]:
    #     """
    #     通过键名获取列元数据。

    #     参数:
    #         key (str): 列键名(列名)

    #     返回:
    #         Optional[ColumnInfo]: 指定键名的ColumnInfo对象，若未找到则返回None
    #     """
    #     return self.column_info.get(key)

    # def get_all_column_info(self) -> Dict[str, ColumnInfo]:
    #     """
    #     获取所有列元数据。

    #     返回:
    #         Dict[str, ColumnInfo]: 所有列元数据的字典，以列名为键
    #     """
    #     return self.column_info.copy()
