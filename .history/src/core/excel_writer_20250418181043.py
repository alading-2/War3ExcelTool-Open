import os
import shutil
import pandas as pd
from configparser import ConfigParser
from typing import Dict
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

    def write_to_excel(self, data_dict: Dict[str, ConfigParser], output_path: str) -> bool:
        """将分类数据写入 Excel 的不同 Sheet"""
        try:
            # 确保输出目录存在
            os.makedirs(os.path.dirname(output_path), exist_ok=True)
            
            # 复制模板文件（如果存在）
            if os.path.exists(self.template_path):
                shutil.copyfile(self.template_path, output_path)
            else:
                self.logger.error(f"excel模板文件 {self.template_path} 不存在。")
                raise FileNotFoundError(f"模板文件 {self.template_path} 不存在。")
            
            with pd.ExcelWriter(output_path, engine='openpyxl', mode='a' if os.path.exists(output_path) else 'w') as writer:
                for obj_type, parser in data_dict.items():
                    if obj_type not in self.sheet_mapping:
                        continue
                        
                    # 转换 ConfigParser 到 DataFrame
                    data = []
                    for section in parser.sections():
                        row = {'ID': section}
                        row.update(dict(parser.items(section)))
                        data.append(row)
                    
                    df = pd.DataFrame(data)
                    sheet_name = self.sheet_mapping[obj_type]
                    
                    # 写入 Excel
                    df.to_excel(
                        writer,
                        sheet_name=sheet_name,
                        index=False,
                        header=not writer.sheets  # 仅在第一张sheet写表头
                    )
            
            return True
        except Exception as e:
            logging.error(f"写入 Excel 失败: {str(e)}")
            return False