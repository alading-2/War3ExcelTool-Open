import numpy as np

# 相同行数，相同列数
a = np.arange(12).reshape(3, 4)
b = np.arange(20, 32).reshape(3, 4)
print('a:',a)
print('b:',b)
print(a + b)
print(b * a)
# 相同行数
c = np.arange(12).reshape(3, 4)
d = np.arange(3).reshape(3, 1)
print('c:',c)
print('d:',d)
print(c + d)
print(c - d)
# 相同列数
e = np.arange(12).reshape(4, 3)
f = np.arange(3).reshape(1, 3)
print('e:',e)
print('f:',f)
print(e * f)
print(e - f)









