from src.core.excel_parser import ExcelParser

excelParser = ExcelParser()

value = excelParser._value_handle('True')
if value:
    print(value)
else:
    print("No value found")
