# 测试导入
try:
    from src.core.data_handler import ExcelTable
    print("成功导入 ExcelTable")
    
    from src.core.excel_parser import ExcelParser, infer_types
    print("成功导入 ExcelParser 和 infer_types")
    
    print("所有导入都成功，循环导入问题已解决！")
except ImportError as e:
    print(f"导入错误：{e}") 