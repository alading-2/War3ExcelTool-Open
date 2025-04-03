import numpy as np


arr = np.arange(12).reshape(3, 4)
print(arr)
# 取某一个值
print(arr[2, 3])
# 取多个不连续的值
print(arr[[0, 2],[1, 3]])
# 取一行
print(arr[0])
# 连续取多行
print(arr[1:])
# 取不连续的多行
print(arr[[0, 2]])
# 取一列
print(arr[:, 0])
# 连续取多列
print(arr[:, 2:])
# 取不连续的多列
print(arr[:, [0, 2]])





