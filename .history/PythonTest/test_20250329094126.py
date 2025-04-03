import numpy as np

a = np.arange(1, 6)
# 创建副本
b = a.copy()
print(a is b)
b[1] = 10
print(a[1])
print(b[1])







