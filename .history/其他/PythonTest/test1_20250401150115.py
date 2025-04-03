import xlrd

workbook = xlrd.open_workbook(
    "其他\Test\excel\演员单位.ts.xlsx")  #文件名以及路径，如果路径或者文件名有中文给前面加一个 r

table = workbook.sheets()[0]
# 获取单个表格值 (2,1)表示获取第3行第2列单元格的值
value = table.cell_value(2, 1)
print("第3行2列值为", value)

# 获取表格行数
nrows = table.nrows
print("表格一共有", nrows, "行")

# 获取第4列所有值（列表生成式）
name_list = [str(table.cell_value(i, 3)) for i in range(1, nrows)]
print("第4列所有的值：", name_list)
