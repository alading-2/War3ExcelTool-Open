import xlwt


# 3.2.2 使用xlwt创建新表格并写入
def fun3_2_2():
    # 创建新的workbook（其实就是创建新的excel）
    workbook = xlwt.Workbook(encoding='ascii')

    # 创建新的sheet表
    worksheet = workbook.add_sheet("My new Sheet")

    # 往表格写入内容
    worksheet.write(0, 0, "内容1")
    worksheet.write(2, 1, "内容2")

    # 保存
    workbook.save("新创建的表格.xls")


fun3_2_2()
