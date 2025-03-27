import os
from typing import Dict, List, Any, Tuple
import logging
from ..utils.logger import get_logger

logger = get_logger(__name__)

class TSGenerator:
    """生成TypeScript代码的类"""
    
    def __init__(self, type_handler):
        """
        初始化TSGenerator类
        
        Args:
            type_handler: 类型处理器实例
        """
        self.logger = logging.getLogger(__name__)
        self.type_handler = type_handler
    
    def generate_ts_file(self, 
                         excel_name: str, 
                         metadata: Dict[str, Any], 
                         keys: List[str], 
                         data_rows: List[Dict],
                         color_map: Dict[str, str],
                         output_dir: str) -> str:
        """
        生成TypeScript文件
        
        Args:
            excel_name: Excel文件名（不含扩展名）
            metadata: 元数据
            keys: 键名列表
            data_rows: 数据行列表
            color_map: 颜色映射
            output_dir: 输出目录
            
        Returns:
            生成的文件路径
        """
        try:
            # 提取TypeScript代码
            imports, other_code = self.type_handler.extract_ts_code(data_rows, keys)
            
            # 生成接口常量名和接口名
            interface_keys_name = f"xlsx_inte_keys_{excel_name}"
            interface_name = f"xlsx_inte_{excel_name}"
            data_name = f"xlsx_data_{excel_name}"
            class_name = f"xlsx_{excel_name}"
            
            # 生成接口定义
            interface_keys = []
            interface_props = []
            
            for i, key in enumerate(keys):
                if key == "code":
                    continue
                    
                # 收集数据以确定类型
                values = [row.get(key) for row in data_rows if key in row]
                
                # 确定每个字段的类型
                types = set()
                for value in values:
                    if value is not None:
                        types.add(self.type_handler.infer_type(value))
                
                if len(types) == 0:
                    field_type = "any"
                elif len(types) == 1:
                    field_type = next(iter(types))
                else:
                    # 多种类型情况
                    if "any" in types:
                        field_type = "any" 
                    else:
                        field_type = " | ".join(types)
                
                interface_keys.append(f'    "{key}": "{key}"')
                interface_props.append(f'    {key}: {field_type};')
            
            # 生成数据数组
            data_entries = []
            
            for row_idx, row in enumerate(data_rows):
                row_entries = []
                row_id = row.get("id")
                
                for key in keys:
                    if key not in row or key == "code":
                        continue
                        
                    value = row[key]
                    value_type = self.type_handler.infer_type(value)
                    
                    # 检查是否有颜色代码
                    color_code = None
                    cell_pos = f"{row_idx+3}_{keys.index(key)+1}"  # 行+3是因为从第三行开始是数据
                    if cell_pos in color_map and value_type == "string":
                        color_code = color_map[cell_pos]
                    
                    formatted_value = self.type_handler.format_value_for_ts(value, value_type, color_code)
                    row_entries.append(f'        {key}: {formatted_value}')
                
                if row_entries:
                    data_entries.append(f'    {{\n{",\n".join(row_entries)}\n    }}')
            
            # 组装最终代码
            ts_code = [
                '// This file is auto-generated from Excel data',
                ''
            ]
            
            # 添加导入语句
            if imports:
                ts_code.extend(imports)
                ts_code.append('')
            
            # 添加接口键定义
            ts_code.extend([
                f'export const {interface_keys_name} = {{',
                ',\n'.join(interface_keys),
                '};',
                ''
            ])
            
            # 添加接口定义
            ts_code.extend([
                f'export interface {interface_name} {{',
                '\n'.join(interface_props),
                '}',
                ''
            ])
            
            # 添加数据定义
            ts_code.extend([
                f'export const {data_name}: {interface_name}[] = [',
                ',\n'.join(data_entries),
                '];',
                ''
            ])
            
            # 添加类定义
            ts_code.extend([
                f'export class {class_name} {{',
                '    constructor() {',
                '        //构造函数',
                '    }',
                '',
                '    public Start(): void {',
                '        //Start方法，用于初始化数据'
            ])
            
            # 添加其他代码到Start方法中
            if other_code:
                ts_code.append('        ' + '\n        '.join(other_code))
            
            ts_code.extend([
                '    }',
                '}',
                ''
            ])
            
            # 写入文件
            os.makedirs(output_dir, exist_ok=True)
            output_file = os.path.join(output_dir, f"xlsx_{excel_name}.ts")
            
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write('\n'.join(ts_code))
            
            self.logger.info(f"成功生成TypeScript文件: {output_file}")
            return output_file
            
        except Exception as e:
            self.logger.error(f"生成TypeScript文件时出错: {str(e)}")
            raise 