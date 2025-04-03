import pandas as pd
import numpy as np
# 读取excel文件
fpath = r'参考\白泽\table.xlsm'

# 读取所有sheet的数据，返回一个字典，键为sheet名称，值为对应的DataFrame
all_sheets_data = pd.read_excel(fpath, sheet_name=None)

# 打印所有sheet的名称
print(f"Excel文件包含以下sheet: {list(all_sheets_data.keys())}")

# 遍历并打印每个sheet的数据
for sheet_name, df in all_sheets_data.items():
    print(f"\n数据来自sheet: {sheet_name}")
    print(df)













