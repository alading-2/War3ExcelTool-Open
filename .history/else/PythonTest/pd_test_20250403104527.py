import pandas as pd
from typing import Dict, List, Any, Tuple
from src.core.type_handler import TypeHandler  # 根据实际路径调整导入

from src.core.excel_parser import ExcelParser  # 根据实际路径调整导入

parse = ExcelParser()

file_path = r"else\Test\excel\test\test.xlsx"
xl = pd.ExcelFile(file_path)
sheet_names = xl.sheet_names
for sheet_name in sheet_names:
    # 使用pandas读取指定sheet的内容
    df = pd.read_excel(file_path, sheet_name=sheet_name, header=None)
    # 提取第一行作为注释信息（列说明）
    comments = df.iloc[0].tolist()
    print("comments:", comments)
    # 提取第二行作为数据的键名
    keys = df.iloc[1].tolist()
    print("keys:", keys)
    # 从第三行开始解析数据行
    data_rows = parse._parse_data_rows(df, keys)
    for row_idx, row in enumerate(data_rows):
        print(f"Row {row_idx}")
        for key, value in row.items():
            # 打印每个键值对
            print(f"{key}: {value}, type: {value}")
