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
            # 调试信息：打印ZIP文件中的所有文件
            print(f"DEBUG: Excel文件中的所有文件:")
            for zf in zip_file.namelist():
                print(f"  - {zf}")
            
            # 读取workbook.xml以查找sheet id
            try:
                workbook_xml = zip_file.read('xl/workbook.xml')
                workbook_root = ET.parse(BytesIO(workbook_xml)).getroot()
            except KeyError:
                raise ValueError("找不到workbook.xml文件，可能不是标准Excel文件格式")
            
            # 列出所有可用的工作表
            available_sheets = []
            
            # 尝试不同的命名空间组合
            sheet_elements = workbook_root.findall('.//x:sheet', namespaces)
            if not sheet_elements:
                # 如果找不到，尝试不使用命名空间
                print("DEBUG: 使用x命名空间未找到sheet元素，尝试不使用命名空间")
                sheet_elements = workbook_root.findall('.//{*}sheet')
            
            for sheet_elem in sheet_elements:
                sheet_name_found = sheet_elem.get('name')
                available_sheets.append(sheet_name_found)
                print(f"DEBUG: 找到工作表: {sheet_name_found}")
            
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
            
            # 尝试使用命名空间
            for sheet_elem in sheet_elements:
                if sheet_elem.get('name') == sheet_name:
                    r_id = sheet_elem.get('{http://schemas.openxmlformats.org/officeDocument/2006/relationships}id')
                    if r_id:
                        sheet_id = r_id
                        print(f"DEBUG: 使用命名空间URI找到sheet的r:id: {sheet_id}")
                        break
                    
                    # 如果上面的方式找不到，尝试直接使用'r:id'
                    r_id = sheet_elem.get('r:id')
                    if r_id:
                        sheet_id = r_id
                        print(f"DEBUG: 使用r:id属性找到sheet的ID: {sheet_id}")
                        break
                    
                    # 最后尝试遍历所有属性
                    for attr_name, attr_value in sheet_elem.attrib.items():
                        if attr_name.endswith('id') or 'Id' in attr_name:
                            sheet_id = attr_value
                            print(f"DEBUG: 通过属性名搜索找到可能的ID: {attr_name}={sheet_id}")
                            break
            
            if not sheet_id:
                raise ValueError(f"无法获取工作表 '{sheet_name}' 的ID")
            
            # 读取sheet对应的XML文件
            try:
                rels_path = 'xl/_rels/workbook.xml.rels'
                print(f"DEBUG: 尝试读取关系文件: {rels_path}")
                rels_xml = zip_file.read(rels_path)
                rels_root = ET.parse(BytesIO(rels_xml)).getroot()
            except KeyError:
                # 尝试查找替代的关系文件
                alt_rels_path = None
                for name in zip_file.namelist():
                    if name.endswith('.rels') and 'workbook' in name:
                        alt_rels_path = name
                        break
                
                if alt_rels_path:
                    print(f"DEBUG: 使用替代关系文件: {alt_rels_path}")
                    rels_xml = zip_file.read(alt_rels_path)
                    rels_root = ET.parse(BytesIO(rels_xml)).getroot()
                else:
                    raise ValueError("找不到workbook关系文件")
            
            # 打印rels文件内容用于调试
            print("DEBUG: 关系文件内容:")
            for rel in rels_root:
                rel_id = rel.get('Id')
                rel_target = rel.get('Target')
                rel_type = rel.get('Type')
                print(f"  - Id={rel_id}, Target={rel_target}, Type={rel_type}")
            
            # 找到sheet对应的Target
            sheet_path = None
            
            # 先尝试使用命名空间
            for rel in rels_root.findall('.//r:Relationship', namespaces):
                if rel.get('Id') == sheet_id:
                    sheet_path = 'xl/' + rel.get('Target').lstrip('/')
                    print(f"DEBUG: 使用r命名空间找到工作表路径: {sheet_path}")
                    break
            
            # 如果找不到，尝试不使用命名空间
            if not sheet_path:
                for rel in rels_root.findall('.//{*}Relationship'):
                    if rel.get('Id') == sheet_id:
                        sheet_path = 'xl/' + rel.get('Target').lstrip('/')
                        print(f"DEBUG: 使用通用命名空间找到工作表路径: {sheet_path}")
                        break
                        
            # 最后直接遍历所有子元素
            if not sheet_path:
                for rel in rels_root:
                    if rel.get('Id') == sheet_id:
                        sheet_path = 'xl/' + rel.get('Target').lstrip('/')
                        print(f"DEBUG: 通过直接遍历找到工作表路径: {sheet_path}")
                        break
            
            if not sheet_path:
                raise ValueError(f"未找到工作表 '{sheet_name}' 的路径。sheet_id={sheet_id}")
            
            # 读取sheet XML
            try:
                print(f"DEBUG: 尝试读取工作表文件: {sheet_path}")
                sheet_xml = zip_file.read(sheet_path)
                sheet_root = ET.parse(BytesIO(sheet_xml)).getroot()
            except KeyError:
                raise ValueError(f"找不到工作表文件: {sheet_path}")
            except ET.ParseError:
                raise ValueError(f"工作表XML解析错误: {sheet_path}")
            
            # 找到单元格
            cell_elem = None
            
            # 尝试使用x命名空间
            cell_elements = sheet_root.findall(f'.//x:c[@r="{cell_ref}"]', namespaces)
            if cell_elements:
                cell_elem = cell_elements[0]
                print(f"DEBUG: 使用x命名空间找到单元格: {cell_ref}")
            
            # 如果找不到，尝试不使用命名空间
            if not cell_elem:
                cell_elements = sheet_root.findall(f'.//{*}c[@r="{cell_ref}"]')
                if cell_elements:
                    cell_elem = cell_elements[0]
                    print(f"DEBUG: 使用通用命名空间找到单元格: {cell_ref}")
            
            # 最后尝试XPath
            if not cell_elem:
                for elem in sheet_root.findall('.//*'):
                    if elem.get('r') == cell_ref:
                        cell_elem = elem
                        print(f"DEBUG: 通过手动搜索找到单元格: {cell_ref}")
                        break
            
            if not cell_elem:
                raise ValueError(f"在工作表 '{sheet_name}' 中未找到单元格 '{cell_ref}'")
            
            # 调试信息：打印单元格属性
            print(f"DEBUG: 单元格属性:")
            for attr_name, attr_value in cell_elem.attrib.items():
                print(f"  - {attr_name}={attr_value}")
            
            # 检查单元格是否有内联格式（富文本）
            is_shared_string = False
            cell_type = cell_elem.get('t')
            
            print(f"DEBUG: 单元格类型: {cell_type}")
            
            # 检查单元格类型
            if cell_type == 's':  # 共享字符串
                is_shared_string = True
                print("DEBUG: 单元格包含共享字符串")
            elif cell_type is None:  # 可能是数字或日期
                v_elem = cell_elem.find('x:v', namespaces) or cell_elem.find('v') or cell_elem.find('{*}v')
                if v_elem is not None:
                    print(f"DEBUG: 找到非共享字符串值: {v_elem.text}")
                    return [(v_elem.text, None)]
                print("DEBUG: 未找到单元格值")
                return []
            
            # 如果不是共享字符串
            if not is_shared_string:
                v_elem = cell_elem.find('x:v', namespaces) or cell_elem.find('v') or cell_elem.find('{*}v')
                if v_elem is not None:
                    print(f"DEBUG: 找到非共享字符串值: {v_elem.text}")
                    return [(v_elem.text, None)]
                print("DEBUG: 未找到单元格值")
                return []
            
            # 读取共享字符串表
            try:
                print("DEBUG: 尝试读取共享字符串表")
                shared_strings_xml = zip_file.read('xl/sharedStrings.xml')
                shared_strings_root = ET.parse(BytesIO(shared_strings_xml)).getroot()
            except KeyError:
                raise ValueError("此Excel文件中没有共享字符串表")
            
            # 获取富文本信息
            result = []
            
            # 获取单元格中的值（索引到共享字符串）
            v_elem = cell_elem.find('x:v', namespaces) or cell_elem.find('v') or cell_elem.find('{*}v')
            if v_elem is None:
                print("DEBUG: 未找到指向共享字符串的索引值")
                return []
                
            si_index = int(v_elem.text)
            print(f"DEBUG: 共享字符串索引: {si_index}")
            
            # 检查索引是否有效
            si_elements = shared_strings_root.findall('.//x:si', namespaces) or shared_strings_root.findall('.//{*}si')
            if not si_elements:
                print("DEBUG: 未找到任何共享字符串项")
                
            if si_index >= len(si_elements):
                raise ValueError(f"共享字符串索引 {si_index} 超出范围，共有 {len(si_elements)} 项")
                
            si_elem = si_elements[si_index]
            
            # 检查是否为富文本
            r_elements = si_elem.findall('.//x:r', namespaces) or si_elem.findall('.//{*}r')
            if r_elements:  # 富文本
                print(f"DEBUG: 发现富文本，共有 {len(r_elements)} 个部分")
                for r in r_elements:
                    t_elem = r.find('.//x:t', namespaces) or r.find('.//{*}t')
                    if t_elem is None:
                        print("DEBUG: 富文本部分中未找到文本元素")
                        continue
                        
                    text = t_elem.text or ""
                    print(f"DEBUG: 富文本部分: '{text}'")
                    
                    rpr = r.find('.//x:rPr', namespaces) or r.find('.//{*}rPr')
                    color = None
                    
                    if rpr is not None:
                        color_elem = rpr.find('.//x:color', namespaces) or rpr.find('.//{*}color')
                        if color_elem is not None:
                            if 'rgb' in color_elem.attrib:
                                color = color_elem.get('rgb')
                                print(f"DEBUG: 找到RGB颜色: {color}")
                            elif 'theme' in color_elem.attrib:
                                theme = color_elem.get('theme')
                                tint = color_elem.get('tint', '0')
                                color = f"THEME{theme}"
                                print(f"DEBUG: 找到主题颜色: theme={theme}, tint={tint}")
                    
                    result.append((text, color))
            else:  # 普通文本
                t_elem = si_elem.find('.//x:t', namespaces) or si_elem.find('.//{*}t')
                if t_elem is not None:
                    text = t_elem.text or ""
                    print(f"DEBUG: 普通文本: '{text}'")
                    result.append((text, None))
                else:
                    print("DEBUG: 未找到文本元素")
            
            print(f"DEBUG: 返回结果: {result}")
            return result
            
    except zipfile.BadZipFile:
        raise ValueError(f"无法打开Excel文件，文件可能已损坏: {file_path}")
    except ET.ParseError as e:
        raise ValueError(f"XML解析错误: {str(e)}")
    except Exception as e:
        import traceback
        traceback.print_exc()
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
        
        # 检查文件是否存在
        if not os.path.exists(file_path):
            print(f"错误: 文件不存在 '{file_path}'")
            alternative_path = r"else/Test/excel/演员单位.xlsx"
            if os.path.exists(alternative_path):
                print(f"找到替代路径: '{alternative_path}'")
                file_path = alternative_path
            else:
                print("请检查文件路径是否正确")
                
        print(f"使用文件路径: {file_path}")
        
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
            
            # 尝试使用命名空间
            sheet_elements = workbook_root.findall('.//x:sheet', namespaces)
            if not sheet_elements:
                # 如果找不到，尝试不使用命名空间
                sheet_elements = workbook_root.findall('.//{*}sheet')
            
            for sheet_elem in sheet_elements:
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