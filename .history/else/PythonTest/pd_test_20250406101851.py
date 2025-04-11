import pandas as pd
from typing import Dict, List, Any, Tuple
from src.core.ts_generator import TSGenerator  # 根据实际路径调整导入

from src.core.excel_parser import ExcelParser  # 根据实际路径调整导入

tsgenerator = TSGenerator()
excel_parser = ExcelParser()  # 创建ExcelParser实例

file_path = r"else\Test\excel\test\test.xlsx"
results = excel_parser.parse_excel(file_path)
sheet_name, metadata, data_rows = results[0]
output_file = tsgenerator.generate_ts_file("test", metadata, data_rows,
                                           r"else\Test\ts\test")

# for result in results:
#     sheet_name, metadata, data_rows = result
#     print("comments:", metadata["comments"])
#     print("keys:", metadata["keys"])
#     print("types:", metadata["types"])
#     print("filename:", metadata["filename"])
#     print("sheet_name:", metadata["sheet_name"])

#     print("*****************data_rows*******************")
#     for row_idx, row in enumerate(data_rows):
#         print(f"Row {row_idx}")
#         for key, value in row.items():
#             # 打印每个键值对
#             print(f"{key}: {value}")

# # 测试infer_type，类型判断
# assert parse.infer_type("测试id1") == "string"
# assert parse.infer_type("123") == "number"
# assert parse.infer_type("123") == "number"
# assert parse.infer_type("1.23e5") == "number"
# assert parse.infer_type("True") == "boolean"
# assert parse.infer_type("FALSE") == "boolean"
# assert parse.infer_type("{基础攻击:500,\n基础生命:1000}") == "any"
# assert parse.infer_type([1, 2, 3]) == "any"
