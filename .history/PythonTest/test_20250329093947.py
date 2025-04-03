import numpy as np

a = np.arange(6).reshape(2,3)
# 创建视图
b = a.view()
print('a的id：', id(a))
print('b的id：', id(b))
# 修改 b 的形状
b.shape =  3,2
print('a的形状：')
print(a)
print('b的形状：')
print(b)
print(a is b)






