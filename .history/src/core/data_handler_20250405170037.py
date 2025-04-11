import pandas as pd
from typing import Any, Dict, Optional, Tuple, Iterator
import traceback
from src.core.excel_parser import ColumnInfo  # 导入已存在的ColumnInfo类


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

    def __init__(self, raw_df: pd.DataFrame):
        """
        从Excel读取的原始DataFrame初始化ExcelTable。
        
        原始DataFrame预期结构:
        - 第一行(索引0): 列注释
        - 第二行(索引1): 列键名
        - 第三行(索引2)及以后: 实际数据
        
        参数:
            raw_df (pd.DataFrame): 从Excel读取的原始数据，使用header=None读取
            
        异常:
            ValueError: 如果raw_df格式不符合预期
        """
        try:
            # 检查DataFrame是否有足够的行
            if raw_df.shape[0] < 2:
                raise ValueError("输入的DataFrame必须至少有2行")

            # 从第二行提取键名(列名)
            keys = raw_df.iloc[1].tolist()

            # 从第一行提取注释
            comments = raw_df.iloc[0].tolist()

            # 识别有效列(非空键名)
            valid_columns = []
            for idx, key in enumerate(keys):
                if pd.notna(key) and str(key).strip() != "":
                    comment = comments[idx] if idx < len(
                        comments) and pd.notna(comments[idx]) else None
                    valid_columns.append((idx, str(key).strip(), comment))

            if not valid_columns:
                raise ValueError("Excel数据中未找到有效列")

            # 从第三行开始过滤数据行
            if raw_df.shape[0] > 2:
                # 获取索引2及以后的所有行
                data_rows = raw_df.iloc[2:]

                # valid_rows_mask 是一个布尔型的 Pandas Series
                # 过滤掉第一列为NaN或以'//'开头的行
                valid_rows_mask = pd.notna(data_rows.iloc[:, 0])
                if valid_rows_mask.any():  # 仅当至少有一行有效时进行过滤
                    # 额外过滤以'//'开头的行
                    for idx, val in enumerate(data_rows.iloc[:, 0]):
                        if pd.notna(val) and isinstance(
                                val, str) and val.strip().startswith('//'):
                            valid_rows_mask.iloc[idx] = False
                    # 根据布尔型掩码 valid_rows_mask 对 DataFrame data_rows 进行过滤，仅保留满足条件的行。
                    # Pandas 支持通过布尔数组（或 Series）对 DataFrame 的行进行过滤。
                    data_rows = data_rows[valid_rows_mask]
            else:
                data_rows = pd.DataFrame()  # 如果没有数据行，则使用空DataFrame

            # 创建仅包含有效列的内部DataFrame
            valid_col_indices = [idx for idx, _, _ in valid_columns]
            valid_col_keys = [key for _, key, _ in valid_columns]

            # 创建清洗后的DataFrame，.copy() 方法创建一个新的 DataFrame 对象，而不是返回原数据的视图。
            self._data = data_rows.iloc[:, valid_col_indices].copy()

            # 重写DataFrame列名为有效键名
            self._data.columns = valid_col_keys

            # 重置行索引
            self._data.reset_index(drop=True, inplace=True)

            # 创建column_info字典
            self.column_info = {}
            for _, key, comment in valid_columns:
                self.column_info[key] = ColumnInfo(
                    key=key,
                    type="any",  # 默认类型为'any'，因为类型推断不是此类的一部分
                    comment=comment)

            # Pandas 的 DataFrame 提供了一个 shape 属性，返回一个包含两个元素的元组 (行数, 列数)。
            # 记录行数和列数
            self.num_rows = self._data.shape[0]
            self.num_cols = self._data.shape[1]

        except Exception as e:
            error_msg = f"初始化ExcelTable时出错: {str(e)}\n{traceback.format_exc()}"
            raise ValueError(error_msg)

    def shape(self) -> Tuple[int, int]:
        """
        获取数据表格的行数列数。
        
        返回:
            Tuple[int, int]: 包含(行数, 列数)的元组
        """
        return (self.num_rows, self.num_cols)

    def get_cell(self, row_idx: int, col_idx: int) -> Any:
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

        # 从索引获取列名
        col_name = self._data.columns[col_idx]

        return self._data.loc[row_idx, col_name]

    def get_row(self, row_idx: int) -> Optional[pd.Series]:
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

        return self._data.iloc[row_idx]

    def get_col(self, col_idx: int) -> Optional[pd.Series]:
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
        return self._data[col_name]

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

        return self._data[key]

    def for_rows(self) -> Iterator[Tuple[int, pd.Series]]:
        """
        将DataFrame行作为(索引, Series)对进行迭代。
        
        返回:
            Iterator[Tuple[int, pd.Series]]: 产生(索引, 行)元组的迭代器
        例子：for index, row in excel_table.iterrows():
        """
        return self._data.iterrows()

    def get_column_info(self, key: str) -> Optional[ColumnInfo]:
        """
        通过键名获取列元数据。
        
        参数:
            key (str): 列键名(列名)
            
        返回:
            Optional[ColumnInfo]: 指定键名的ColumnInfo对象，若未找到则返回None
        """
        return self.column_info.get(key)

    def get_all_column_info(self) -> Dict[str, ColumnInfo]:
        """
        获取所有列元数据。
        
        返回:
            Dict[str, ColumnInfo]: 所有列元数据的字典，以列名为键
        """
        return self.column_info.copy()
