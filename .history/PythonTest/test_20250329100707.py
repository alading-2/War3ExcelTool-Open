from pandas import DataFrame
import numpy as np

# 直接创建
df1 = DataFrame(np.random.randn(5,5), index=list('abcde'), columns=list('abcde'))
print(df1)
# 使用字典创建
dic = {'name':['张三', '李四', '王五', '赵六', '朱七'], 'age':[20, 18, 30, 40, 50]}
df2 = DataFrame(dic)
print(df2)
df3 = DataFrame.from_dict(dic)
print(df3)
# 转为字典
d = df3.to_dict()
print(d)













