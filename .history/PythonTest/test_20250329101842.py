
import numpy as np
from pandas import Series, DataFrame


s = Series(['1', '2', np.nan, '3'])
df = DataFrame([['1', '2'], ['3', np.nan], [np.nan, 4]])
print(s)
print(df)
#  清除缺失项
print(s.dropna())
print(df.dropna())
# 填充缺失项
print(df.fillna('9'))
print(df.fillna({0:'5', 1:'6'}))












