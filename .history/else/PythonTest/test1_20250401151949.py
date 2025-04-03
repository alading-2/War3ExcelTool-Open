import xlrd

list = [x * x for x in range(10)]
print(list)

list = [x * y for x in range(1, 10) for y in range(1, x + 1)]
print(list)
