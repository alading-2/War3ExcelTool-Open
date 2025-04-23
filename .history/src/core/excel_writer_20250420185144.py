import os
import shutil
import pandas as pd
import numpy as np
from typing import Dict, List
from src.utils.config_manager import ConfigManager
import logging
from src.utils.excel_utils import ensure_excel_file_closed, format_excel_workbook

class ExcelWriter:
    """
    Excel写入器类，用于将数据写入Excel文件的不同工作表中。
    支持从模板创建新文件，并保持模板中的格式和注释。
    同时提供自动格式优化功能，设置单元格边框、字体、对齐方式等。
    """
    def __init__(self, template_path: str = r"resource\resource\物编.xlsx"):
        # 初始化配置管理器
        self.config_manager = ConfigManager()
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

    def write_to_excel(self, data_dict: Dict[str, Dict], output_path: str, apply_formatting: bool = True) -> bool:
        """
        将分类数据写入Excel的不同工作表中，并可选择应用格式优化。
        
        Args:
            data_dict: 包含不同类型数据的字典，格式为 {type: {id: data}}
                      type: 数据类型（如unit, item等）
                      id: 每条数据的唯一标识符
                      data: 包含该条目所有属性的字典
            output_path: 输出Excel文件的路径
            apply_formatting: 是否应用格式优化，默认为True
            
        Returns:
            bool: 写入成功返回True，失败返回False
        """
        try:
            config=self.config_manager.get_all() # 从配置管理器获取所有配置
            
            # 确保输出目录存在
            os.makedirs(os.path.dirname(output_path), exist_ok=True)
            
            # 确保目标Excel文件未被打开，如果已打开则强制关闭
            ensure_excel_file_closed(output_path)
            
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
                            row[col] = value
                        rows_data.append(row)
                    
                    # 创建DataFrame并设置列名
                    df = pd.DataFrame(rows_data, columns=all_columns)
                    
                    # 将数据写入Excel，不包含行索引
                    df.to_excel(
                        writer,
                        sheet_name=sheet_name,
                        index=False
                    )
            
            # 应用格式优化
            if apply_formatting:
                self.logger.info(f"开始优化Excel文件格式: {output_path}")
                format_excel_workbook(output_path)
            
            return True
            
        except Exception as e:
            # 记录错误并返回失败状态
            self.logger.error(f"写入Excel失败: {str(e)}")
            return False