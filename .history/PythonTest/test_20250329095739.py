from pandas import Series

'''
创建 Series 对象
如果不指定索引，则使用默认索引，范围是：[0,...,len(数据)-1]
'''
s1 = Series([1, 2, 3, 4, 5])
s2 = Series([1, 2, 3, 4, 5], index=['6', '7', '8', '9', '10'])
print(s1)
# 获取索引
print(s1.index)
# 获取值
print(s1.values)
# 获取索引和值
print(s1.iteritems())
# 取指定值
print(s2[0])
print(s2['6'])
# 连续取值
print(s2[1:3])
print(s2['7':'8'])
# 取不连续取值
print(s2[[1,4]])
print(s2[['7','10']])
# 基本运算
print(s1 + s2)
print(s1 - s2)
print(s1 * s2)
print(s1 / s1)












