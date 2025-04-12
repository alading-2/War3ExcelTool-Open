import re
from src.core.data_handler import ExcelTable

excel_table = ExcelTable()
func = lambda value: (
    # 将任意个\替换为\\
    re.sub(r"\\+", r"\\", value)
    if excel_table.custom_notna(value) and isinstance(value, str)
    else value
)
print(r"\\\\")
str1 = r'""'
print(str1)
