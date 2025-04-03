import zipfile
import xml.etree.ElementTree as ET
from io import BytesIO
import re

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
        'w': 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'
    }
    
    with zipfile.ZipFile(file_path) as zip_file:
        # 读取workbook.xml以查找sheet id
        workbook_xml = zip_file.read('xl/workbook.xml')
        workbook_root = ET.parse(BytesIO(workbook_xml)).getroot()
        
        # 找到对应sheet的id
        sheet_id = None
        for sheet_elem in workbook_root.findall('.//sheet', namespaces):
            if sheet_elem.get('name') == sheet_name:
                sheet_id = sheet_elem.get('{http://schemas.openxmlformats.org/officeDocument/2006/relationships}id')
                break
        
        if not sheet_id:
            raise ValueError(f"Sheet '{sheet_name}' not found")
        
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
            raise ValueError(f"Sheet path not found for sheet '{sheet_name}'")
        
        # 读取sheet XML
        sheet_xml = zip_file.read(sheet_path)
        sheet_root = ET.parse(BytesIO(sheet_xml)).getroot()
        
        # 找到单元格
        cell_elem = None
        for c in sheet_root.findall(f'.//c[@r="{cell_ref}"]'):
            cell_elem = c
            break
        
        if not cell_elem:
            raise ValueError(f"Cell '{cell_ref}' not found in sheet '{sheet_name}'")
        
        # 检查单元格是否有内联格式（富文本）
        is_string = cell_elem.find('is')
        if is_string is None:
            # 不是富文本，返回整个单元格的文本和默认颜色
            v_elem = cell_elem.find('v')
            if v_elem is not None:
                return [(v_elem.text, None)]
            return []
        
        # 读取共享字符串表
        shared_strings_xml = zip_file.read('xl/sharedStrings.xml')
        shared_strings_root = ET.parse(BytesIO(shared_strings_xml)).getroot()
        
        # 获取富文本信息
        result = []
        si_index = int(cell_elem.find('v').text)
        si_elem = shared_strings_root.findall('.//si')[si_index]
        
        # 处理富文本
        for r in si_elem.findall('.//r'):
            text = r.find('.//t').text
            rpr = r.find('.//rPr')
            color = None
            
            if rpr is not None:
                color_elem = rpr.find('.//color')
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
        
        return result

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
                    color_code = f"|cff{current_color[2:]}"
                    result.append(f"{color_code}{current_text}|r")
                else:
                    result.append(current_text)
                current_text = ""
            current_color = color
        
        current_text += text
    
    # 处理最后一段文本
    if current_text:
        if current_color:
            color_code = f"|cff{current_color[2:]}"
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
    result = process_excel_cell_colors("example.xlsx", "Sheet1", "A1")
    print(result)