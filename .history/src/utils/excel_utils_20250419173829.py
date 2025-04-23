import os
import sys
import win32com.client
import pythoncom
from pathlib import Path

def ensure_excel_file_closed(file_path):
    """
    确保Excel文件未被打开，如果已打开则保存并关闭
    
    Args:
        file_path: Excel文件路径
        
    Returns:
        bool: 操作是否成功
    """
    # 将路径转换为绝对路径
    abs_path = os.path.abspath(file_path)
    
    try:
        # 初始化COM环境
        pythoncom.CoInitialize()
        
        # 尝试以独占方式打开文件，如果成功说明文件未被打开
        try:
            with open(abs_path, 'r+b') as f:
                # 文件未被锁定，什么都不做
                return True
        except IOError:
            # 文件被锁定，需要查找并关闭它
            try:
                # 连接到Excel应用程序
                excel = win32com.client.Dispatch("Excel.Application")
                
                # 检查是否有工作簿打开
                for wb in excel.Workbooks:
                    # 比较完整路径
                    if os.path.abspath(wb.FullName).lower() == abs_path.lower():
                        print(f"找到已打开的工作簿: {abs_path}，正在保存并关闭...")
                        # 保存文件
                        wb.Save()
                        # 关闭文件
                        wb.Close(True)  # True表示保存更改
                        print("工作簿已成功关闭")
                        return True
                    
                # 如果没有找到匹配的工作簿，可能是被其他程序打开
                print(f"警告: 文件 {abs_path} 被锁定，但未在Excel中找到。可能被其他程序打开。")
                return False
                
            except Exception as e:
                print(f"关闭Excel文件时出错: {str(e)}")
                return False
            finally:
                # 确保释放Excel应用程序
                try:
                    excel.Quit()
                    del excel
                except:
                    pass
    except Exception as e:
        print(f"检查Excel文件状态时出错: {str(e)}")
        return False
    finally:
        # 清理COM环境
        pythoncom.CoUninitialize()
    
    return True

def copy_template_to_destination(template_path, output_path):
    """
    将模板文件复制到目标位置，如果目标文件正在被打开，则先关闭
    
    Args:
        template_path: 模板文件路径
        output_path: 目标文件路径
        
    Returns:
        bool: 操作是否成功
    """
    import shutil
    
    # 确保目标目录存在
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    
    # 检查并关闭目标文件（如果已打开）
    if os.path.exists(output_path):
        if not ensure_excel_file_closed(output_path):
            print(f"无法关闭目标文件: {output_path}，操作中止")
            return False
    
    try:
        # 复制文件
        shutil.copy2(template_path, output_path)
        print(f"模板文件已成功复制到: {output_path}")
        return True
    except Exception as e:
        print(f"复制模板文件时出错: {str(e)}")
        return False 