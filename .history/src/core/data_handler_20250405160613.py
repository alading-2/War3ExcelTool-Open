import pandas as pd
from typing import Any, Dict, Optional, Tuple, Iterator
import traceback
from src.core.excel_parser import ColumnInfo  # Importing the existing ColumnInfo class


class ExcelTable:
    """
    A class to encapsulate Excel table data with metadata.
    
    This class is responsible for managing data read from Excel files,
    performing one-time data cleaning and validation, and integrating
    the cleaned data with column metadata (ColumnInfo).
    
    Attributes:
        _data (pd.DataFrame): The cleaned and processed data from the Excel file.
        column_info (Dict[str, ColumnInfo]): Dictionary of column metadata, keyed by column name.
        num_rows (int): Number of rows in the cleaned data.
        num_cols (int): Number of columns in the cleaned data.
    """
    
    def __init__(self, raw_df: pd.DataFrame):
        """
        Initialize an ExcelTable from raw DataFrame read from Excel.
        
        The raw DataFrame is expected to have:
        - First row (index 0): Column comments
        - Second row (index 1): Column keys (names)
        - Third row (index 2) and beyond: Actual data
        
        Args:
            raw_df (pd.DataFrame): Raw data from Excel, read with header=None
            
        Raises:
            ValueError: If the raw_df format doesn't meet expectations
        """
        try:
            # Check if DataFrame has enough rows
            if raw_df.shape[0] < 2:
                raise ValueError("Input DataFrame must have at least 2 rows")
            
            # Extract keys (column names) from second row
            keys = raw_df.iloc[1].tolist()
            
            # Extract comments from first row
            comments = raw_df.iloc[0].tolist()
            
            # Identify valid columns (non-empty keys)
            valid_columns = []
            for idx, key in enumerate(keys):
                if pd.notna(key) and str(key).strip() != "":
                    comment = comments[idx] if idx < len(comments) and pd.notna(comments[idx]) else None
                    valid_columns.append((idx, str(key).strip(), comment))
            
            if not valid_columns:
                raise ValueError("No valid columns found in the Excel data")
            
            # Filter data rows starting from third row
            if raw_df.shape[0] > 2:
                # Get all rows from index 2 onwards
                data_rows = raw_df.iloc[2:]
                
                # Filter out rows where first column is NaN or starts with '//'
                valid_rows_mask = pd.notna(data_rows.iloc[:, 0])
                if valid_rows_mask.any():  # Only filter if there's at least one valid row
                    # Additional filter for rows starting with '//'
                    for idx, val in enumerate(data_rows.iloc[:, 0]):
                        if pd.notna(val) and isinstance(val, str) and val.strip().startswith('//'):
                            valid_rows_mask.iloc[idx] = False
                    
                    data_rows = data_rows[valid_rows_mask]
            else:
                data_rows = pd.DataFrame()  # Empty DataFrame if no data rows
            
            # Create internal DataFrame with only valid columns
            valid_col_indices = [idx for idx, _, _ in valid_columns]
            valid_col_keys = [key for _, key, _ in valid_columns]
            
            # Create the cleaned DataFrame
            self._data = data_rows.iloc[:, valid_col_indices].copy()
            
            # Set column names to valid keys
            self._data.columns = valid_col_keys
            
            # Reset index
            self._data.reset_index(drop=True, inplace=True)
            
            # Create column_info dictionary
            self.column_info = {}
            for _, key, comment in valid_columns:
                self.column_info[key] = ColumnInfo(
                    key=key,
                    type="any",  # Default type is 'any', since type inference is not part of this class
                    comment=comment
                )
            
            # Store dimensions
            self.num_rows = self._data.shape[0]
            self.num_cols = self._data.shape[1]
            
        except Exception as e:
            error_msg = f"Error initializing ExcelTable: {str(e)}\n{traceback.format_exc()}"
            raise ValueError(error_msg)
    
    def shape(self) -> Tuple[int, int]:
        """
        Get the shape of the data table.
        
        Returns:
            Tuple[int, int]: A tuple containing (number of rows, number of columns)
        """
        return (self.num_rows, self.num_cols)
    
    def get_cell(self, row_idx: int, col_idx: int) -> Any:
        """
        Get the value of a specific cell by row and column indices.
        
        Args:
            row_idx (int): Zero-based row index
            col_idx (int): Zero-based column index
            
        Returns:
            Any: The cell value
            
        Raises:
            IndexError: If row_idx or col_idx is out of bounds
        """
        if row_idx < 0 or row_idx >= self.num_rows:
            raise IndexError(f"Row index {row_idx} out of bounds (0-{self.num_rows-1})")
        
        if col_idx < 0 or col_idx >= self.num_cols:
            raise IndexError(f"Column index {col_idx} out of bounds (0-{self.num_cols-1})")
        
        # Get column name from index
        col_name = self._data.columns[col_idx]
        
        return self._data.loc[row_idx, col_name]
    
    def get_row(self, row_idx: int) -> Optional[pd.Series]:
        """
        Get a row by index.
        
        Args:
            row_idx (int): Zero-based row index
            
        Returns:
            Optional[pd.Series]: The row as a pandas Series, or None if index is invalid
            
        Raises:
            IndexError: If row_idx is out of bounds
        """
        if row_idx < 0 or row_idx >= self.num_rows:
            raise IndexError(f"Row index {row_idx} out of bounds (0-{self.num_rows-1})")
        
        return self._data.iloc[row_idx]
    
    def get_col(self, col_idx: int) -> Optional[pd.Series]:
        """
        Get a column by index.
        
        Args:
            col_idx (int): Zero-based column index
            
        Returns:
            Optional[pd.Series]: The column as a pandas Series, or None if index is invalid
            
        Raises:
            IndexError: If col_idx is out of bounds
        """
        if col_idx < 0 or col_idx >= self.num_cols:
            raise IndexError(f"Column index {col_idx} out of bounds (0-{self.num_cols-1})")
        
        col_name = self._data.columns[col_idx]
        return self._data[col_name]
    
    def get_col_by_key(self, key: str) -> Optional[pd.Series]:
        """
        Get a column by its key (column name).
        
        Args:
            key (str): Column key (name)
            
        Returns:
            Optional[pd.Series]: The column as a pandas Series, or None if key is not found
            
        Raises:
            KeyError: If key is not found in the DataFrame
        """
        if key not in self._data.columns:
            raise KeyError(f"Column key '{key}' not found")
        
        return self._data[key]
    
    def iterrows(self) -> Iterator[Tuple[int, pd.Series]]:
        """
        Iterate over DataFrame rows as (index, Series) pairs.
        
        Returns:
            Iterator[Tuple[int, pd.Series]]: An iterator yielding (index, row) tuples
        """
        return self._data.iterrows()
    
    def get_column_info(self, key: str) -> Optional[ColumnInfo]:
        """
        Get column metadata by key.
        
        Args:
            key (str): Column key (name)
            
        Returns:
            Optional[ColumnInfo]: The ColumnInfo object for the specified key, or None if not found
        """
        return self.column_info.get(key)
    
    def get_all_column_info(self) -> Dict[str, ColumnInfo]:
        """
        Get all column metadata.
        
        Returns:
            Dict[str, ColumnInfo]: Dictionary of all column metadata, keyed by column name
        """
        return self.column_info.copy()
