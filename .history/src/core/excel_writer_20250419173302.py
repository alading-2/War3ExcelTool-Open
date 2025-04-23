import os
import shutil
import pandas as pd
import numpy as np
from configparser import ConfigParser
from typing import Dict, List
from pathlib import Path
import logging

class ExcelWriter:
    """
    Excel写入器类，用于将数据写入Excel文件的不同工作表中。
    支持从模板创建新文件，并保持模板中的格式和注释。
    """
    def __init__(self, template_path: str = r"resource\resource\物编.xlsx"):
        # 设置模板文件路径
        self.template_path = template_path
        # 定义工作表映射关系，用于将内部类型名映射到Excel中的sheet名
        self.sheet_mapping = {
            'unit': '单位',
            'item': '物品',
            'ability': '技能',
            'buff': '魔法效果',
            'destructable': '可破坏物',
            'upgrade': '科技'
        }
        # 初始化日志记录器
        self.logger = logging.getLogger(__name__)

    def write_to_excel(self, data_dict: Dict[str, Dict], output_path: str) -> bool:
        """
        将分类数据写入Excel的不同工作表中。
        
        Args:
            data_dict: 包含不同类型数据的字典，格式为 {type: {id: data}}
                      type: 数据类型（如unit, item等）
                      id: 每条数据的唯一标识符
                      data: 包含该条目所有属性的字典
            output_path: 输出Excel文件的路径
            
        Returns:
            bool: 写入成功返回True，失败返回False
        """
        try:
            # 确保输出目录存在
            os.makedirs(os.path.dirname(output_path), exist_ok=True)
            
            # 复制模板文件到目标位置
            if os.path.exists(self.template_path):
                shutil.copyfile(self.template_path, output_path)
            else:
                self.logger.error(f"excel模板文件 {self.template_path} 不存在。")
                raise FileNotFoundError(f"模板文件 {self.template_path} 不存在。")
            
            # 读取模板文件获取列信息，header=None表示不使用任何行作为列名
            template_data = pd.read_excel(output_path, sheet_name=None, header=None)
            
            # 使用pandas的ExcelWriter写入数据，mode='a'表示追加模式
            with pd.ExcelWriter(output_path, engine='openpyxl', mode='a', if_sheet_exists='replace') as writer:
                # 遍历每种类型的数据
                for type_name, type_data in data_dict.items():
                    # 跳过未在映射中定义的类型
                    if type_name not in self.sheet_mapping:
                        continue
                    
                    # 获取对应的sheet名称
                    sheet_name = self.sheet_mapping[type_name]
                    
                    # 从模板中获取sheet的列信息
                    if sheet_name in template_data:
                        template_sheet = template_data[sheet_name]
                        # 获取第二行作为列名
                        columns = template_sheet.iloc[1].tolist()
                    else:
                        self.logger.warning(f"模板中未找到sheet: {sheet_name}，将创建新sheet")
                        columns = []
                    
                    # 准备数据行
                    rows_data = []
                    # 初始化列集合，包含模板中的所有列
                    all_keys = set(columns)
                    
                    # 收集数据中的所有可能的键
                    for section_data in type_data.values():
                        all_keys.update(section_data.keys())
                    
                    # 将列名转换为有序列表并确保'id'列在最前
                    all_columns = sorted(list(all_keys))
                    if 'id' in all_columns:
                        all_columns.remove('id')
                        all_columns.insert(0, 'id')
                    
                    # 构建每一行的数据
                    for section_id, section_data in type_data.items():
                        row = {'id': section_id}
                        # 填充其他列的数据，不存在的值用NaN填充
                        for col in all_columns[1:]:
                            value = section_data.get(col, np.nan)
                            # 处理多行字符串
                            # if isinstance(value, str):
                            #     # 处理数组格式 - 如HeroDur = {7.0, 7.0, 7.0, 7.0}，保持原样
                            #     if value.startswith('{') and value.endswith('}'): 
                            #         row[col] = value
                            #     # 处理Tip类型数组格式，保持原样
                            #     elif value.startswith('Tip = {') or value.startswith('DataF = {'):
                            #         row[col] = value
                            #     # 处理多行字符串格式 [=[...]=]，去掉[=[ 和 ]=]，保留中间内容
                            #     else:
                            #         row[col] = value
                            # else:
                            #     row[col] = value
                            row[col] = value
                        rows_data.append(row)
                    
                    # 创建DataFrame并设置列名
                    df = pd.DataFrame(rows_data, columns=all_columns)
                    
                    # 这里不能这么写
                    # 如果模板中存在该sheet，保留第一行的注释
                    # if sheet_name in template_data:
                    #     comments = template_data[sheet_name].iloc[0:1]
                    #     df = pd.concat([comments, df], ignore_index=True)
                    
                    # 将数据写入Excel，不包含行索引
                    df.to_excel(
                        writer,
                        sheet_name=sheet_name,
                        index=False
                    )
            
            return True
            
        except Exception as e:
            # 记录错误并返回失败状态
            self.logger.error(f"写入Excel失败: {str(e)}")
            return False