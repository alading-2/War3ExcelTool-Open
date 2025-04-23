import os
import shutil
import pandas as pd
import numpy as np
from configparser import ConfigParser
from typing import Dict, List
from pathlib import Path
import logging

class ExcelWriter:
    def __init__(self, template_path: str = r"resource\resource\物编.xlsx"):
        self.template_path = template_path
        self.sheet_mapping = {
            'unit': '单位',
            'item': '物品',
            'ability': '技能',
            'buff': 'Buff',
            'destructable': '可破坏物',
            'upgrade': '科技'
        }
        self.logger = logging.getLogger(__name__)

    def write_to_excel(self, data_dict: Dict[str, Dict], output_path: str) -> bool:
        """
        将分类数据写入 Excel 的不同 Sheet
        
        Args:
            data_dict: 包含不同类型数据的字典，格式为 {type: {id: data}}
            output_path: 输出Excel文件的路径
        """
        try:
            # 确保输出目录存在
            os.makedirs(os.path.dirname(output_path), exist_ok=True)
            
            # 复制模板文件
            if os.path.exists(self.template_path):
                shutil.copyfile(self.template_path, output_path)
            else:
                self.logger.error(f"excel模板文件 {self.template_path} 不存在。")
                raise FileNotFoundError(f"模板文件 {self.template_path} 不存在。")
            
            # 读取模板文件获取列信息
            template_data = pd.read_excel(output_path, sheet_name=None, header=None)
            
            with pd.ExcelWriter(output_path, engine='openpyxl', mode='a') as writer:
                for type_name, type_data in data_dict.items():
                    if type_name not in self.sheet_mapping:
                        continue
                    
                    sheet_name = self.sheet_mapping[type_name]
                    
                    # 获取模板中的sheet数据
                    if sheet_name in template_data:
                        template_sheet = template_data[sheet_name]
                        # 获取列名（第二行）
                        columns = template_sheet.iloc[1].tolist()
                    else:
                        self.logger.warning(f"模板中未找到sheet: {sheet_name}，将创建新sheet")
                        columns = []
                    
                    # 准备数据
                    rows_data = []
                    all_keys = set(columns)  # 用于收集所有可能的键
                    
                    # 收集所有键
                    for section_data in type_data.values():
                        all_keys.update(section_data.keys())
                    
                    # 将所有键转换为列表并排序
                    all_columns = sorted(list(all_keys))
                    if 'id' in all_columns:  # 确保'id'是第一列
                        all_columns.remove('id')
                        all_columns.insert(0, 'id')
                    
                    # 构建数据行
                    for section_id, section_data in type_data.items():
                        row = {'id': section_id}
                        for col in all_columns[1:]:  # 跳过'id'列
                            row[col] = section_data.get(col, np.nan)
                        rows_data.append(row)
                    
                    # 创建DataFrame 并设置列索引名
                    df = pd.DataFrame(rows_data, columns=all_columns)
                    
                    # 如果有模板数据，保留注释行
                    if sheet_name in template_data:
                        comments = template_data[sheet_name].iloc[0:1]
                        df = pd.concat([comments, df], ignore_index=True)
                    
                    # 写入Excel
                    df.to_excel(
                        writer,
                        sheet_name=sheet_name,
                        index=False
                    )
            
            return True
            
        except Exception as e:
            self.logger.error(f"写入Excel失败: {str(e)}")
            return False