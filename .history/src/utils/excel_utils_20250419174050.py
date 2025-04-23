import os
import win32com.client
import pythoncom
import time

def ensure_excel_file_closed(file_path):
    """
    确保Excel文件未被打开，如果已打开则强制关闭
    
    Args:
        file_path: Excel文件路径
    """
    # 标准化文件路径
    file_path = os.path.abspath(file_path)
    
    # 如果文件不存在，不需要进一步处理
    if not os.path.exists(file_path):
        return
    
    try:
        # 尝试以写模式打开文件，检查文件是否已被锁定
        with open(file_path, 'r+b'):
            # 文件未被锁定，可以自由访问
            pass
    except IOError:
        # 文件被锁定，尝试通过Excel应用程序关闭它
        try:
            # 初始化COM环境
            pythoncom.CoInitialize()
            
            # 获取Excel应用程序实例
            excel = win32com.client.Dispatch("Excel.Application")
            
            # 检查所有已打开的工作簿
            for wb in excel.Workbooks:
                # 标准化工作簿的完整路径
                wb_path = os.path.abspath(wb.FullName)
                
                # 如果找到匹配的工作簿，关闭它(不保存更改)
                if wb_path.lower() == file_path.lower():
                    wb.Close(SaveChanges=False)
                    print(f"已关闭打开的Excel文件: {file_path}")
            
            # 如果没有其他打开的工作簿，退出Excel应用程序
            if excel.Workbooks.Count == 0:
                excel.Quit()
            
            # 释放COM对象
            excel = None
            
            # 短暂等待以确保文件被完全释放
            time.sleep(0.5)
            
        except Exception as e:
            print(f"尝试关闭Excel文件时出错: {e}")
        finally:
            # 释放COM环境
            pythoncom.CoUninitialize() 