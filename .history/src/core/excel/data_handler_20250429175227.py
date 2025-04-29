import pandas as pd
import numpy as np
from typing import Any, Dict, Optional, Tuple, Iterator
import traceback
from collections.abc import Iterable
import logging
import re


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

    def get_type(self, key: str) -> str:
        return self._types.get(key)

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

    @staticmethod
    def custom_isna(obj) -> bool:
        """处理可迭代对象的NaN判断"""
        if isinstance(obj, Iterable) and not isinstance(obj, (str, bytes)):
            return False
        return pd.isna(obj) and obj != "null"

    @staticmethod
    def custom_notna(obj) -> bool:
        """处理可迭代对象的not NaN判断"""
        return not ExcelTable.custom_isna(obj)

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

    def get_value_by_key(self, row_idx: int, key: str) -> Any:
        """
        通过键名获取单元格的值。
        """
        return self.get_value(row_idx, self.get_index_by_key(key))

    def get_key_by_index(self, index: int) -> str:
        """
        通过索引获取列键名。
        """
        return self.get_value(1, index)

    def get_index_by_key(self, key: str) -> int:
        """
        通过键名获取列索引。
        """
        return self._data.columns.get_loc(key)

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

        return self._data.loc[2:, key].tolist()  # 跳过前两行

    def get_data_dict_json(self) -> Dict[str, Any]:
        """
        获取数据字典，json格式。
        
        将Excel表格数据转换为嵌套字典，以第一列的值作为主键。
        处理不同数据类型：boolean类型转换为true/false，number类型去掉引号。
        
        Returns:
            Dict[str, Any]: 表格数据的字典形式
        """
        result_dict = {}
        keys = self.get_keys()

        for row_idx in range(2, self.num_rows):
            name_key = self.get_value(row_idx, 0)  # 获取当前行第一列作为数据项的key值
            if not name_key:
                continue

            # 初始化该行的字典
            if name_key not in result_dict:
                result_dict[name_key] = {}

            # 遍历所有键，处理当前行中的每个字段
            for col_idx, key in enumerate(keys):
                value = self.get_value(row_idx, col_idx)
                if self.custom_notna(value) and key != "code":
                    # 使用自定义方法推断类型
                    from src.core.excel.excel_parser import ExcelParser
                    excel_parser = ExcelParser()
                    value_type = excel_parser.infer_type_single(value)

                    # 根据不同类型进行处理
                    if value_type == "boolean":
                        # 处理布尔类型，转为true/false
                        if isinstance(value, bool):
                            result_dict[name_key][
                                key] = value  # Python布尔值会自动转换为JSON的true/false
                        else:
                            # 字符串情况 "true"/"false"
                            result_dict[name_key][key] = value.lower(
                            ) == "true"
                    elif value_type == "number":
                        # 处理数字类型，如果是字符串形式的数字，转为数字
                        if isinstance(value, (int, float)):
                            result_dict[name_key][key] = value
                        else:
                            # 字符串形式的数字，尝试转换
                            try:
                                # 移除字符串中的逗号，然后转换为数字
                                cleaned_value = value.replace(",", "")
                                if "." in cleaned_value:
                                    result_dict[name_key][key] = float(
                                        cleaned_value)
                                else:
                                    result_dict[name_key][key] = int(
                                        cleaned_value)
                            except (ValueError, TypeError):
                                # 转换失败，保留原值
                                result_dict[name_key][key] = value
                    else:
                        # 其他类型保持不变
                        result_dict[name_key][key] = value

        return result_dict
