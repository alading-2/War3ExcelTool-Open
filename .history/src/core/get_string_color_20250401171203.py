import zipfile
import xml.etree.ElementTree as ET
from io import BytesIO
import re
import os

def get_colors_from_excel(file_path, sheet_name, cell_ref):
    """
    从Excel文件中获取指定单元格的字符级颜色信息
    
    Args:
        file_path (str): Excel文件路径
        sheet_name (str): 工作表名称
        cell_ref (str): 单元格引用，如'A1'
    
    Returns:
        list: 包含文本和颜色信息的列表，格式为[(text, color_rgb), ...]
    """
    # 检查文件是否存在
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"Excel文件不存在: {file_path}")
        
    # 解析单元格引用
    column = re.findall(r'[A-Za-z]+', cell_ref)[0]
    row = int(re.findall(r'\d+', cell_ref)[0])
    
    # 将列字母转换为数字
    col_num = 0
    for c in column:
        col_num = col_num * 26 + (ord(c.upper()) - ord('A') + 1)
    
    # 创建命名空间映射
    namespaces = {
        'r': 'http://schemas.openxmlformats.org/officeDocument/2006/relationships',
        'a': 'http://schemas.openxmlformats.org/drawingml/2006/main',
        'w': 'http://schemas.openxmlformats.org/wordprocessingml/2006/main',
        'mc': 'http://schemas.openxmlformats.org/markup-compatibility/2006',
        'x14ac': 'http://schemas.microsoft.com/office/spreadsheetml/2009/9/ac',
        'x': 'http://schemas.openxmlformats.org/spreadsheetml/2006/main'
    }
    
    try:
        with zipfile.ZipFile(file_path) as zip_file:
            # 读取workbook.xml以查找sheet id
            workbook_xml = zip_file.read('xl/workbook.xml')
            workbook_root = ET.parse(BytesIO(workbook_xml)).getroot()
            
            # 列出所有可用的工作表
            available_sheets = []
            for sheet_elem in workbook_root.findall('.//x:sheet', namespaces):
                sheet_name_found = sheet_elem.get('name')
                available_sheets.append(sheet_name_found)
            
            if not available_sheets:
                raise ValueError(f"Excel文件中未找到任何工作表")
                
            # 如果未指定工作表或指定的工作表不存在，使用第一个工作表
            if sheet_name not in available_sheets:
                if sheet_name == "Sheet1" and available_sheets:  # 特殊处理默认值
                    sheet_name = available_sheets[0]
                    print(f"工作表 'Sheet1' 不存在，自动使用第一个工作表: '{sheet_name}'")
                else:
                    raise ValueError(f"工作表 '{sheet_name}' 不存在。可用的工作表: {', '.join(available_sheets)}")
            
            # 找到对应sheet的id
            sheet_id = None
            for sheet_elem in workbook_root.findall('.//x:sheet', namespaces):
                if sheet_elem.get('name') == sheet_name:
                    sheet_id = sheet_elem.get('{http://schemas.openxmlformats.org/officeDocument/2006/relationships}id')
                    break
            
            if not sheet_id:
                raise ValueError(f"无法获取工作表 '{sheet_name}' 的ID")
            
            # 读取sheet对应的XML文件
            rels_xml = zip_file.read('xl/_rels/workbook.xml.rels')
            rels_root = ET.parse(BytesIO(rels_xml)).getroot()
            
            # 找到sheet对应的Target
            sheet_path = None
            for rel in rels_root.findall('.//Relationship'):
                if rel.get('Id') == sheet_id:
                    sheet_path = 'xl/' + rel.get('Target').lstrip('/')
                    break
            
            if not sheet_path:
                raise ValueError(f"未找到工作表 '{sheet_name}' 的路径")
            
            # 读取sheet XML
            sheet_xml = zip_file.read(sheet_path)
            sheet_root = ET.parse(BytesIO(sheet_xml)).getroot()
            
            # 找到单元格
            cell_elem = None
            for c in sheet_root.findall(f'.//x:c[@r="{cell_ref}"]', namespaces):
                cell_elem = c
                break
            
            if not cell_elem:
                raise ValueError(f"在工作表 '{sheet_name}' 中未找到单元格 '{cell_ref}'")
            
            # 检查单元格是否有内联格式（富文本）
            is_shared_string = False
            cell_type = cell_elem.get('t')
            
            # 检查单元格类型
            if cell_type == 's':  # 共享字符串
                is_shared_string = True
            elif cell_type is None:  # 可能是数字或日期
                v_elem = cell_elem.find('x:v', namespaces)
                if v_elem is not None:
                    return [(v_elem.text, None)]
                return []
            
            # 如果不是共享字符串
            if not is_shared_string:
                v_elem = cell_elem.find('x:v', namespaces)
                if v_elem is not None:
                    return [(v_elem.text, None)]
                return []
            
            # 读取共享字符串表
            try:
                shared_strings_xml = zip_file.read('xl/sharedStrings.xml')
                shared_strings_root = ET.parse(BytesIO(shared_strings_xml)).getroot()
            except KeyError:
                raise ValueError("此Excel文件中没有共享字符串表")
            
            # 获取富文本信息
            result = []
            
            # 获取单元格中的值（索引到共享字符串）
            v_elem = cell_elem.find('x:v', namespaces)
            if v_elem is None:
                return []
                
            si_index = int(v_elem.text)
            
            # 检查索引是否有效
            si_elements = shared_strings_root.findall('.//x:si', namespaces)
            if si_index >= len(si_elements):
                raise ValueError(f"共享字符串索引 {si_index} 超出范围")
                
            si_elem = si_elements[si_index]
            
            # 检查是否为富文本
            r_elements = si_elem.findall('.//x:r', namespaces)
            if r_elements:  # 富文本
                for r in r_elements:
                    t_elem = r.find('.//x:t', namespaces)
                    if t_elem is None:
                        continue
                        
                    text = t_elem.text or ""
                    rpr = r.find('.//x:rPr', namespaces)
                    color = None
                    
                    if rpr is not None:
                        color_elem = rpr.find('.//x:color', namespaces)
                        if color_elem is not None:
                            if 'rgb' in color_elem.attrib:
                                color = color_elem.get('rgb')
                            elif 'theme' in color_elem.attrib:
                                # 处理主题颜色，这需要额外的逻辑
                                theme = color_elem.get('theme')
                                tint = color_elem.get('tint', '0')
                                # 这里简化处理，实际需要从theme文件获取颜色并应用tint
                                color = f"THEME{theme}"
                    
                    result.append((text, color))
            else:  # 普通文本
                t_elem = si_elem.find('.//x:t', namespaces)
                if t_elem is not None:
                    text = t_elem.text or ""
                    result.append((text, None))
            
            return result
            
    except zipfile.BadZipFile:
        raise ValueError(f"无法打开Excel文件，文件可能已损坏: {file_path}")
    except ET.ParseError as e:
        raise ValueError(f"XML解析错误: {str(e)}")
    except Exception as e:
        raise ValueError(f"处理Excel文件时出错: {str(e)}")

def format_with_color_codes(colors_data):
    """
    将颜色数据格式化为带有颜色代码的字符串
    
    Args:
        colors_data (list): 包含文本和颜色信息的列表，格式为[(text, color_rgb), ...]
    
    Returns:
        str: 格式化后的字符串，如 "aa|cffff0000bb|r|cff00ff00cc|rdd"
    """
    if not colors_data:
        return ""
    
    result = []
    current_color = None
    current_text = ""
    
    for text, color in colors_data:
        if color != current_color:
            # 如果有累积的文本，先添加到结果中
            if current_text:
                if current_color:
                    # 转换颜色格式：FFRRGGBB -> |cffRRGGBB|r
                    if current_color.startswith("THEME"):
                        # 主题颜色暂时使用默认颜色
                        color_code = "|cffFFFFFF"
                    else:
                        # 确保RGB格式正确
                        if current_color.startswith("FF") and len(current_color) == 8:
                            color_code = f"|cff{current_color[2:]}"
                        else:
                            color_code = f"|cff{current_color}"
                    result.append(f"{color_code}{current_text}|r")
                else:
                    result.append(current_text)
                current_text = ""
            current_color = color
        
        current_text += text if text else ""
    
    # 处理最后一段文本
    if current_text:
        if current_color:
            if current_color.startswith("THEME"):
                color_code = "|cffFFFFFF"
            else:
                if current_color.startswith("FF") and len(current_color) == 8:
                    color_code = f"|cff{current_color[2:]}"
                else:
                    color_code = f"|cff{current_color}"
            result.append(f"{color_code}{current_text}|r")
        else:
            result.append(current_text)
    
    return "".join(result)

def process_excel_cell_colors(file_path, sheet_name, cell_ref):
    """
    处理Excel单元格，提取字符级颜色并格式化
    
    Args:
        file_path (str): Excel文件路径
        sheet_name (str): 工作表名称
        cell_ref (str): 单元格引用，如'A1'
    
    Returns:
        str: 格式化后的带颜色代码的字符串
    """
    try:
        colors_data = get_colors_from_excel(file_path, sheet_name, cell_ref)
        return format_with_color_codes(colors_data)
    except Exception as e:
        import traceback
        print(f"处理单元格 {cell_ref} 时出错:")
        print(f"参数: file_path={file_path}, sheet_name={sheet_name}, cell_ref={cell_ref}")
        print(traceback.format_exc())
        return ""

# 使用示例
if __name__ == "__main__":
    try:
        # 使用原始字符串避免转义问题
        file_path = r"else\Test\excel\演员单位.xlsx"
        
        # 先尝试打开文件并列出所有工作表
        with zipfile.ZipFile(file_path) as zip_file:
            workbook_xml = zip_file.read('xl/workbook.xml')
            workbook_root = ET.parse(BytesIO(workbook_xml)).getroot()
            
            # 创建命名空间映射
            namespaces = {
                'x': 'http://schemas.openxmlformats.org/spreadsheetml/2006/main'
            }
            
            print("Excel文件中的可用工作表:")
            available_sheets = []
            for sheet_elem in workbook_root.findall('.//x:sheet', namespaces):
                sheet_name = sheet_elem.get('name')
                available_sheets.append(sheet_name)
                print(f"- {sheet_name}")
            
            if available_sheets:
                # 使用第一个工作表
                first_sheet = available_sheets[0]
                print(f"使用工作表: {first_sheet}")
                
                result = process_excel_cell_colors(file_path, first_sheet, "B3")
                print(f"处理结果: {result}")
            else:
                print("未找到任何工作表")
                
    except FileNotFoundError:
        print(f"文件不存在: {file_path}")
    except zipfile.BadZipFile:
        print(f"无法打开文件，可能不是有效的Excel文件: {file_path}")
    except Exception as e:
        import traceback
        print(f"错误: {str(e)}")
        print(traceback.format_exc())