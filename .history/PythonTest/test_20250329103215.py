from pandas import DataFrame

df = DataFrame({'name':['张三', '李四', '王五', '赵六'],
                'gender':['男', '女', '男', '女'],
                'age':[22, 11, 22, 33]})
# 根据 age 分组
gp1 = df.groupby('age')
# 根据 age、gender 分组
gp2 = df.groupby(['age', 'gender'])
# 根据 gender 进行分组，将 name 作为分组的键
gp3 = df['gender'].groupby(df['name'])
# 查看分组
print(gp2.groups)
# 分组数量
print(gp2.count())
# 选择分组
print(gp2.get_group((22, '男')))
print('---------')
# 聚合
gp4 = df.groupby(df['gender'])
# 和
print(gp4.sum())
# 平均值
print(gp4.mean())
# 最大值
print(gp4.max())
# 最小值
print(gp4.min())
# 同时做多个聚合运算
print(gp4.agg(['sum', 'mean']))













