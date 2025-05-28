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
import concurrent.futures
import uuid
from threading import Lock
from typing import Dict, List, Any, Tuple, Optional, Set, Union
from configparser import ConfigParser
from pathlib import Path
from datetime import datetime
import sys

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
        # 白泽框架
        self.baize_frame = config_manager.get("baize_frame", True)
        # 获取玩家数量，默认为5
        self.player_count = int(config_manager.get("player_count", 5))
        # 获取多线程配置
        self.thread_count = int(config_manager.get("thread_count", 0))
        # 如果未指定或设为0，则使用CPU核心数+4的线程数（但最大不超过32）
        if self.thread_count <= 0:
            import os
            self.thread_count = min(32,
                                    os.cpu_count() +
                                    4) if os.cpu_count() else 4

        # INI输出路径 - 用于将生成的INI文件额外复制到指定目录，非必填
        self.ini_output_path = config_manager.get("ini_output", "")

        # 初始化错误信息列表
        self.error_messages = []

        # 加载编辑器信息映射
        self.dict_editor_info_map = ProjectInfo.dict_editor_info_map

        # 加载editor_info_map.json
        self.dict_editor_info_json_map = ProjectInfo.dict_editor_info_json_map

        # 加载模板文件
        self.dict_ini_template = ProjectInfo.dict_ini_template

        # 加载基础命令ID元表
        self.tuple_base_orderid = ProjectInfo.tuple_base_orderid

        # 存储所有物编表格路径
        self.list_excel_table_path = []

        # 记录是否已经生成模版物编
        self.template_ini = False

        # 初始化生成的INI数据字典
        self.ini_data = {}

        # 初始化TS映射数据
        self.unit_id_map = {}  # 单位ID映射
        self.item_id_map = {}  # 物品ID映射
        self.item_abil_map = {}  # 物品技能ID映射

        # 所有已使用的ID，用于检查冲突，格式：{id: [(file_path, sheet_name, row_idx), ...]}
        self.all_used_ids = {}

        # 添加线程锁保护共享数据
        self.ini_data_lock = Lock()
        self.map_lock = Lock()
        self.ids_lock = Lock()
        self.list_lock = Lock()

        # 创建父类ID前缀与对象类型的映射
        self.parent_prefixes = {}
        for obj_type, prefixes in OBJECT_TYPE_MAPPING.items():
            for prefix in prefixes:
                self.parent_prefixes[prefix] = obj_type

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

    def excel_to_inidata(self, excel_data: Dict[str, Any],
                         file_path: str) -> None:
        """
        根据Excel数据并汇总到INI数据

        Args:
            excel_data: Excel数据，格式为 {sheet_name: {data...}}
            file_path: Excel文件路径，用于错误信息
        """
        # 检查是否是白泽框架下的表格文件:table
        is_baize_table = "table" in FileUtils.get_file_name(file_path).lower()

        # 需要添加到list_excel_table_path的表格路径
        local_table_paths = []
        # 本地处理的INI数据
        local_ini_data = {}
        for type in OBJECT_TYPE_MAPPING.keys():
            local_ini_data[type] = {}

        for metadata in excel_data:
            sheet_name = metadata["sheet_name"]
            excel_table: ExcelTable = metadata["excel_table"]
            keys = excel_table.get_keys()  # 第二行作为key值

            # 判断物编类型
            object_type = War3IniParser.detect_ini_type(sheet_name)

            # 是否物编表格
            is_object_table = False

            # 白泽框架下特殊处理，只处理名为unit、ability、item的sheet
            if self.baize_frame and is_baize_table and sheet_name.lower() in (
                    "unit", "ability", "item"):
                is_object_table = True

                # 根据物编类型调用相应的处理函数
                if object_type == "unit":
                    self._process_baize_unit(excel_table, keys, file_path,
                                             sheet_name, local_ini_data)
                elif object_type == "ability":
                    self._process_baize_ability(excel_table, keys, file_path,
                                                sheet_name, local_ini_data)
                elif object_type == "item":
                    self._process_baize_item(excel_table, keys, file_path,
                                             sheet_name, local_ini_data)

                # 白泽框架下，只生成一次模版物编
                need_template = False
                with self.ini_data_lock:
                    if not self.template_ini:
                        self.template_ini = True
                        need_template = True

                # 生成模版物编，白泽框架下
                if need_template:
                    template = [
                        ("瞭望塔模版-没有模型", "unit"),
                        ("马甲单位模版", "unit"),
                        ("移动技能模版", "ability"),
                    ]
                    for template_name, type1 in template:
                        self._generate_template_object(template_name, type1,
                                                       local_ini_data)

            # 通用处理：包含id和_parent的表格
            elif "id" in keys and "_parent" in keys:
                is_object_table = True
                self._process_general_object(excel_table, keys, file_path,
                                             sheet_name, local_ini_data)

            if is_object_table:
                local_table_paths.append((file_path, sheet_name))

        # 一次性更新全局数据结构，减少锁的持有时间
        if local_table_paths:
            with self.list_lock:
                self.list_excel_table_path.extend(local_table_paths)

        # 合并本地INI数据到全局数据
        if any(data for data in local_ini_data.values()):
            with self.ini_data_lock:
                for type_key, type_data in local_ini_data.items():
                    if type_data:  # 只处理非空数据
                        if type_key not in self.ini_data:
                            self.ini_data[type_key] = {}
                        # 更新数据
                        self.ini_data[type_key].update(type_data)

    def _generate_template_object(self,
                                  template_name: str,
                                  object_type: str,
                                  local_ini_data: Optional[Dict] = None):
        """
        生成模版物编

        Args:
            template_name: 模版名称
            object_type: 物编类型
            local_ini_data: 可选的本地INI数据字典，用于减少锁竞争
        """
        template = self.dict_ini_template.get(template_name, {})
        if not template:
            self.logger.error(f"未找到物编模版{template_name}")
            return

        dict = template.copy()
        id = dict["id"]
        file_path = "generated"
        sheet_name = f"{template_name}"
        row_idx = 0

        # 使用锁保护共享数据
        with self.ids_lock:
            if id not in self.all_used_ids:
                self.all_used_ids[id] = []
            self.all_used_ids[id].append((file_path, sheet_name, row_idx))

        # 添加到结果字典
        if local_ini_data is not None:
            # 添加到本地数据，不需要锁
            if object_type not in local_ini_data:
                local_ini_data[object_type] = {}
            local_ini_data[object_type][id] = dict
        else:
            # 添加到全局数据，需要锁保护
            with self.ini_data_lock:
                if object_type not in self.ini_data:
                    self.ini_data[object_type] = {}
                self.ini_data[object_type][id] = dict

    def _process_baize_unit(self, excel_table: ExcelTable, keys: List[str],
                            file_path: str, sheet_name: str,
                            local_ini_data: Dict):
        """
        处理白泽框架下的单位表格

        Args:
            excel_table: 表格数据
            keys: 表头索引映射
            file_path: 文件路径
            sheet_name: Sheet名称
            local_ini_data: 本地INI数据字典
        """
        # 确保ini_data中unit键存在
        if "unit" not in self.ini_data:
            self.ini_data["unit"] = {}

        # 确保local_ini_data中unit键存在
        if "unit" not in local_ini_data:
            local_ini_data["unit"] = {}

        unit_template = self.dict_ini_template.get("基础单位模版", {})
        if not unit_template:
            self.logger.error("未找到单位模版")
            return

        # 从第三行开始处理数据行
        for row_idx in range(2, excel_table.shape()[0]):
            # 在每行的循环内部计算当前单位数量和ID
            with self.ini_data_lock:
                # 获取当前单位数量，用于生成唯一递增的ID
                unit_count = len(self.ini_data["unit"]) + 4
                unit_id_num = self.decimal_to_base62(unit_count)
                unit_id = f"h{unit_id_num.zfill(3)}"

            # 创建单位字典，复制模板
            unit_dict = unit_template.copy()

            # 根据表头填充字段
            for col_idx, key in enumerate(keys):
                # 获取单元格的值
                value = excel_table.get_value(row_idx, col_idx)
                if ExcelTable.custom_notna(value):
                    # 检查是否匹配编辑器字段
                    map_dict = self.dict_editor_info_map.get("unit", {})
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
                                unit_dict["weapsOn"] = 0  # 不能攻击
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
            # 去除颜色码
            if isinstance(name, str):
                # 使用正则表达式移除|cXXXXXXXX颜色码和|r结束标记
                name = re.sub(r"\|c[0-9a-fA-F]{8}|\|r", "", name)

            # 使用锁保护共享数据
            with self.map_lock:
                self.unit_id_map[name] = unit_id

            # 添加到结果字典
            with self.ini_data_lock:
                if "unit" not in self.ini_data:
                    self.ini_data["unit"] = {}
                self.ini_data["unit"][unit_id] = unit_dict

            # 记录全局已使用ID（用于冲突报告）
            with self.ids_lock:
                if unit_id not in self.all_used_ids:
                    self.all_used_ids[unit_id] = []
                self.all_used_ids[unit_id].append(
                    (file_path, sheet_name, row_idx + 1))

        # 生成瞭望塔模版
        self._generate_lookout_towers()

    def _generate_lookout_towers(self):
        """
        生成瞭望塔模版
        """
        tower_template = self.dict_ini_template.get("瞭望塔模版", {})
        if not tower_template:
            self.logger.error("未找到瞭望塔模版")
            return

        for m in range(1, 5):
            tower_id = f"jzd{m}"

            # 创建瞭望塔字典，复制模板
            tower_dict = tower_template.copy()
            tower_dict["id"] = tower_id

            # 记录全局已使用ID（用于冲突报告）
            file_path = "generated"
            sheet_name = "瞭望塔模版"
            row_idx = m

            with self.ids_lock:
                if tower_id not in self.all_used_ids:
                    self.all_used_ids[tower_id] = []
                self.all_used_ids[tower_id].append(
                    (file_path, sheet_name, row_idx))

            # 添加到结果字典
            with self.ini_data_lock:
                if "unit" not in self.ini_data:
                    self.ini_data["unit"] = {}
                self.ini_data["unit"][tower_id] = tower_dict

    def _process_baize_ability(self, excel_table: ExcelTable, keys: List[str],
                               file_path: str, sheet_name: str,
                               local_ini_data: Dict):
        """
        处理白泽框架下的技能表格

        Args:
            excel_table: 表格数据
            keys: 表头索引映射
            file_path: 文件路径
            sheet_name: Sheet名称
            local_ini_data: 本地INI数据字典
        """

        # 生成基础技能
        self._generate_basic_abilities(local_ini_data)

        # 生成建造技能
        self._generate_build_abilities(local_ini_data)

        # 生成物品栏技能
        self._generate_inventory_abilities(local_ini_data)

    def _generate_basic_abilities(self, local_ini_data: Dict):
        """
        生成基础技能
        """
        template = self.dict_ini_template.get("基础技能模版", {})
        if not template:
            self.logger.error("未找到基础技能模版")
            return

        # 技能类型: 无目标/单位目标/点目标
        ability_types = [
            {
                "prefix": "X",
                "DataB": "0",
                "DataC": "1",
                "targs": None
            },
            {
                "prefix": "Y",
                "DataB": "1",
                "DataC": "1",
                "targs": '"notself,ground,structure,air,ward,item,self"'
            },
            {
                "prefix": "Z",
                "DataB": "3",
                "DataC": "1",
                "targs": '"notself,ground,structure,air,ward,item,self"'
            },
        ]

        # 每个玩家12*3个技能，对应12个技能位置，每个位置有3个技能
        i = 0

        for p in range(self.player_count):  # 玩家序号
            for y in range(3):  # 按钮位置y: 0-2
                for x in range(4):  # 按钮位置x: 0-3
                    for ability_type in ability_types:
                        # 计算基础命令ID索引
                        n = i % len(self.tuple_base_orderid)

                        # 生成技能ID: X/Y/Z + p + x + y
                        ability_id = f"{ability_type['prefix']}{p}{x}{y}"

                        # 创建技能字典，复制模板
                        ability_dict = template.copy()

                        # 设置基本属性
                        ability_dict["DataB"] = ability_type[
                            "DataB"]  # 数据——目标类型DataB1
                        ability_dict["DataC"] = ability_type[
                            "DataC"]  # 数据——选项DataC1
                        if ability_type["targs"]:
                            ability_dict["targs"] = ability_type[
                                "targs"]  # 目标允许类型

                        # 设置命令相关属性
                        ability_dict["Order"] = self.tuple_base_orderid[
                            n]  # 命令串
                        ability_dict["DataF"] = self.tuple_base_orderid[
                            n]  # 基础命令 id
                        ability_dict["Buttonpos_1"] = x  # 按钮位置 x:0-3
                        ability_dict["Buttonpos_2"] = y  # 按钮位置 y:0-2
                        ability_dict["Name"] = f"{p}+{x}+{y}"

                        # 记录全局已使用ID（用于冲突报告）
                        file_path = "generated"
                        sheet_name = "基础技能模版"
                        row_idx = i + 1

                        with self.ids_lock:
                            if ability_id not in self.all_used_ids:
                                self.all_used_ids[ability_id] = []
                            self.all_used_ids[ability_id].append(
                                (file_path, sheet_name, row_idx))

                        # 添加到结果字典
                        with self.ini_data_lock:
                            if "ability" not in self.ini_data:
                                self.ini_data["ability"] = {}
                            self.ini_data["ability"][ability_id] = ability_dict

                        i += 1

    def _generate_build_abilities(self, local_ini_data: Dict):
        """
        生成建造技能
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
            ability_dict["id"] = ability_id
            ability_dict["_parent"] = '"AIbt"'  # 建造技能
            ability_dict["Buttonpos_1"] = m - 1  # 按钮位置x: 0-3
            ability_dict["UnitID"] = f"jzd{m}"  # 创建指定瞭望塔

            # 记录全局已使用ID（用于冲突报告）
            file_path = "generated"
            sheet_name = "建造技能模版"
            row_idx = m

            with self.ids_lock:
                if ability_id not in self.all_used_ids:
                    self.all_used_ids[ability_id] = []
                self.all_used_ids[ability_id].append(
                    (file_path, sheet_name, row_idx))

            # 添加到结果字典
            with self.ini_data_lock:
                if "ability" not in self.ini_data:
                    self.ini_data["ability"] = {}
                self.ini_data["ability"][ability_id] = ability_dict

    def _generate_inventory_abilities(self, local_ini_data: Dict):
        """
        生成物品栏技能
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
            ability_dict["id"] = ability_id
            ability_dict["DataA"] = m  # 数据A，施法持续时间

            # 记录全局已使用ID（用于冲突报告）
            file_path = "generated"
            sheet_name = "物品栏技能模版"
            row_idx = m

            with self.ids_lock:
                if ability_id not in self.all_used_ids:
                    self.all_used_ids[ability_id] = []
                self.all_used_ids[ability_id].append(
                    (file_path, sheet_name, row_idx))

            # 添加到结果字典
            with self.ini_data_lock:
                if "ability" not in self.ini_data:
                    self.ini_data["ability"] = {}
                self.ini_data["ability"][ability_id] = ability_dict

    def _process_baize_item(self, excel_table: ExcelTable, keys: List[str],
                            file_path: str, sheet_name: str,
                            local_ini_data: Dict):
        """
        处理白泽框架下的物品表格
        
        Args:
            excel_table: 表格数据
            keys: 表头索引映射
            file_path: 文件路径
            sheet_name: Sheet名称
            local_ini_data: 本地INI数据字典
        """
        # 确保ini_data中item键存在
        if "item" not in self.ini_data:
            self.ini_data["item"] = {}

        # 确保local_ini_data中item键存在
        if "item" not in local_ini_data:
            local_ini_data["item"] = {}

        # 获取物品模板和技能模板
        item_template = self.dict_ini_template.get("基础物品模版", {})
        ability_template = self.dict_ini_template.get("物品技能模版", {})

        if not item_template:
            self.logger.error("未找到基础物品模版")
            return

        if not ability_template:
            self.logger.error("未找到物品技能模版")
            return

        # 从第三行开始处理数据行
        for row_idx in range(2, excel_table.shape()[0]):
            # 在每行循环内计算当前物品数量和ID
            with self.ini_data_lock:
                # 获取物品数量，用于生成ID
                item_count = len(self.ini_data["item"]) + 4
                id_num = self.decimal_to_base62(item_count)
                item_id = f"I{id_num.zfill(3)}"

                # 物品技能ID: "A"+n转62进制，不足3位补0
                ability_id = f"A{id_num.zfill(3)}"

            # 创建物品字典，复制模板
            item_dict = item_template.copy()

            # 设置物品的abilList为对应的物品技能ID
            item_dict["abilList"] = ability_id

            # 根据表头填充物品字段
            for col_idx, key in enumerate(keys):
                # 获取单元格的值
                value = excel_table.get_value(row_idx, col_idx)
                if ExcelTable.custom_notna(value):
                    # 检查是否匹配编辑器字段
                    map_dict = self.dict_editor_info_map.get("item", [])
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
                        if key_map.lower() in ["model", "file"]:
                            item_dict["file"] = value
                        else:
                            item_dict[key_map] = value

            # 添加物品ID映射
            name = excel_table.get_value(row_idx, 0)  # 名字在第一列
            # 去除颜色码
            if isinstance(name, str):
                # 使用正则表达式移除|cXXXXXXXX颜色码和|r结束标记
                name = re.sub(r"\|c[0-9a-fA-F]{8}|\|r", "", name)

            with self.map_lock:
                self.item_id_map[name] = item_id

            # 记录全局已使用ID（用于冲突报告）
            with self.ids_lock:
                if item_id not in self.all_used_ids:
                    self.all_used_ids[item_id] = []
                self.all_used_ids[item_id].append(
                    (file_path, sheet_name, row_idx + 1))

            # 处理物品技能
            way = excel_table.get_value_by_key(row_idx, "使用方式")
            range_value = excel_table.get_value_by_key(row_idx, "使用范围")
            distance_value = excel_table.get_value_by_key(row_idx, "使用距离")
            # 无方式，不需要物品技能
            if way == "无":
                # 添加物品到结果字典，但不添加技能
                with self.ini_data_lock:
                    if "item" not in self.ini_data:
                        self.ini_data["item"] = {}
                    self.ini_data["item"][item_id] = item_dict
                continue

            # 创建物品技能字典，复制模板
            ability_dict = ability_template.copy()

            # 根据使用方式设置物品技能属性
            if way == "无目标":
                ability_dict["DataB"] = "0"  # 目标类型：无
            elif way == "点":
                ability_dict["DataB"] = "3"  # 目标类型：点/单位
                if range_value == 0:
                    ability_dict["DataC"] = "1"  # 图标可见
                else:
                    ability_dict["DataC"] = "3"  # 目标选取图像
            elif way == "单位":
                ability_dict["DataB"] = "1"  # 目标类型：单位
                ability_dict["DataC"] = "1"  # 图标可见
            elif way == "建造":
                item_dict["abilList"] = '"JZT1"'  # 使用建造技能

            # 设置命令相关属性
            with self.ini_data_lock:
                n = item_count % len(self.tuple_base_orderid)
                ability_dict["Order"] = self.tuple_base_orderid[n]  # 命令串
                ability_dict["DataF"] = self.tuple_base_orderid[n]  # 基础命令 id

            # 设置使用距离和范围
            ability_dict["Rng"] = distance_value  # 使用距离
            ability_dict["Area"] = range_value  # 使用范围

            # 记录全局已使用ID（用于冲突报告）
            with self.ids_lock:
                if ability_id not in self.all_used_ids:
                    self.all_used_ids[ability_id] = []
                self.all_used_ids[ability_id].append(
                    (file_path, sheet_name, row_idx + 1))

            # 添加物品技能ID映射
            if name:
                with self.map_lock:
                    self.item_abil_map[name] = ability_id

            # 添加物品技能到结果字典
            with self.ini_data_lock:
                if "ability" not in self.ini_data:
                    self.ini_data["ability"] = {}
                self.ini_data["ability"][ability_id] = ability_dict

            # 添加物品到结果字典（这里确保在设置完abilList后再添加）
            with self.ini_data_lock:
                if "item" not in self.ini_data:
                    self.ini_data["item"] = {}
                self.ini_data["item"][item_id] = item_dict

    def _process_general_object(self, excel_table: ExcelTable, keys: List[str],
                                file_path: str, sheet_name: str,
                                local_ini_data: Dict):
        """
        处理通用物编对象数据

        Args:
            excel_table: Excel表数据
            keys: 表头键值列表
            file_path: Excel文件路径
            sheet_name: 工作表名称
            local_ini_data: 本地ini数据对象
        """
        # 获取对象类型 (unit, item, ability 等)
        object_type = None

        # 从键名列表中识别物编类型
        for obj_type, obj_name in OBJECT_TYPE_MAPPING.items():
            if sheet_name.lower() in obj_name:
                object_type = obj_type
                break

        if not object_type:
            # 如果表名不包含类型，尝试从表格内容推断
            if "id" in keys and "_parent" in keys:
                # 检查第一行的parent值，从中识别类型
                for row_idx in range(2, excel_table.shape()[0]):
                    # 使用正确的方法获取单元格值
                    if "id" in excel_table.data.columns and "_parent" in excel_table.data.columns:
                        id_val = excel_table.data.iloc[row_idx]["id"]
                        parent_val = excel_table.data.iloc[row_idx]["_parent"]
                        if ExcelTable.custom_notna(parent_val):
                            # 应用父类ID前缀识别
                            for prefix, obj_type in self.parent_prefixes.items(
                            ):
                                # 确保parent_val是字符串类型
                                if isinstance(parent_val, list) and parent_val:
                                    parent_str = str(parent_val[0])
                                elif isinstance(parent_val, str):
                                    parent_str = parent_val
                                else:
                                    parent_str = str(parent_val)

                                if parent_str.startswith(prefix):
                                    object_type = obj_type
                                    break
                            if object_type:
                                break

        # 如果仍无法确定类型，无法处理
        if not object_type:
            self.logger.warning(f"无法确定物编类型: {file_path} - {sheet_name}")
            return

        if object_type not in local_ini_data:
            local_ini_data[object_type] = {}

        if object_type not in self.ini_data:
            self.ini_data[object_type] = {}

        # 从第三行开始处理数据行
        for row_idx in range(2, excel_table.shape()[0]):
            try:
                # 使用正确的方法获取id值
                if "id" in excel_table.data.columns:
                    id = excel_table.data.iloc[row_idx]["id"]
                else:
                    self.logger.warning(
                        f"缺少必要的id列: {file_path} - {sheet_name}")
                    continue

                # 检查ID是否有效
                if ExcelTable.custom_isna(id) or str(id).strip() == "":
                    continue

                # 创建对象字典
                obj_dict = {}

                # 遍历所有列
                for key in keys:
                    # 跳过ID列，已经处理过
                    if key == "id":
                        continue

                    # 使用正确的方法获取单元格值
                    if key in excel_table.data.columns:
                        value = excel_table.data.iloc[row_idx][key]
                    else:
                        continue

                    # 跳过空值
                    if ExcelTable.custom_isna(value) or str(
                            value).strip() == "":
                        continue

                    # 处理字段值
                    # 转换字段名: 将TypeScript命名转换为War3物编命名
                    field_name = key
                    # 获取字段的类型
                    field_info = self.dict_editor_info_map.get(
                        object_type, {}).get(key)
                    type_str = "string"
                    # 如果在editor_info_map中找到了字段信息
                    if field_info:
                        # 确保field_info是字典类型，防止调用get方法出错
                        if isinstance(field_info, dict):
                            field_type = field_info.get("type")
                            if field_type:
                                # 1: 字符串, 0: 整数
                                type_str = "string" if field_type == 1 else "int"
                        elif isinstance(field_info, str):
                            # 如果field_info是字符串，可能是注释而不是类型信息
                            type_str = "string"

                    # 格式化值
                    formatted_value = self.format_ini_value(type_str, value)
                    obj_dict[field_name] = formatted_value

                # 记录id到映射表
                if object_type == "unit":
                    # 提取单位名称或定义指定的key作为单位名
                    unit_name = None
                    if "EditorName" in obj_dict:
                        unit_name = obj_dict["EditorName"]
                    elif "name" in obj_dict:
                        unit_name = obj_dict["name"]
                    elif "Name" in obj_dict:
                        unit_name = obj_dict["Name"]

                    # 只处理有名称的单位
                    if unit_name and isinstance(unit_name, str):
                        # 去掉引号
                        unit_name = unit_name.strip('"')
                        with self.map_lock:
                            if unit_name not in self.unit_id_map:
                                self.unit_id_map[unit_name] = id

                # 检查id冲突
                with self.ids_lock:
                    if id not in self.all_used_ids:
                        self.all_used_ids[id] = []
                    self.all_used_ids[id].append(
                        (file_path, sheet_name, row_idx))

                # 添加到结果字典
                local_ini_data[object_type][id] = obj_dict

            except Exception as e:
                self.logger.error(f"处理通用物编对象时出错: {str(e)}")

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
                if sections:
                    ini_path = os.path.join(output_dir, f"{obj_type}.ini")

                    with open(ini_path, "w", encoding="utf-8") as f:
                        for section_id, fields in sections.items():
                            f.write(f"[{section_id}]\n")
                            for key, value in fields.items():
                                # 注释
                                comment = self.dict_editor_info_map.get(
                                    obj_type, {}).get(key, {})
                                if comment:
                                    f.write(f"# {comment}\n")
                                # 键值对
                                f.write(f"{key}={value}\n")
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

    def _check_global_id_conflicts(self) -> None:
        """
        检查全局ID冲突，将所有冲突信息添加到错误消息列表
        所有物编ID在War3中是全局唯一的，不能重复
        """
        # 遍历所有记录的ID
        for obj_id, sources in self.all_used_ids.items():
            # 如果某个ID出现多次，则生成冲突报告
            if len(sources) > 1:
                # 构建详细的冲突信息
                conflict_msg = f"ID冲突: '{obj_id}' 在以下位置重复使用:\n"

                for source in sources:
                    file_path, sheet_name, row_idx = source
                    conflict_msg += f"  - [文件]: {file_path}, [表]: {sheet_name}, [行]: {row_idx}\n"

                # 添加到错误消息列表
                self.error_messages.append(conflict_msg)

    def generate_conflict_markdown(self, output_dir: str) -> str:
        """
        生成物编ID冲突的Markdown报告文件
        
        Args:
            output_dir: 输出目录
            
        Returns:
            str: 生成的报告文件路径，如果没有冲突则返回空字符串
        """
        try:
            # 检查是否有冲突
            if not self.error_messages:
                return ""

            # 确保输出目录存在
            os.makedirs(output_dir, exist_ok=True)

            # 创建Markdown文件，使用规范化路径
            report_path = os.path.normpath(
                os.path.join(output_dir, "物编ID冲突详情.md"))

            # 解析冲突数据，按ID分组整理
            conflict_data = {}
            for error in self.error_messages:
                if "ID冲突" not in error:
                    continue

                lines = error.split("\n")
                if len(lines) < 2:
                    continue

                id_line = lines[0]  # "ID冲突: 'h004' 在以下位置重复使用:"
                try:
                    obj_id = id_line.split("'")[1]  # 提取ID值
                except IndexError:
                    continue

                sources = []
                for i in range(1, len(lines)):
                    line = lines[i].strip()
                    if not line or not line.startswith("-"):
                        continue

                    parts = line.strip("-").strip().split(", ")
                    if len(parts) >= 3:
                        file_path = parts[0].replace("[文件]: ", "")
                        sheet_name = parts[1].replace("[表]: ", "")
                        row_idx = parts[2].replace("[行]: ", "")
                        sources.append({
                            "file_path": file_path,
                            "sheet_name": sheet_name,
                            "row_idx": row_idx
                        })

                if sources:
                    conflict_data[obj_id] = sources

            with open(report_path, "w", encoding="utf-8") as f:
                # 写入标题和概述
                f.write("# 物编ID冲突报告\n\n")
                f.write(
                    f"生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n"
                )

                # 统计并显示冲突数量
                conflict_count = len(conflict_data)
                f.write(f"## 共发现 {conflict_count} 个ID冲突\n\n")
                f.write("**警告：物编ID在游戏中必须唯一，重复的ID会导致物编覆盖或冲突！**\n\n")

                # 生成冲突ID列表（便于快速查看）
                f.write("## 冲突ID列表\n\n")
                f.write("| 序号 | 冲突ID | 冲突次数 | 涉及表格 |\n")
                f.write("|------|--------|----------|----------|\n")

                for idx, (obj_id,
                          sources) in enumerate(sorted(conflict_data.items()),
                                                1):
                    tables = set(f"{s['sheet_name']}" for s in sources)
                    tables_str = ", ".join(tables)
                    f.write(
                        f"| {idx} | **{obj_id}** | {len(sources)} | {tables_str} |\n"
                    )

                # 详细冲突信息
                f.write("\n## 冲突详情\n\n")

                for idx, (obj_id,
                          sources) in enumerate(sorted(conflict_data.items()),
                                                1):
                    f.write(f"### {idx}. ID: `{obj_id}`\n\n")
                    f.write("| 位置 | 文件 | 表格 | 行号 |\n")
                    f.write("|------|------|------|------|\n")

                    for pos, source in enumerate(sources, 1):
                        # 获取文件的基本名称，避免路径太长
                        file_name = os.path.basename(source["file_path"])
                        f.write(
                            f"| {pos} | {file_name} | {source['sheet_name']} | {source['row_idx']} |\n"
                        )

                    f.write("\n")

                # 添加解决建议
                f.write("## 解决方案建议\n\n")
                f.write("1. 修改Excel中的重复ID，确保每个物编使用唯一的ID\n")
                f.write("2. 对于自动生成的ID，检查生成逻辑，避免ID重复\n")
                f.write("3. 如果使用模板，确保模板中的ID已更新为唯一值\n")
                f.write("4. 使用物编前检查ID是否已存在于其他物编表格中\n\n")

                f.write("**注意**: 请务必解决所有ID冲突，否则可能导致游戏中的物编行为异常！\n")

            self.logger.info(f"已生成物编ID冲突报告: {report_path}")
            return report_path

        except Exception as e:
            self.logger.error(
                f"生成物编ID冲突报告失败: {str(e)}\n{traceback.format_exc()}")
            return ""

    def finish_processing(self, output_dir: str) -> List[str]:
        """
        完成处理并生成所有文件

        Args:
            output_dir: 输出目录

        Returns:
            List[str]: 错误信息列表
        """
        try:
            # 格式化所有值，并且删掉key=id的键值对，因为加载模版时会自动添加
            with self.ini_data_lock:
                for object_type, dict1 in self.ini_data.items():
                    for id, dict2 in dict1.items():
                        # 先遍历处理非id键值对
                        keys_to_process = list(dict2.keys())  # 创建键的列表进行迭代
                        for key in keys_to_process:
                            if key == "id":  # 跳过id键
                                continue
                            value = dict2[key]
                            type_info = self.dict_editor_info_json_map.get(
                                object_type, {}).get(key, {})
                            value_type = type_info.get("type")
                            if (not value_type) and key == "_parent":
                                value_type = "string"
                            if value_type:  # 确保类型存在
                                formatted_value = self.format_ini_value(
                                    value_type, value)
                                self.ini_data[object_type][id][
                                    key] = formatted_value
                            else:
                                pass

                        # 循环结束后，再安全地删除id键（如果存在）
                        if "id" in self.ini_data[object_type][id]:
                            del self.ini_data[object_type][id]["id"]

            # 打印所有物编表格路径
            with self.list_lock:
                len_list_excel_table_path = len(self.list_excel_table_path)
                if len_list_excel_table_path > 0:
                    i = 1
                    for file_path, sheet_name in self.list_excel_table_path:
                        self.logger.info(
                            f"物编表格{i}. excel路径: {file_path}, 表名: {sheet_name}")
                        i += 1
                else:
                    self.logger.warning("没有发现物编表格")
                    return

            # 先检查全局ID冲突
            self._check_global_id_conflicts()

            # 如果有错误，返回错误信息
            if self.error_messages:
                self.logger.warning(f"处理过程中发现 {len(self.error_messages)} 个错误")
                for error in self.error_messages:
                    self.logger.warning(error)

            # 保存INI文件
            ini_output_dir = os.path.join(output_dir, "ini")
            self.save_ini_files(ini_output_dir)

            # 生成TypeScript映射文件，使用多线程
            ts_output_dir = os.path.join(output_dir, "ts")
            self.generate_ts_mapping_files_parallel(ts_output_dir)

            # 生成物编ID冲突的Markdown报告
            conflict_markdown_path = self.generate_conflict_markdown(
                output_dir)

            # 返回错误信息
            return self.error_messages
        except Exception as e:
            self.logger.error(f"完成处理失败: {str(e)}\n{traceback.format_exc()}")
            self.error_messages.append(f"处理过程中发生错误: {str(e)}")
            return self.error_messages

    def format_ini_value(self, type: str, value: Any) -> str:
        """
        格式化INI值，确保字符串有双引号

        Args:
            key:键值
            value: 原始值

        Returns:
            str: 格式化后的值
        """
        if value is None:
            return '""'

        if type == "int":
            return value

        elif type == "float":
            return value

        elif type == "string":
            # 确保value是字符串类型
            value1 = str(value)
            if (value1.startswith("{")
                    and value1.endswith("}")) or (value1.startswith("[=[")
                                                  and value1.endswith("]=]")):
                # war3物编特殊格式，直接返回
                return value
            else:
                # 普通字符串：带双引号
                value1 = value1.strip('"')
                return f'"{value1}"'

        return value

    def _generate_ts_mapping_file(self, output_dir: str, map_type: str,
                                  name: str, data_map: Dict[str, str]) -> None:
        """
        生成单个TypeScript映射文件
        
        Args:
            output_dir: 输出目录
            map_type: 映射类型标识
            name: 变量名
            data_map: 数据字典
        """
        try:
            # 确保输出目录存在
            os.makedirs(output_dir, exist_ok=True)

            # 创建唯一临时文件名
            unique_id = str(uuid.uuid4())[:8]
            temp_path = os.path.join(output_dir,
                                     f"temp_{map_type}_{unique_id}.ts")
            final_path = os.path.join(output_dir, f"{map_type}.ts")

            # 写入临时文件
            with open(temp_path, "w", encoding="utf-8") as f:
                f.write(f"/** {name}映射 */\n")
                f.write(f"export const {name} = {{\n")
                for key, value in sorted(data_map.items()):
                    f.write(f"    '{key}': '{value}',\n")
                    f.write(f"    '{value}': '{key}',\n")
                f.write("} as const;\n")

            # 安全重命名为最终文件
            if os.path.exists(final_path):
                os.remove(final_path)
            os.rename(temp_path, final_path)

            self.logger.info(f"已生成TypeScript映射文件: {final_path}")
        except Exception as e:
            self.logger.error(f"生成TypeScript映射文件 {map_type} 失败: {str(e)}")

    def generate_ts_mapping_files_parallel(self, output_dir: str) -> None:
        """
        并行生成所有TypeScript映射文件
        
        Args:
            output_dir: 输出目录
        """
        try:
            # 创建不同的映射任务
            tasks = []

            # 单位映射
            if self.unit_id_map:
                # 拷贝映射以避免数据竞争
                with self.map_lock:
                    unit_map_copy = self.unit_id_map.copy()
                tasks.append(("unitid", "UnitId", unit_map_copy))

            # 物品映射
            if self.item_id_map:
                with self.map_lock:
                    item_map_copy = self.item_id_map.copy()
                tasks.append(("itemid", "ItemId", item_map_copy))

            # 物品技能映射
            if self.item_abil_map:
                with self.map_lock:
                    item_abil_map_copy = self.item_abil_map.copy()
                tasks.append(("itemabil", "ItemAbilId", item_abil_map_copy))

            # 如果没有任务，直接返回
            if not tasks:
                return

            # 使用线程池并行生成文件
            with concurrent.futures.ThreadPoolExecutor(max_workers=min(
                    len(tasks), self.thread_count)) as executor:
                futures = []
                for map_type, name, data_map in tasks:
                    future = executor.submit(self._generate_ts_mapping_file,
                                             output_dir, map_type, name,
                                             data_map)
                    futures.append(future)

                # 等待所有任务完成并处理可能的异常
                for future in concurrent.futures.as_completed(futures):
                    try:
                        future.result()
                    except Exception as e:
                        self.logger.error(f"生成TypeScript映射文件时出错: {e}",
                                          exc_info=True)

        except Exception as e:
            self.logger.error(
                f"并行生成TypeScript映射文件失败: {str(e)}\n{traceback.format_exc()}")

    # 保留旧的顺序生成方法作为备份
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
            with self.map_lock:
                if self.unit_id_map:
                    unit_ts_path = os.path.join(output_dir, "unitid.ts")
                    with open(unit_ts_path, "w", encoding="utf-8") as f:
                        f.write("/** 单位ID映射 */\n")
                        f.write("export const UnitId = {\n")
                        for name, unit_id in sorted(self.unit_id_map.items()):
                            f.write(f"    '{name}': '{unit_id}',\n")
                            f.write(f"    '{unit_id}': '{name}',\n")
                        f.write("} as const;\n")

                    self.logger.info(f"已生成TypeScript映射文件: {unit_ts_path}")

            # 生成itemid.ts
            with self.map_lock:
                if self.item_id_map:
                    item_ts_path = os.path.join(output_dir, "itemid.ts")
                    with open(item_ts_path, "w", encoding="utf-8") as f:
                        f.write("/** 物品ID映射 */\n")
                        f.write("export const ItemId = {\n")
                        for name, item_id in sorted(self.item_id_map.items()):
                            f.write(f"    '{name}': '{item_id}',\n")
                            f.write(f"    '{item_id}': '{name}',\n")
                        f.write("} as const;\n")

                    self.logger.info(f"已生成TypeScript映射文件: {item_ts_path}")

            # 生成itemabil.ts
            with self.map_lock:
                if self.item_abil_map:
                    item_abil_ts_path = os.path.join(output_dir, "itemabil.ts")
                    with open(item_abil_ts_path, "w", encoding="utf-8") as f:
                        f.write("/** 物品技能ID映射 */\n")
                        f.write("export const ItemAbilId = {\n")
                        for name, ability_id in sorted(
                                self.item_abil_map.items()):
                            f.write(f"    '{name}': '{ability_id}',\n")
                            f.write(f"    '{ability_id}': '{name}',\n")
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
            # 汇总INI数据，直接更新self.ini_data
            # 在线程安全的环境中处理数据汇总
            self.excel_to_inidata(excel_data, file_path)
        except Exception as e:
            self.logger.error(
                f"处理Excel数据失败: {str(e)}\n{traceback.format_exc()}")
