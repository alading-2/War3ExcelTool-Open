from pandas import DataFrame

dic = {'name':['张三', '李四', '王五', '赵六', '朱七'], 'age':[20, 18, 30, 40, 50], 'gender':['男', '女', '男', '女', '男']}
df = DataFrame(dic)
# 数据类型
print(df.dtypes)
# 维度
print(df.ndim)
# 概览
print(df.info())
# 行、列数
print(df.shape)
# 行索引
print(df.index.tolist())
# 列索引
print(df.columns.tolist())
# 数据（二维数组形式）
print(df.values)
# 前几行
print(df.head(2))
# 后几行
print(df.tail(2))
# 获取一列
print(df['name'])
# 类型为 Series
print(type(df['name']))
# 获取多列
print(df[['name', 'age']])
# 类型为 DataFrame
print(type(df[['name', 'age']]))
# 获取一行
print(df[1:2])
# 获取多行
print(df[1:4])
# 多行的某一列数据
print(df[1:4][['name']])
# 某一行某一列数据
print(df.loc[1, 'name'])
# 某一行指定列数据
print(df.loc[1, ['name', 'age']])
# 某一行所有列数据
print(df.loc[1, :])
# 连续多行和间隔的多列
print(df.loc[0:2, ['name', 'gender']])
# 间隔多行和间隔的多列
print(df.loc[[0, 2], ['name', 'gender']])
# 取一行
print(df.iloc[1])
# 取连续多行
print(df.iloc[:3])
# 取间断的多行
print(df.iloc[[1, 3]])
# 取某一列
print(df.iloc[:, 0])
# 取某一个值
print(df.iloc[0, 1])














