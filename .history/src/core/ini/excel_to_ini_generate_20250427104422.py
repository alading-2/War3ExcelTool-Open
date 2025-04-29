# -*- coding: utf-8 -*-
"""
excel_to_ini_generate.py - Excel表格数据转换为War3物编INI文件

此模块实现了Excel表格数据到War3物编INI文件的转换功能，
支持生成各种物编类型（单位、技能、物品等）的INI文件，
并生成相应的TypeScript映射文件。
"""

import os
import re
import logging
import traceback
import shutil
from typing import Dict, List, Any, Tuple, Optional, Set, Union
from configparser import ConfigParser
from pathlib import Path

from src.core.excel.data_handler import ExcelTable
from src.core.ini.ini_parser import War3IniParser, OBJECT_TYPE_MAPPING
from src.utils.config_manager import ConfigManager
from src.utils.logger import setup_logger
from src.utils.file_utils import FileUtils
from src.utils.project_info import ProjectInfo


class ExcelToIniGenerator:
    """
    Excel表格数据转换为War3物编INI文件的生成器类
    
    此类负责将处理后的Excel数据转换为War3物编INI文件，
    支持基于模板生成不同类型的物编INI，并生成TS映射文件。
    """

    # 62进制字符集
    BASE62_CHARS = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    def __init__(self):
        """
        初始化Excel到INI生成器
        
        Args:
            config_manager: 配置管理器实例
        """
        config_manager = ConfigManager()
        self.config_manager = config_manager
        # 统一使用全局logger
        self.logger = logging.getLogger(__name__)

        # 获取玩家数量，默认为5
        self.player_count = int(config_manager.get_config("player_count", "5"))

        # INI输出路径 - 用于将生成的INI文件额外复制到指定目录，非必填
        self.ini_output_path = config_manager.get_config("ini_output", "")

        # 初始化错误信息列表
        self.error_messages = []

        # 加载编辑器信息映射
        self.dict_editor_info_map = ProjectInfo.dict_editor_info_map

        # 加载editor_info_map.json
        self.dict_editor_info_json_map = ProjectInfo.dict_editor_info_json_map

        # 加载模板文件
        self.dict_ini_template = ProjectInfo.dict_ini_template

        # 加载基础命令ID列表
        self.tuple_base_orderid = ProjectInfo.tuple_base_orderid

        # 初始化生成的INI数据字典
        self.ini_data = {}

        # 初始化TS映射数据
        self.unit_id_map = {}  # 单位ID映射
        self.item_id_map = {}  # 物品ID映射
        self.item_abil_map = {}  # 物品技能ID映射

        # 记录所有物编ID的详细来源信息，结构为 {file_path: {sheet_name: [(id, row_idx), ...]}}
        self.id_sources = {}

        # 记录所有已使用的ID，用于全局冲突检测
        self.all_used_ids = {}  # {id: [(file_path, sheet_name, row_idx), ...]}

    def decimal_to_base62(self, num: int) -> str:
        """
        将10进制数转换为62进制字符串
        
        Args:
            num: 10进制数
            
        Returns:
            str: 62进制字符串
        """
        if num == 0:
            return self.BASE62_CHARS[0]

        result = ""
        while num > 0:
            num, remainder = divmod(num, 62)
            result = self.BASE62_CHARS[remainder] + result

        return result

    def base62_to_decimal(self, base62_str: str) -> int:
        """
        将62进制字符串转换为10进制数
        
        Args:
            base62_str: 62进制字符串
            
        Returns:
            int: 10进制数
        """
        result = 0
        for char in base62_str:
            result = result * 62 + self.BASE62_CHARS.index(char)

        return result

    def format_ini_value(self, value: Any) -> str:
        """
        格式化INI值，确保字符串有双引号
        
        Args:
            value: 原始值
            
        Returns:
            str: 格式化后的值
        """
        if value is None:
            return '""'

        if isinstance(value, (int, float)):
            # War3物编不支持科学计数法，转为普通浮点数或整数
            if isinstance(value, int):
                return str(value)
            else:
                # 去掉小数点后的0
                str_val = str(value)
                if str_val.endswith('.0'):
                    return str_val[:-2]
                return str_val

        # 确保字符串有双引号
        str_val = str(value)
        if not (str_val.startswith('"') and str_val.endswith('"')):
            return f'"{str_val}"'

        return str_val

    def generate_ini_from_excel(
            self, excel_data: Dict[str, Any],
            file_path: str) -> Dict[str, Dict[str, Dict[str, str]]]:
        """
        根据Excel数据生成INI数据
        
        Args:
            excel_data: Excel数据，格式为 {sheet_name: {data...}}
            file_path: Excel文件路径，用于错误信息
            
        Returns:
            Dict: 生成的INI数据，格式为 {object_type: {id: {field: value}}}
        """
        result = {}

        # 检查是否是白泽框架下的表格文件:table
        is_baize_table = "table" in FileUtils.get_file_name(file_path).lower()

        for metadata in excel_data:
            sheet_name = metadata["sheet_name"]
            excel_table: ExcelTable = metadata["excel_table"]
            keys = excel_table.get_keys()  # 第二行作为key值

            # 判断物编类型
            # object_type = War3IniParser.detect_ini_type(sheet_name)

            # 白泽框架下特殊处理，只处理名为unit、ability、item的sheet
            if is_baize_table and sheet_name.lower() in ("unit", "ability",
                                                         "item"):
                object_type = sheet_name.lower()

                # 根据物编类型调用相应的处理函数
                if object_type == "unit":
                    self._process_baize_unit(excel_table, keys, file_path,
                                             sheet_name, result)
                elif object_type == "ability":
                    self._process_baize_ability(excel_table, keys, file_path,
                                                sheet_name, result)
                elif object_type == "item":
                    self._process_baize_item(excel_table, keys, file_path,
                                             sheet_name, result)

            # 通用处理：包含id和_parent的表格
            elif "id" in keys and "_parent" in keys:
                self._process_general_object(excel_table, keys, file_path,
                                             sheet_name, result)
        # 这涉及到Python中函数参数传递的机制。在Python中，字典是可变对象。当将一个字典作为参数传递给函数时，函数内部对字典的修改（例如，添加新的键值对，修改现有键的值）会直接影响到函数外部的原始字典对象。
        return result

    def _process_general_object(self, excel_table: ExcelTable,
                                header_indices: Dict[str, int], file_path: str,
                                sheet_name: str,
                                result: Dict[str, Dict[str, Dict[str, str]]]):
        """
        处理通用物编对象
        
        Args:
            excel_table: 表格数据
            header_indices: 表头索引映射
            file_path: 文件路径
            sheet_name: Sheet名称
            result: 结果字典
        """
        id_idx = header_indices["id"]
        parent_idx = header_indices["_parent"]

        for row_idx, row in enumerate(excel_table.data[2:], 2):  # 从第三行开始是数据
            if row_idx >= len(excel_table.data) or id_idx >= len(
                    row) or parent_idx >= len(row):
                continue

            obj_id = row[id_idx]
            parent = row[parent_idx]

            if not obj_id or not parent:
                continue

            # 根据parent判断物编类型
            parent_str = str(parent).lower()
            obj_type = None
            for ini_type in [
                    "unit", "ability", "item", "buff", "upgrade",
                    "destructable", "doodad"
            ]:
                if ini_type in parent_str:
                    obj_type = ini_type
                    break

            if not obj_type:
                continue

            # 确保对象类型存在于结果字典中
            if obj_type not in result:
                result[obj_type] = {}

            # 创建对象字典
            obj_dict = {"_parent": self.format_ini_value(parent)}

            # 添加其他字段
            for header, idx in header_indices.items():
                if header not in ["id", "_parent"] and idx < len(row):
                    # 检查是否是编辑器支持的字段
                    field_matched = False
                    if obj_type in self.dict_editor_info_map:
                        for field in self.dict_editor_info_map[obj_type]:
                            if header.lower() == field.lower():
                                field_matched = True

                                # 特殊字段处理
                                if field.lower(
                                ) == "cool1" and row[idx] is not None:
                                    obj_dict[field] = self.format_ini_value(
                                        float(row[idx]) / 100)
                                elif field.lower() == "acquire":
                                    if row[idx] == 0:
                                        obj_dict["acquire"] = "0"
                                        obj_dict["weapsOn"] = "0"
                                    else:
                                        obj_dict[
                                            "acquire"] = self.format_ini_value(
                                                row[idx])
                                        obj_dict["weapsOn"] = "1"
                                elif field.lower() in ["model", "file"]:
                                    obj_dict["file"] = self.format_ini_value(
                                        row[idx])
                                else:
                                    obj_dict[field] = self.format_ini_value(
                                        row[idx])
                                break

                    # 如果未匹配到编辑器字段，也添加到对象字典
                    if not field_matched and row[idx] is not None:
                        obj_dict[header] = self.format_ini_value(row[idx])

            # 添加到结果字典
            formatted_id = self.format_ini_value(obj_id).strip('"')  # 去掉双引号

            # 记录ID来源信息（用于全局冲突检测）
            if file_path not in self.id_sources:
                self.id_sources[file_path] = {}
            if sheet_name not in self.id_sources[file_path]:
                self.id_sources[file_path][sheet_name] = []
            self.id_sources[file_path][sheet_name].append(
                (formatted_id, row_idx + 1))

            # 记录全局已使用ID（用于冲突报告）
            if formatted_id not in self.all_used_ids:
                self.all_used_ids[formatted_id] = []
            self.all_used_ids[formatted_id].append(
                (file_path, sheet_name, row_idx + 1))

            result[obj_type][formatted_id] = obj_dict

    def _process_baize_unit(self, excel_table: ExcelTable, keys: List[str],
                            file_path: str, sheet_name: str,
                            result: Dict[str, Dict[str, Dict[str, str]]]):
        """
        处理白泽框架下的单位表格
        
        Args:
            excel_table: 表格数据
            keys: 表头索引映射
            file_path: 文件路径
            sheet_name: Sheet名称
            result: 结果字典
        """
        if "unit" not in result:
            result["unit"] = {}

        unit_template = self.dict_ini_template.get("基础单位模版", {})
        if not unit_template:
            self.logger.error("未找到基础单位模版")
            return

        # 从第三行开始处理数据行
        for row_idx, row in enumerate(excel_table.data[2:], 2):
            if row_idx >= excel_table.shape()[0]:
                break

            # 基础单位ID: "A"+n，n从4开始
            unit_count = len(result["unit"]) + 4
            unit_id_num = self.decimal_to_base62(unit_count)
            unit_id = f"A{unit_id_num.zfill(3)}"

            # 创建单位字典，复制模板
            unit_dict = unit_template.copy()

            # 根据表头填充字段
            for col_idx, key in enumerate(keys):
                # 获取单元格的值
                value = excel_table.get_value(row_idx, col_idx)
                if ExcelTable.custom_notna(value):
                    # 检查是否匹配编辑器字段
                    for map_dict in self.dict_editor_info_map.get("unit", {}):
                        # 检查是否匹配编辑器字段
                        key_map = None
                        if key in map_dict:
                            key_map = key
                        else:
                            for key1 in map_dict.keys():
                                if key.lower() == key1.lower():
                                    key_map = key1
                                    break
                        if key_map:
                            # 特殊字段处理
                            # 攻击速度
                            if key_map.lower() == "cool1":
                                unit_dict[key_map] = value
                            # 主动攻击范围
                            elif key_map.lower() == "acquire":
                                if value == 0:
                                    unit_dict["acquire"] = 0
                                    unit_dict["weapsOn"] = 0  #不能攻击
                                else:
                                    unit_dict["acquire"] = value
                                    unit_dict["weapsOn"] = 1
                            # 模型和文件
                            elif key_map.lower() in ("model", "file"):
                                unit_dict["file"] = value
                            else:
                                unit_dict[key_map] = value

            # 添加单位ID映射
            name = excel_table.get_value(row_idx, 0)  # 名字在第一列
            self.unit_id_map[name] = unit_id

            # 添加到结果字典
            result["unit"][unit_id] = unit_dict

            # 记录ID来源信息（用于全局冲突检测）
            if file_path not in self.id_sources:
                self.id_sources[file_path] = {}
            if sheet_name not in self.id_sources[file_path]:
                self.id_sources[file_path][sheet_name] = []
            self.id_sources[file_path][sheet_name].append(
                (unit_id, row_idx + 1))

            # 记录全局已使用ID（用于冲突报告）
            if unit_id not in self.all_used_ids:
                self.all_used_ids[unit_id] = []
            self.all_used_ids[unit_id].append(
                (file_path, sheet_name, row_idx + 1))

        # 生成瞭望塔模版
        self._generate_lookout_towers(result)

    def _generate_lookout_towers(self,
                                 result: Dict[str, Dict[str, Dict[str, str]]]):
        """
        生成瞭望塔模版
        
        Args:
            result: 结果字典
        """
        tower_template = self.dict_ini_template.get("瞭望塔模版", {})
        if not tower_template:
            self.logger.error("未找到瞭望塔模版")
            return

        for m in range(1, 5):
            tower_id = f"jzd{m}"

            # 创建瞭望塔字典，复制模板
            tower_dict = tower_template.copy()
            tower_dict["id"] = self.format_ini_value(tower_id)

            # 记录ID来源信息（用于全局冲突检测）
            file_path = "generated"
            sheet_name = "lookout_towers"
            row_idx = m

            if file_path not in self.id_sources:
                self.id_sources[file_path] = {}
            if sheet_name not in self.id_sources[file_path]:
                self.id_sources[file_path][sheet_name] = []
            self.id_sources[file_path][sheet_name].append((tower_id, row_idx))

            # 记录全局已使用ID（用于冲突报告）
            if tower_id not in self.all_used_ids:
                self.all_used_ids[tower_id] = []
            self.all_used_ids[tower_id].append(
                (file_path, sheet_name, row_idx))

            # 添加到结果字典
            result["unit"][tower_id] = tower_dict

    def _process_baize_ability(self, excel_table: ExcelTable,
                               header_indices: Dict[str, int], file_path: str,
                               sheet_name: str,
                               result: Dict[str, Dict[str, Dict[str, str]]]):
        """
        处理白泽框架下的技能表格
        
        Args:
            excel_table: 表格数据
            header_indices: 表头索引映射
            file_path: 文件路径
            sheet_name: Sheet名称
            result: 结果字典
        """
        if "ability" not in result:
            result["ability"] = {}

        # 生成基础技能
        self._generate_basic_abilities(result)

        # 生成建造技能
        self._generate_build_abilities(result)

        # 生成移动技能
        self._generate_move_ability(result)

        # 生成物品栏技能
        self._generate_inventory_abilities(result)

    def _generate_basic_abilities(self, result: Dict[str, Dict[str,
                                                               Dict[str,
                                                                    str]]]):
        """
        生成基础技能
        
        Args:
            result: 结果字典
        """
        template = self.dict_ini_template.get("基础技能模版", {})
        if not template:
            self.logger.error("未找到基础技能模版")
            return

        # 技能类型: 无目标/单位目标/点目标
        ability_types = [{
            "prefix": "X",
            "DataB": "0",
            "DataC": "1",
            "targs": None
        }, {
            "prefix":
            "Y",
            "DataB":
            "1",
            "DataC":
            "1",
            "targs":
            '"notself,ground,structure,air,ward,item,self"'
        }, {
            "prefix":
            "Z",
            "DataB":
            "3",
            "DataC":
            "1",
            "targs":
            '"notself,ground,structure,air,ward,item,self"'
        }]

        # 每个玩家12*3个技能，对应12个技能位置，每个位置有3个技能
        ability_count = 0

        for p in range(self.player_count):  # 玩家序号
            for y in range(3):  # 按钮位置y: 0-2
                for x in range(4):  # 按钮位置x: 0-3
                    for ability_type in ability_types:
                        # 计算基础命令ID索引
                        n = ability_count % len(self.tuple_base_orderid)
                        ability_count += 1

                        # 生成技能ID: X/Y/Z + p + x + y
                        ability_id = f"{ability_type['prefix']}{p}{x}{y}"

                        # 创建技能字典，复制模板
                        ability_dict = template.copy()

                        # 设置基本属性
                        ability_dict["DataB"] = ability_type["DataB"]
                        ability_dict["DataC"] = ability_type["DataC"]
                        if ability_type["targs"]:
                            ability_dict["targs"] = ability_type["targs"]

                        # 设置命令相关属性
                        ability_dict["Order"] = self.format_ini_value(
                            self.tuple_base_orderid[n])
                        ability_dict["DataF"] = str(n)
                        ability_dict["Buttonpos_1"] = str(x)
                        ability_dict["Buttonpos_2"] = str(y)
                        ability_dict["Name"] = self.format_ini_value(
                            f"{p}+{x}+{y}")

                        # 记录ID来源信息（用于全局冲突检测）
                        file_path = "generated"
                        sheet_name = "basic_abilities"
                        row_idx = p * 36 + y * 12 + x * 3 + ability_types.index(
                            ability_type) + 1

                        if file_path not in self.id_sources:
                            self.id_sources[file_path] = {}
                        if sheet_name not in self.id_sources[file_path]:
                            self.id_sources[file_path][sheet_name] = []
                        self.id_sources[file_path][sheet_name].append(
                            (ability_id, row_idx))

                        # 记录全局已使用ID（用于冲突报告）
                        if ability_id not in self.all_used_ids:
                            self.all_used_ids[ability_id] = []
                        self.all_used_ids[ability_id].append(
                            (file_path, sheet_name, row_idx))

                        # 添加到结果字典
                        result["ability"][ability_id] = ability_dict

    def _generate_build_abilities(self, result: Dict[str, Dict[str,
                                                               Dict[str,
                                                                    str]]]):
        """
        生成建造技能
        
        Args:
            result: 结果字典
        """
        template = self.dict_ini_template.get("建造技能模版", {})
        if not template:
            self.logger.error("未找到建造技能模版")
            return

        for m in range(1, 5):
            ability_id = f"JZT{m}"

            # 创建技能字典，复制模板
            ability_dict = template.copy()

            # 设置属性
            ability_dict["id"] = self.format_ini_value(ability_id)
            ability_dict["_parent"] = '"AIbt"'  # 建造技能
            ability_dict["Buttonpos_1"] = str(m - 1)  # 按钮位置x: 0-3
            ability_dict["UnitID"] = self.format_ini_value(
                f"jzd{m}")  # 创建指定瞭望塔

            # 记录ID来源信息（用于全局冲突检测）
            file_path = "generated"
            sheet_name = "build_abilities"
            row_idx = m

            if file_path not in self.id_sources:
                self.id_sources[file_path] = {}
            if sheet_name not in self.id_sources[file_path]:
                self.id_sources[file_path][sheet_name] = []
            self.id_sources[file_path][sheet_name].append(
                (ability_id, row_idx))

            # 记录全局已使用ID（用于冲突报告）
            if ability_id not in self.all_used_ids:
                self.all_used_ids[ability_id] = []
            self.all_used_ids[ability_id].append(
                (file_path, sheet_name, row_idx))

            # 添加到结果字典
            result["ability"][ability_id] = ability_dict

    def _generate_move_ability(self, result: Dict[str, Dict[str, Dict[str,
                                                                      str]]]):
        """
        生成移动技能
        
        Args:
            result: 结果字典
        """
        template = self.dict_ini_template.get("移动技能模版", {})
        if not template:
            self.logger.error("未找到移动技能模版")
            return

        ability_id = "move"

        # 创建技能字典，复制模板
        ability_dict = template.copy()

        # 记录ID来源信息（用于全局冲突检测）
        file_path = "generated"
        sheet_name = "move_ability"
        row_idx = 1

        if file_path not in self.id_sources:
            self.id_sources[file_path] = {}
        if sheet_name not in self.id_sources[file_path]:
            self.id_sources[file_path][sheet_name] = []
        self.id_sources[file_path][sheet_name].append((ability_id, row_idx))

        # 记录全局已使用ID（用于冲突报告）
        if ability_id not in self.all_used_ids:
            self.all_used_ids[ability_id] = []
        self.all_used_ids[ability_id].append((file_path, sheet_name, row_idx))

        # 添加到结果字典
        result["ability"][ability_id] = ability_dict

    def _generate_inventory_abilities(self,
                                      result: Dict[str, Dict[str, Dict[str,
                                                                       str]]]):
        """
        生成物品栏技能
        
        Args:
            result: 结果字典
        """
        template = self.dict_ini_template.get("物品栏技能模版", {})
        if not template:
            self.logger.error("未找到物品栏技能模版")
            return

        for m in range(1, 7):
            ability_id = f"WPL{m}"

            # 创建技能字典，复制模板
            ability_dict = template.copy()

            # 设置属性
            ability_dict["id"] = self.format_ini_value(ability_id)
            ability_dict["DataA"] = str(m)  # 数据A，施法持续时间

            # 记录ID来源信息（用于全局冲突检测）
            file_path = "generated"
            sheet_name = "inventory_abilities"
            row_idx = m

            if file_path not in self.id_sources:
                self.id_sources[file_path] = {}
            if sheet_name not in self.id_sources[file_path]:
                self.id_sources[file_path][sheet_name] = []
            self.id_sources[file_path][sheet_name].append(
                (ability_id, row_idx))

            # 记录全局已使用ID（用于冲突报告）
            if ability_id not in self.all_used_ids:
                self.all_used_ids[ability_id] = []
            self.all_used_ids[ability_id].append(
                (file_path, sheet_name, row_idx))

            # 添加到结果字典
            result["ability"][ability_id] = ability_dict

    def _process_baize_item(self, excel_table: ExcelTable,
                            header_indices: Dict[str, int], file_path: str,
                            sheet_name: str,
                            result: Dict[str, Dict[str, Dict[str, str]]]):
        """
        处理白泽框架下的物品表格
        
        Args:
            excel_table: 表格数据
            header_indices: 表头索引映射
            file_path: 文件路径
            sheet_name: Sheet名称
            result: 结果字典
        """
        if "item" not in result:
            result["item"] = {}

        if "ability" not in result:
            result["ability"] = {}

        item_template = self.dict_ini_template.get("基础物品模版", {})
        ability_template = self.dict_ini_template.get("物品技能模版", {})

        if not item_template:
            self.logger.error("未找到基础物品模版")
            return

        if not ability_template:
            self.logger.error("未找到物品技能模版")
            return

        # 获取使用方式和使用范围列的索引
        way_idx = header_indices.get("way", header_indices.get("使用方式", -1))
        range_idx = header_indices.get("range", header_indices.get("使用范围", -1))
        distance_idx = header_indices.get("distance",
                                          header_indices.get("使用距离", -1))

        # 从第三行开始处理数据行
        for row_idx, row in enumerate(excel_table.data[2:], 2):
            if row_idx >= len(excel_table.data):
                continue

            # 基础物品ID: "I"+n转62进制，不足3位补0
            item_count = len(result["item"]) + 4
            item_id_num = self.decimal_to_base62(item_count)
            item_id = f"I{item_id_num.zfill(3)}"

            # 物品技能ID: "A"+n转62进制，不足3位补0
            ability_id_num = self.decimal_to_base62(item_count)
            ability_id = f"A{ability_id_num.zfill(3)}"

            # 创建物品字典，复制模板
            item_dict = item_template.copy()

            # 设置物品的abilList为对应的物品技能ID
            item_dict["abilList"] = self.format_ini_value(ability_id)

            # 根据表头填充物品字段
            for header, idx in header_indices.items():
                if idx < len(row) and ExcelTable.custom_notna(row[idx]):
                    # 检查是否匹配编辑器字段
                    for field in self.dict_editor_info_map.get("item", []):
                        if header.lower() == field.lower():
                            # 特殊字段处理
                            if field.lower() in ["model", "file"]:
                                item_dict["file"] = self.format_ini_value(
                                    row[idx])
                            else:
                                item_dict[field] = self.format_ini_value(
                                    row[idx])

            # 记录ID来源信息（用于全局冲突检测）
            if file_path not in self.id_sources:
                self.id_sources[file_path] = {}
            if sheet_name not in self.id_sources[file_path]:
                self.id_sources[file_path][sheet_name] = []
            self.id_sources[file_path][sheet_name].append(
                (item_id, row_idx + 1))

            # 记录全局已使用ID（用于冲突报告）
            if item_id not in self.all_used_ids:
                self.all_used_ids[item_id] = []
            self.all_used_ids[item_id].append(
                (file_path, sheet_name, row_idx + 1))

            # 添加物品ID映射
            name = item_dict.get("Name", "").strip('"')
            if name:
                self.item_id_map[name] = item_id

            # 添加到结果字典
            result["item"][item_id] = item_dict

            # 处理物品技能
            if way_idx >= 0 and way_idx < len(row):
                way = str(row[way_idx]).strip() if ExcelTable.custom_notna(
                    row[way_idx]) else "无"

                # 无方式，不需要物品技能
                if way == "无":
                    continue

                # 创建物品技能字典，复制模板
                ability_dict = ability_template.copy()

                # 根据使用方式设置物品技能属性
                if way == "无目标":
                    ability_dict["DataB"] = "0"
                elif way == "点":
                    range_value = row[
                        range_idx] if range_idx >= 0 and range_idx < len(
                            row) and ExcelTable.custom_notna(
                                row[range_idx]) else 0
                    if range_value == 0:
                        ability_dict["DataC"] = "1"
                    else:
                        ability_dict["DataC"] = "3"  # 目标选取图像
                elif way == "单位":
                    ability_dict["DataB"] = "1"
                    ability_dict["DataC"] = "1"
                elif way == "建造":
                    ability_dict["abilList"] = '"JZT1"'  # 使用建造技能

                # 设置命令相关属性
                n = item_count % len(self.tuple_base_orderid)
                ability_dict["Order"] = self.format_ini_value(
                    self.tuple_base_orderid[n])
                ability_dict["DataF"] = str(n)

                # 设置使用距离和范围
                if distance_idx >= 0 and distance_idx < len(
                        row) and ExcelTable.custom_notna(row[distance_idx]):
                    ability_dict["Rng"] = self.format_ini_value(
                        row[distance_idx])

                if range_idx >= 0 and range_idx < len(
                        row) and ExcelTable.custom_notna(row[range_idx]):
                    ability_dict["Area"] = self.format_ini_value(
                        row[range_idx])

                # 记录ID来源信息（用于全局冲突检测）
                if file_path not in self.id_sources:
                    self.id_sources[file_path] = {}
                if sheet_name not in self.id_sources[file_path]:
                    self.id_sources[file_path][sheet_name] = []
                self.id_sources[file_path][sheet_name].append(
                    (ability_id, row_idx + 1))

                # 记录全局已使用ID（用于冲突报告）
                if ability_id not in self.all_used_ids:
                    self.all_used_ids[ability_id] = []
                self.all_used_ids[ability_id].append(
                    (file_path, sheet_name, row_idx + 1))

                # 添加物品技能ID映射
                if name:
                    self.item_abil_map[name] = ability_id

                # 添加到结果字典
                result["ability"][ability_id] = ability_dict

    def merge_ini_data(
        self, ini_data: Dict[str, Dict[str, Dict[str, str]]]
    ) -> Dict[str, Dict[str, Dict[str, str]]]:
        """
        合并INI数据
        
        Args:
            ini_data: 新的INI数据
            
        Returns:
            Dict: 合并后的INI数据
        """
        for obj_type, sections in ini_data.items():
            if obj_type not in self.ini_data:
                self.ini_data[obj_type] = {}

            for section_id, fields in sections.items():
                # 检查是否已存在同ID的section
                if section_id in self.ini_data[obj_type]:
                    source = self.data_sources.get(f"{obj_type}_{section_id}",
                                                   ("未知", "未知", 0))
                    existing_source = self.data_sources.get(
                        f"{obj_type}_{section_id}", ("未知", "未知", 0))
                    self.error_messages.append(
                        f"ID冲突: {obj_type} - {section_id} 在文件 {source[0]} 的 {source[1]} 表第 {source[2]} 行与"
                        f"文件 {existing_source[0]} 的 {existing_source[1]} 表第 {existing_source[2]} 行冲突"
                    )
                    continue

                # 添加新的section
                self.ini_data[obj_type][section_id] = fields

        return self.ini_data

    def save_ini_files(self, output_dir: str) -> None:
        """
        保存INI文件
        
        Args:
            output_dir: 输出目录
        """
        try:
            # 确保输出目录存在
            os.makedirs(output_dir, exist_ok=True)

            # 保存每种物编类型的INI文件
            for obj_type, sections in self.ini_data.items():
                ini_path = os.path.join(output_dir, f"{obj_type}.ini")

                with open(ini_path, 'w', encoding='utf-8') as f:
                    for section_id, fields in sections.items():
                        f.write(f"[{section_id}]\n")
                        for field, value in fields.items():
                            f.write(f"{field}={value}\n")
                        f.write("\n")

                self.logger.info(f"已生成INI文件: {ini_path}")

            # 如果有指定ini_output_path，复制生成的INI文件
            if self.ini_output_path:
                self._copy_ini_files(output_dir, self.ini_output_path)
        except Exception as e:
            self.logger.error(f"保存INI文件失败: {str(e)}\n{traceback.format_exc()}")

    def _copy_ini_files(self, src_dir: str, dst_dir: str) -> None:
        """
        复制INI文件到指定目录
        
        Args:
            src_dir: 源目录
            dst_dir: 目标目录
        """
        try:
            # 确保目标目录存在
            os.makedirs(dst_dir, exist_ok=True)

            # 复制INI文件
            for obj_type in self.ini_data.keys():
                src_path = os.path.join(src_dir, f"{obj_type}.ini")
                dst_path = os.path.join(dst_dir, f"{obj_type}.ini")

                if os.path.exists(src_path):
                    shutil.copy2(src_path, dst_path)
                    self.logger.info(f"已复制INI文件到: {dst_path}")
        except Exception as e:
            self.logger.error(f"复制INI文件失败: {str(e)}\n{traceback.format_exc()}")

    def generate_ts_mapping_files(self, output_dir: str) -> None:
        """
        生成TypeScript映射文件
        
        Args:
            output_dir: 输出目录
        """
        try:
            # 确保输出目录存在
            os.makedirs(output_dir, exist_ok=True)

            # 生成unitid.ts
            if self.unit_id_map:
                unit_ts_path = os.path.join(output_dir, "unitid.ts")
                with open(unit_ts_path, 'w', encoding='utf-8') as f:
                    f.write("/** 单位ID映射 */\n")
                    f.write("export const UnitId = {\n")
                    for name, unit_id in sorted(self.unit_id_map.items()):
                        f.write(f"    {name}: '{unit_id}',\n")
                    f.write("} as const;\n")

                self.logger.info(f"已生成TypeScript映射文件: {unit_ts_path}")

            # 生成itemid.ts
            if self.item_id_map:
                item_ts_path = os.path.join(output_dir, "itemid.ts")
                with open(item_ts_path, 'w', encoding='utf-8') as f:
                    f.write("/** 物品ID映射 */\n")
                    f.write("export const ItemId = {\n")
                    for name, item_id in sorted(self.item_id_map.items()):
                        f.write(f"    {name}: '{item_id}',\n")
                    f.write("} as const;\n")

                self.logger.info(f"已生成TypeScript映射文件: {item_ts_path}")

            # 生成itemabil.ts
            if self.item_abil_map:
                item_abil_ts_path = os.path.join(output_dir, "itemabil.ts")
                with open(item_abil_ts_path, 'w', encoding='utf-8') as f:
                    f.write("/** 物品技能ID映射 */\n")
                    f.write("export const ItemAbilId = {\n")
                    for name, ability_id in sorted(self.item_abil_map.items()):
                        f.write(f"    {name}: '{ability_id}',\n")
                    f.write("} as const;\n")

                self.logger.info(f"已生成TypeScript映射文件: {item_abil_ts_path}")
        except Exception as e:
            self.logger.error(
                f"生成TypeScript映射文件失败: {str(e)}\n{traceback.format_exc()}")

    def process_excel_to_ini(self, excel_data: Dict[str, Dict[str, Any]],
                             file_path: str) -> None:
        """
        处理Excel数据并生成INI文件
        
        Args:
            excel_data: Excel数据
            file_path: Excel文件路径
        """
        try:
            # 生成INI数据
            ini_data = self.generate_ini_from_excel(excel_data, file_path)

            # 合并INI数据
            self.merge_ini_data(ini_data)
        except Exception as e:
            self.logger.error(
                f"处理Excel数据失败: {str(e)}\n{traceback.format_exc()}")

    def finish_processing(self, output_dir: str) -> List[str]:
        """
        完成处理并生成所有文件
        
        Args:
            output_dir: 输出目录
            
        Returns:
            List[str]: 错误信息列表
        """
        try:
            # 保存INI文件
            ini_output_dir = os.path.join(output_dir, "ini")
            self.save_ini_files(ini_output_dir)

            # 生成TypeScript映射文件
            ts_output_dir = os.path.join(output_dir, "ts")
            self.generate_ts_mapping_files(ts_output_dir)

            # 返回错误信息
            return self.error_messages
        except Exception as e:
            self.logger.error(f"完成处理失败: {str(e)}\n{traceback.format_exc()}")
            self.error_messages.append(f"处理过程中发生错误: {str(e)}")
            return self.error_messages
