import os
import shutil
import pandas as pd
import numpy as np
from typing import Dict, List
from src.core.excel.data_handler import ExcelTable
from src.core.ini.ini_parser import War3IniParser
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

    def write_to_excel(self,
                       data_dict: Dict[str, Dict],
                       output_path: str,
                       apply_formatting: bool = True) -> bool:
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
            sort_by_alpha = self.config_manager.get(
                "sort_by_alpha")  # 是否按字母顺序排序
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
            template_data = pd.read_excel(output_path,
                                          sheet_name=None,
                                          header=None)

            # 使用pandas的ExcelWriter写入数据，mode='a'表示追加模式
            with pd.ExcelWriter(output_path,
                                engine='openpyxl',
                                mode='a',
                                if_sheet_exists='replace') as writer:
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
                        keys = template_sheet.iloc[1].tolist()
                    else:
                        self.logger.warning(
                            f"模板中未找到sheet: {sheet_name}，将创建新sheet")
                        keys = []

                    # 收集数据中的所有可能的键
                    # 通过列表推导式遍历type_data字典中的所有值(每个值都是一个数据项字典)，对每个数据项字典调用keys()方法获取其所有键
                    # 使用*解包操作符将列表中的所有键集合作为参数传递给union()方法，
                    # union()方法将所有键合并成一个集合，自动去除重复项
                    all_section_keys = set().union(*[
                        section_data.keys()
                        for section_data in type_data.values()
                    ])
                    # 通过列表推导式筛选出在all_section_keys中但不在keys中的键
                    keys.extend(
                        [key for key in all_section_keys if key not in keys])

                    # 如果需要按字母顺序排序
                    all_keys = keys
                    if sort_by_alpha:
                        # 将列名转换为有序列表并确保'id'列在最前
                        all_keys = sorted(all_keys)
                    # 将id列和_parent列移到最前面
                    if 'id' in all_keys:
                        all_keys.remove('id')
                        all_keys.insert(0, 'id')
                    if '_parent' in all_keys:
                        all_keys.remove('_parent')
                        all_keys.insert(1, '_parent')

                    path = r"resource\resource\editor_info_map.ini"
                    dict_comment, dict1 = War3IniParser.parse_ini(path)
                    dict_comment = dict_comment.get("editor_info_map")

                    # 准备数据行
                    rows_data = []
                    # 注释行
                    list_comment = []
                    for key in all_keys:
                        key_lower = key.lower()
                        if key_lower in dict_comment:
                            # 有直接的中文注释或者匹配
                            list_comment.append(dict_comment[key_lower])
                        else:
                            is_part = False
                            for comment_key in dict_comment.keys():
                                # 部分匹配
                                if comment_key in key_lower:
                                    list_comment.append(
                                        dict_comment[comment_key])
                                    is_part = True
                                    break
                            # 不匹配：直接添加
                            if not is_part:
                                list_comment.append(key)

                    # 将list_comment和all_keys列表转换为字典
                    comment_dict = {}
                    for i, key in enumerate(all_keys):
                        comment_dict[key] = list_comment[i] if i < len(
                            list_comment) else key

                    # 添加注释行（作为字典）到rows_data
                    rows_data.append(comment_dict)
                    # 添加key值行（作为字典）
                    key_dict = {key: key for key in all_keys}
                    rows_data.append(key_dict)
                    # 构建每一行的数据
                    for section_id, section_data in type_data.items():
                        row = {'id': section_id}
                        # 填充其他列的数据，不存在的值用NaN填充
                        #
                        for comment_key in all_keys[1:]:
                            value = section_data.get(comment_key, np.nan)
                            row[comment_key] = value
                        rows_data.append(row)

                    # 创建DataFrame
                    df = pd.DataFrame(rows_data)
                    df.columns = all_keys
                    #
                    # 删除全是空值的列
                    # 自定义函数判断是否为空
                    # 检查每一列是否有非空值（跳过前两行，因为这是注释行和键值行）
                    cols_to_keep = [
                        col for col in df.columns if any(
                            ExcelTable.custom_notna(x) for x in df[col][2:])
                    ]

                    # 确保'id'列被保留
                    if 'id' not in cols_to_keep and 'id' in df.columns:
                        cols_to_keep.insert(0, 'id')

                    # 只保留有非空值的列
                    df = df[cols_to_keep]

                    # 将数据写入Excel，index=False不显示行索引，header=False
                    df.to_excel(writer,
                                sheet_name=sheet_name,
                                index=False,
                                header=False)

            # 应用格式优化
            if apply_formatting:
                self.logger.info(f"开始优化Excel文件格式: {output_path}")
                format_excel_workbook(output_path)

            return True

        except Exception as e:
            # 记录错误并返回失败状态
            self.logger.error(f"写入Excel失败: {str(e)}")
            return False
