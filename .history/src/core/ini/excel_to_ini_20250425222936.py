# src/core/ini_generator.py
# Ini代码生成器模块
import configparser
import math
import os
import traceback
import logging
import pandas as pd
import shutil
from collections import defaultdict

# 设置日志记录器
# 假设日志系统已在别处配置好，这里直接获取logger实例
logger = logging.getLogger(__name__)


class Excel_to_ini:
    """
    将符合特定规则的Excel数据转换为War3 ini格式文件及TypeScript映射文件的核心类。
    """
    BASE62_CHARS = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    BASE = len(BASE62_CHARS)

    # 简化版的 Sheet 名称到 INI 类型的映射 (应与 ini_parser.py 保持一致或从外部传入)
    OBJECT_TYPE_MAPPING = {
        # 单位
        'unit': 'unit',
        'units': 'unit',
        '单位': 'unit',
        # 物品
        'item': 'item',
        'items': 'item',
        '物品': 'item',
        # 技能
        'ability': 'ability',
        'abilities': 'ability',
        '技能': 'ability',
        # 可破坏物
        'destructible': 'destructible',
        'destructibles': 'destructible',
        '可破坏物': 'destructible',
        # 装饰物
        'doodad': 'doodad',
        'doodads': 'doodad',
        '装饰物': 'doodad',
        # 升级
        'upgrade': 'upgrade',
        'upgrades': 'upgrade',
        '升级': 'upgrade',
        # Buff
        'buff': 'buff',
        'buffs': 'buff',
        '状态': 'buff',
    }
    # 白泽框架特定Sheet名称
    BAIZE_SHEET_MAP = {
        'unit': 'unit',
        'ability': 'ability',
        'item': 'item',
    }

    def __init__(self, config):
        """
        初始化Excel_to_ini转换器。

        Args:
            config (dict): 包含配置信息的字典。
        """
        self.config = config
        self.output_path = config.get('output_path', '.')
        self.ini_output_path = config.get('ini_output_path')
        self.num_players = int(config.get('num_players', 5))
        # 提供更健壮的默认路径查找逻辑
        resource_dir = config.get(
            'resource_path',
            os.path.join(os.path.dirname(__file__), '..', '..', 'resource',
                         'resource'))  # 假设 resource 在项目根目录下的 resource/resource
        logger.debug(f"推断的资源目录: {resource_dir}")

        self.template_ini_path = config.get(
            'template_ini_path',
            os.path.join(resource_dir, 'excel_to_ini',
                         'excel_to_ini_template.ini'))
        self.base_order_id_path = config.get(
            'base_order_id_path',
            os.path.join(resource_dir, 'excel_to_ini', '基础命令id.txt'))
        self.editor_info_map_path = config.get(
            'editor_info_map_path',
            os.path.join(resource_dir, 'editor_info_map.ini'))

        self.generated_ini_data = defaultdict(lambda: defaultdict(dict))
        self.ts_mapping_data = defaultdict(dict)
        self.errors = []
        self.id_counters = {'unit': 4, 'item': 4, 'item_ability': 0}

        self.ini_templates = self._load_ini_templates()
        self.base_order_ids = self._load_base_order_ids()
        self.editor_info_map = self._load_editor_info_map()

        logger.info("Excel_to_ini 初始化完成。")
        if not self.ini_templates:
            logger.error("INI模板加载失败，后续处理可能出错。")
        if not self.base_order_ids:
            logger.warning("基础命令ID文件加载失败或为空，依赖命令ID的功能将受影响。")
        if not self.editor_info_map:
            logger.warning("编辑器信息映射加载失败，字段有效性检查可能不准确。")

    def _load_ini_templates(self):
        """加载INI模板文件。"""
        templates = configparser.ConfigParser(interpolation=None)
        templates.optionxform = str
        try:
            if not os.path.exists(self.template_ini_path):
                raise FileNotFoundError(
                    f"INI模板文件未找到: {self.template_ini_path}")
            templates.read(self.template_ini_path, encoding='utf-8-sig')
            logger.info(f"成功加载INI模板: {self.template_ini_path}")
            return {
                section: dict(templates.items(section))
                for section in templates.sections()
            }
        except Exception as e:
            logger.error(
                f"加载INI模板时发生错误: {self.template_ini_path}\n{traceback.format_exc()}"
            )
            self.errors.append(f"错误：加载INI模板失败 - {e}")
            return {}

    def _load_base_order_ids(self):
        """加载基础命令ID列表。"""
        try:
            if not os.path.exists(self.base_order_id_path):
                raise FileNotFoundError(
                    f"基础命令ID文件未找到: {self.base_order_id_path}")
            with open(self.base_order_id_path, 'r', encoding='utf-8') as f:
                ids = [line.strip() for line in f if line.strip()]
            logger.info(f"成功加载 {len(ids)} 个基础命令ID: {self.base_order_id_path}")
            return ids
        except Exception as e:
            logger.error(
                f"加载基础命令ID时发生错误: {self.base_order_id_path}\n{traceback.format_exc()}"
            )
            self.errors.append(f"错误：加载基础命令ID失败 - {e}")
            return []

    def _load_editor_info_map(self):
        """加载编辑器信息映射文件，用于检查字段有效性。"""
        editor_map_parser = configparser.ConfigParser(interpolation=None)
        editor_map_parser.optionxform = str
        map_dict = {}
        try:
            if not os.path.exists(self.editor_info_map_path):
                raise FileNotFoundError(
                    f"编辑器信息映射文件未找到: {self.editor_info_map_path}")
            editor_map_parser.read(self.editor_info_map_path,
                                   encoding='utf-8-sig')
            logger.info(f"成功加载编辑器信息映射: {self.editor_info_map_path}")
            for section in editor_map_parser.sections():
                map_dict[section.lower()] = set(
                    key.lower() for key in editor_map_parser[section])
            return map_dict
        except Exception as e:
            logger.error(
                f"加载编辑器信息映射时发生错误: {self.editor_info_map_path}\n{traceback.format_exc()}"
            )
            self.errors.append(f"错误：加载编辑器信息映射失败 - {e}")
            return {}

    def _dec_to_base62(self, n, length=4):
        """将非负十进制整数转换为指定长度的62进制字符串，不足则在前面补'0'。"""
        if not isinstance(n, int) or n < 0:
            logger.error(f"无效输入进行62进制转换：需要非负整数，但得到 {n} (类型: {type(n)})")
            return '0' * length
        if n == 0:
            return '0' * length
        res = []
        temp_n = n
        while temp_n > 0:
            temp_n, rem = divmod(temp_n, self.BASE)
            res.append(self.BASE62_CHARS[rem])
        base62_str = "".join(reversed(res))
        padding_length = length - len(base62_str)
        if padding_length < 0:
            logger.warning(
                f"十进制数 {n} 转换为62进制 '{base62_str}' 后长度超过了目标长度 {length}。将返回原始超长字符串。"
            )
            return base62_str
        else:
            return '0' * padding_length + base62_str

    def _base62_to_dec(self, s):
        """将62进制字符串转换为十进制数。"""
        if not isinstance(s, str):
            logger.error(f"无效输入进行62进制转10进制：需要字符串，但得到 {s} (类型: {type(s)})")
            return None
        res = 0
        try:
            for char in s:
                if char not in self.BASE62_CHARS:
                    raise ValueError(f"无效的62进制字符: '{char}' in '{s}'")
                res = res * self.BASE + self.BASE62_CHARS.index(char)
            return res
        except ValueError as e:
            logger.error(f"无效的62进制字符串转换: {s} - {e}")
            return None

    def process(self, excel_files_data):
        """
        处理输入的Excel数据，生成INI和TS文件。

        Args:
            excel_files_data (dict): 结构为 {filepath: {sheetname: dataframe}} 的字典。
        """
        logger.info("开始处理Excel数据到INI...")
        if not self.ini_templates:
            logger.error("INI模板未加载，处理中止。")
            self.errors.append("致命错误：INI模板文件加载失败，无法继续处理。")
            return self.errors  # 返回错误信息

        total_sheets_processed = 0
        for file_path, sheets_data in excel_files_data.items():
            logger.info(f"处理文件: {file_path}")
            for sheet_name, sheet_df in sheets_data.items():
                if not isinstance(sheet_df, pd.DataFrame) or sheet_df.empty:
                    logger.warning(
                        f"文件 '{file_path}' 中的Sheet '{sheet_name}' 为空或无效，已跳过。")
                    continue

                logger.debug(f"  处理Sheet: {sheet_name}")
                try:
                    process_type, ini_type = self._identify_sheet(
                        file_path, sheet_name, sheet_df)

                    if process_type == 'baize':
                        logger.debug(f"    识别为白泽表格，类型: {ini_type}")
                        if ini_type == 'ability':
                            self._process_baize_ability(
                                file_path, sheet_name, sheet_df)
                        elif ini_type == 'unit':
                            self._process_baize_unit(file_path, sheet_name,
                                                     sheet_df)
                        elif ini_type == 'item':
                            self._process_baize_item(file_path, sheet_name,
                                                     sheet_df)
                        total_sheets_processed += 1
                    elif process_type == 'general':
                        logger.debug(f"    识别为通用物编表格，类型: {ini_type}")
                        self._process_general_sheet(file_path, sheet_name,
                                                    sheet_df, ini_type)
                        total_sheets_processed += 1
                    else:
                        logger.debug(f"    Sheet '{sheet_name}' 不符合转换规则，已跳过。")

                except Exception as e:
                    error_msg = f"处理文件 '{file_path}' 的Sheet '{sheet_name}' 时发生意外错误: {e}"
                    logger.error(f"{error_msg}\n{traceback.format_exc()}")
                    self.errors.append(f"错误：{error_msg} (详情请查看日志)")

        if total_sheets_processed > 0:
            logger.info("所有文件和Sheet处理完毕，开始写入输出文件...")
            self._write_output()
            self._generate_ts_mapping()
            logger.info("文件写入完成。")
        else:
            logger.info("没有找到符合转换规则的Sheet进行处理。")

        return self.errors  # 返回处理过程中的错误列表

    def _identify_sheet(self, file_path, sheet_name, sheet_df):
        """
        识别Sheet的处理类型（白泽/通用/忽略）和对应的INI类型。
        """
        file_basename = os.path.basename(file_path).lower()
        sheet_name_lower = sheet_name.lower()

        # 1. 检查白泽框架规则
        if file_basename == 'table.xlsx' or file_basename == 'table.xls':
            if sheet_name_lower in self.BAIZE_SHEET_MAP:
                return 'baize', self.BAIZE_SHEET_MAP[sheet_name_lower]

        # 2. 检查通用物编表格规则 (第二行key包含id和_parent)
        #    需要检查 DataFrame 是否至少有两行，并且列名符合要求
        if len(sheet_df.columns) > 1 and len(sheet_df) > 0:  # 至少要有key行和数据行
            # 假设第二行（索引为0）是 key 行
            # 需要处理 ExcelParser 读取时可能存在的 header 问题，这里假设 key 在 columns 里
            keys = set(str(col).lower() for col in sheet_df.columns)
            if 'id' in keys and '_parent' in keys:
                # 确定 ini_type
                ini_type = self.OBJECT_TYPE_MAPPING.get(sheet_name_lower)
                if ini_type:
                    return 'general', ini_type
                else:
                    logger.warning(
                        f"文件 '{file_path}' Sheet '{sheet_name}' 符合通用物编规则，但Sheet名称无法映射到已知INI类型，已忽略。"
                    )
                    return None, None  # 无法确定类型

        # 3. 根据 Sheet 名称判断是否是普通物编（非白泽，但名称能匹配）
        #    这种情况在通用规则中已经部分覆盖，但可以作为一种补充
        ini_type_from_name = self.OBJECT_TYPE_MAPPING.get(sheet_name_lower)
        if ini_type_from_name:
            # 这里需要更明确的规则来区分它和通用规则，暂时不启用，避免混淆
            # logger.debug(f"Sheet '{sheet_name}' 名称匹配到类型 '{ini_type_from_name}'，但未满足其他规则。")
            pass

        # 4. 不符合任何规则
        return None, None

    def _process_baize_ability(self, file_path, sheet_name, sheet_df):
        """处理白泽框架的 ability sheet。"""
        logger.info(f"  开始处理白泽 Ability Sheet: {sheet_name}")
        ini_type = 'ability'
        source_info_base = (file_path, sheet_name)

        # 1. 生成基础技能模板 (无目标/单位目标/点目标) * 玩家数量 * 12个位置
        base_template = self.ini_templates.get('基础技能模版')
        if not base_template:
            logger.error("未找到 '基础技能模版'，无法生成基础技能。")
            self.errors.append(
                f"错误：文件 '{file_path}' Sheet '{sheet_name}' 缺少 '基础技能模版'")
            return  # 无法继续

        order_id_index = 0
        for p in range(self.num_players):
            for y in range(3):  # 行
                for x in range(4):  # 列
                    for target_type_index, target_type in enumerate(
                        ['无目标', '单位目标', '点目标']):
                        section_data = base_template.copy()
                        section_id_prefix = ''
                        targs_value = ''  # 默认为空字符串

                        if target_type == '无目标':
                            section_data['DataB'] = '0'
                            section_data['DataC'] = '1'
                            section_id_prefix = 'X'
                        elif target_type == '单位目标':
                            section_data['DataB'] = '1'
                            section_data['DataC'] = '1'
                            targs_value = '"notself,ground,structure,air,ward,item,self"'  # 注意引号
                            section_data['targs'] = targs_value
                            section_id_prefix = 'Y'
                        elif target_type == '点目标':
                            section_data['DataB'] = '3'
                            section_data['DataC'] = '1'
                            targs_value = '"notself,ground,structure,air,ward,item,self"'  # 注意引号
                            section_data['targs'] = targs_value
                            section_id_prefix = 'Z'

                        # 生成ID: 前缀+玩家序号+列+行
                        section_id = f"{section_id_prefix}{p}{x}{y}"
                        section_name = f"{p}+{x}+{y}"  # 用于 TS 映射的名字

                        # 分配命令ID和设置相关字段
                        order_id = self._get_order_id(order_id_index)
                        section_data['Order'] = f'"{order_id}"'  # 命令串加引号
                        section_data['DataF'] = str(
                            order_id_index %
                            len(self.base_order_ids))  # 基础命令ID是数字
                        section_data['Buttonpos_1'] = str(x)
                        section_data['Buttonpos_2'] = str(y)
                        section_data['Name'] = f'"{section_name}"'  # 名称加引号

                        source_info = source_info_base + (
                            f"基础技能-{target_type}-P{p}-X{x}-Y{y}", )
                        self._add_section_data(ini_type, section_id,
                                               section_data, section_name,
                                               source_info)
                        order_id_index += 1

        # 2. 生成建造技能模板 (4个)
        build_template = self.ini_templates.get('建造技能模版')
        base_abil_parent = '"AIbt"'  # 建造技能父级
        if build_template:
            for m in range(1, 5):
                section_data = build_template.copy()
                section_id = f'"JZT{m}"'  # ID 加引号
                section_name = f"建造技能{m}"
                section_data['_parent'] = base_abil_parent  # 父级ID
                section_data['Buttonpos_1'] = str(m - 1)
                section_data['UnitID'] = f'"jzd{m}"'  # 创建单位ID加引号
                # Name 可能需要从模板或配置获取，这里用默认
                section_data['Name'] = f'"{section_name}"'

                source_info = source_info_base + (f"建造技能{m}", )
                self._add_section_data(ini_type, section_id, section_data,
                                       section_name, source_info)
        else:
            logger.warning("未找到 '建造技能模版'。")
            self.errors.append(
                f"警告：文件 '{file_path}' Sheet '{sheet_name}' 缺少 '建造技能模版'")

        # 3. 生成移动技能模板 (1个)
        move_template = self.ini_templates.get('移动技能模版')
        if move_template:
            section_data = move_template.copy()
            # 需要确定移动技能的固定 ID 和名称
            section_id = '"MOVE"'  # 假设 ID 为 MOVE
            section_name = "移动技能"
            section_data['Name'] = f'"{section_name}"'
            source_info = source_info_base + ("移动技能", )
            self._add_section_data(ini_type, section_id, section_data,
                                   section_name, source_info)
        else:
            logger.warning("未找到 '移动技能模版'。")
            self.errors.append(
                f"警告：文件 '{file_path}' Sheet '{sheet_name}' 缺少 '移动技能模版'")

        # 4. 生成物品栏技能模板 (6个)
        inventory_template = self.ini_templates.get('物品栏技能模版')
        if inventory_template:
            for m in range(1, 7):
                section_data = inventory_template.copy()
                section_id = f'"WPL{m}"'  # ID 加引号
                section_name = f"物品栏技能{m}"
                section_data['DataA'] = str(m)  # 数据A
                # Name 可能需要从模板或配置获取
                section_data['Name'] = f'"{section_name}"'

                source_info = source_info_base + (f"物品栏技能{m}", )
                self._add_section_data(ini_type, section_id, section_data,
                                       section_name, source_info)
        else:
            logger.warning("未找到 '物品栏技能模版'。")
            self.errors.append(
                f"警告：文件 '{file_path}' Sheet '{sheet_name}' 缺少 '物品栏技能模版'")

    def _process_baize_unit(self, file_path, sheet_name, sheet_df):
        """处理白泽框架的 unit sheet。"""
        logger.info(f"  开始处理白泽 Unit Sheet: {sheet_name}")
        ini_type = 'unit'
        source_info_base = (file_path, sheet_name)

        # 1. 处理基础单位 (来自 Excel 表格数据)
        base_template = self.ini_templates.get('基础单位模版')
        if not base_template:
            logger.error("未找到 '基础单位模版'，无法处理基础单位。")
            self.errors.append(
                f"错误：文件 '{file_path}' Sheet '{sheet_name}' 缺少 '基础单位模版'")
            # 可能不应该 return，因为还有瞭望塔等要处理
        else:
            # 假设数据从第二行开始 (索引 1)，第一行是 key (索引 0)
            # 需要确认 ExcelParser 如何处理 header，这里假设 DataFrame 的 columns 是 key
            keys = [str(col).lower() for col in sheet_df.columns]
            unit_keys = self.editor_info_map.get('unit', set())  # 获取unit允许的key

            for index, row in sheet_df.iterrows():
                # if index == 0: continue # 跳过 key 行 (如果 header=None 读取的话)

                section_data = base_template.copy()
                row_data = {}
                # 将 row 转为字典，key 转小写
                for key, value in row.items():
                    row_data[str(key).lower()] = value

                # 应用 Excel 数据
                section_name = None  # 需要确定Name字段来源
                for key_lower, value in row_data.items():
                    if pd.isna(value): continue  # 跳过空值

                    if key_lower == 'name':  # 假设 Name 列存在
                        section_name = str(value)

                    # 检查 key 是否在 unit 的允许范围内
                    if key_lower in unit_keys:
                        # 特殊字段处理
                        if key_lower == 'cool1':
                            try:
                                processed_value = float(value) / 100
                                section_data[
                                    'cool1'] = self._infer_and_format_value(
                                        processed_value)
                            except (ValueError, TypeError):
                                logger.warning(
                                    f"行 {index+2}: 字段 'cool1' 的值 '{value}' 无法转换为数字进行处理，已忽略。来源: {file_path} Sheet {sheet_name}"
                                )
                                self.errors.append(
                                    f"警告：行 {index+2} 字段 'cool1' 值无效 '{value}'。来源: {file_path}, {sheet_name}"
                                )
                        elif key_lower == 'collision':
                            section_data[
                                'collision'] = self._infer_and_format_value(
                                    value)
                        elif key_lower == 'scale':
                            section_data[
                                'scale'] = self._infer_and_format_value(value)
                        elif key_lower == 'spd':
                            section_data['spd'] = self._infer_and_format_value(
                                value)
                        elif key_lower == 'acquire':
                            try:
                                acquire_val = float(value)
                                if acquire_val == 0:
                                    section_data['acquire'] = '0'
                                    section_data['weapsOn'] = '0'
                                else:
                                    section_data[
                                        'acquire'] = self._infer_and_format_value(
                                            acquire_val)
                                    section_data['weapsOn'] = '1'
                            except (ValueError, TypeError):
                                logger.warning(
                                    f"行 {index+2}: 字段 'acquire' 的值 '{value}' 无法转换为数字进行处理，已忽略。来源: {file_path} Sheet {sheet_name}"
                                )
                                self.errors.append(
                                    f"警告：行 {index+2} 字段 'acquire' 值无效 '{value}'。来源: {file_path}, {sheet_name}"
                                )
                        elif key_lower == 'file' or key_lower == 'model':  # model 也映射到 file
                            section_data[
                                'file'] = self._infer_and_format_value(value)
                        else:
                            # 其他在允许范围内的 key 直接赋值
                            section_data[
                                key_lower] = self._infer_and_format_value(
                                    value)
                    # else:
                    # logger.debug(f"行 {index+2}: 字段 '{key_lower}' 不在 unit 允许的字段列表中，已忽略。")

                # 生成ID: h + 3位62进制数 (从4开始)
                section_id_dec = self.id_counters['unit']
                section_id = 'h' + self._dec_to_base62(section_id_dec, 3)
                self.id_counters['unit'] += 1

                if not section_name:
                    section_name = f"未知单位_{section_id}"  # 提供默认名字
                    logger.warning(
                        f"行 {index+2}: 未找到有效的'Name'字段，使用默认名称 '{section_name}'。来源: {file_path} Sheet {sheet_name}"
                    )
                    self.errors.append(
                        f"警告：行 {index+2} 缺少'Name'。来源: {file_path}, {sheet_name}"
                    )

                # 设置 Name (确保带引号)
                section_data['Name'] = self._infer_and_format_value(
                    section_name)

                source_info = source_info_base + (f"Row {index+2}",
                                                  )  # 假设Excel行号从2开始
                self._add_section_data(ini_type, section_id, section_data,
                                       section_name, source_info)

        # 2. 生成瞭望塔模板 (4个)
        tower_template = self.ini_templates.get('瞭望塔模版')
        if tower_template:
            for m in range(1, 5):
                section_data = tower_template.copy()
                section_id = f'jzd{m}'  # ID 不带引号? 确认需求
                section_name = f"瞭望塔{m}"
                # 应用模板，可能需要设置 Name
                section_data['Name'] = self._infer_and_format_value(
                    section_name)

                source_info = source_info_base + (f"瞭望塔{m}", )
                self._add_section_data(ini_type, section_id, section_data,
                                       section_name, source_info)
        else:
            logger.warning("未找到 '瞭望塔模版'。")
            self.errors.append(
                f"警告：文件 '{file_path}' Sheet '{sheet_name}' 缺少 '瞭望塔模版'")

        # 3. 生成瞭望塔模板-没有模型 (如果需要的话)
        tower_no_model_template = self.ini_templates.get('瞭望塔模版-没有模型')
        if tower_no_model_template:
            # 实现逻辑，类似上面
            pass
        # else:
        #      logger.debug("未找到 '瞭望塔模版-没有模型'。")

    def _process_baize_item(self, file_path, sheet_name, sheet_df):
        """处理白泽框架的 item sheet。"""
        logger.info(f"  开始处理白泽 Item Sheet: {sheet_name}")
        item_ini_type = 'item'
        abil_ini_type = 'ability'  # 物品技能也是 ability 类型
        source_info_base = (file_path, sheet_name)

        item_template = self.ini_templates.get('基础物品模版')
        abil_template = self.ini_templates.get('物品技能模版')

        if not item_template:
            logger.error("未找到 '基础物品模版'，无法处理基础物品。")
            self.errors.append(
                f"错误：文件 '{file_path}' Sheet '{sheet_name}' 缺少 '基础物品模版'")
            return
        if not abil_template:
            logger.warning("未找到 '物品技能模版'，生成的物品将没有对应的技能。")
            self.errors.append(
                f"警告：文件 '{file_path}' Sheet '{sheet_name}' 缺少 '物品技能模版'")
            # 不return，只生成物品

        keys = [str(col).lower() for col in sheet_df.columns]
        item_keys = self.editor_info_map.get('item', set())
        abil_keys = self.editor_info_map.get('ability',
                                             set())  # 物品技能也用ability字段
        order_id_item_index = 0  # 用于物品技能的命令ID

        for index, row in sheet_df.iterrows():
            item_section_data = item_template.copy()
            abil_section_data = abil_template.copy() if abil_template else None
            row_data = {
                str(k).lower(): v
                for k, v in row.items() if pd.notna(v)
            }

            item_name = row_data.get('name', f"未知物品_{index+2}")
            abil_name = f"{item_name}_技能"  # 物品技能名称

            # --- 处理物品 ---
            item_id_dec = self.id_counters['item']
            item_id = 'I' + self._dec_to_base62(item_id_dec, 3)  # I004 开始
            self.id_counters['item'] += 1

            for key_lower, value in row_data.items():
                if key_lower in item_keys:
                    # 特殊处理
                    if key_lower == 'droppable':
                        item_section_data[
                            'droppable'] = self._infer_and_format_value(value)
                    elif key_lower == 'goldcost':
                        item_section_data[
                            'goldcost'] = self._infer_and_format_value(value)
                    elif key_lower == 'file' or key_lower == 'model':
                        item_section_data[
                            'file'] = self._infer_and_format_value(value)
                    elif key_lower == 'abilList':  # 物品自带的技能列表
                        item_section_data[
                            'abilList'] = self._infer_and_format_value(value)
                    else:
                        # 其他允许的 item 字段
                        item_section_data[
                            key_lower] = self._infer_and_format_value(value)

            item_section_data['Name'] = self._infer_and_format_value(item_name)

            # --- 处理对应的物品技能 (如果模板存在且需要生成) ---
            abil_id = None
            generate_abil = False
            if abil_section_data is not None:
                way = str(row_data.get('way', '无')).strip()  # 获取使用方式，默认为无
                range_val = row_data.get('range', 0)  # 获取使用范围，默认为0
                use_range = row_data.get('userange', 0)  # 使用距离
                use_area = row_data.get('usearea', 0)  # 使用范围

                if way == '无':
                    generate_abil = False
                elif way == '无目标':
                    abil_section_data['DataB'] = '0'
                    generate_abil = True
                elif way == '点':
                    try:
                        range_float = float(range_val)
                        if range_float == 0:
                            abil_section_data['DataC'] = '1'
                        else:
                            abil_section_data['DataC'] = '3'  # 目标选取图像
                    except (ValueError, TypeError):
                        logger.warning(
                            f"行 {index+2}: 物品技能的 'range' 值 '{range_val}' 无效，默认 DataC=1。来源: {file_path} Sheet {sheet_name}"
                        )
                        self.errors.append(
                            f"警告：行 {index+2} 物品技能 'range' 值无效 '{range_val}'。来源: {file_path}, {sheet_name}"
                        )
                        abil_section_data['DataC'] = '1'
                    generate_abil = True
                elif way == '单位':
                    abil_section_data['DataB'] = '1'
                    abil_section_data['DataC'] = '1'
                    generate_abil = True
                elif way == '建造':
                    # 特殊处理，物品技能链接到固定的建造技能
                    item_section_data['abilList'] = '"JZT1"'  # 修改物品的abilList
                    generate_abil = False  # 不生成单独的物品技能，而是链接到固定技能
                    logger.debug(
                        f"行 {index+2}: 物品 '{item_name}' 是建造类型，链接到 JZT1。")
                else:
                    logger.warning(
                        f"行 {index+2}: 未知的物品使用方式 'way' = '{way}'，不生成物品技能。来源: {file_path} Sheet {sheet_name}"
                    )
                    self.errors.append(
                        f"警告：行 {index+2} 未知物品使用方式 '{way}'。来源: {file_path}, {sheet_name}"
                    )
                    generate_abil = False

                if generate_abil:
                    abil_id_dec = self.id_counters['item_ability']
                    abil_id = 'A' + self._dec_to_base62(abil_id_dec,
                                                        3)  # A000 开始
                    self.id_counters['item_ability'] += 1

                    # 将生成的物品技能ID设置给物品
                    item_section_data[
                        'abilList'] = f'"{abil_id}"'  # 覆盖 abilList

                    # 设置物品技能的其他属性
                    abil_section_data['Name'] = self._infer_and_format_value(
                        abil_name)
                    abil_section_data['Rng'] = self._infer_and_format_value(
                        use_range)
                    abil_section_data['Area'] = self._infer_and_format_value(
                        use_area)

                    # 分配命令 ID
                    order_id = self._get_order_id(order_id_item_index)
                    abil_section_data['Order'] = f'"{order_id}"'
                    abil_section_data['DataF'] = str(order_id_item_index %
                                                     len(self.base_order_ids))
                    order_id_item_index += 1

                    # 从 row_data 应用其他允许的 ability 字段到 abil_section_data
                    for key_lower, value in row_data.items():
                        if key_lower in abil_keys and key_lower not in [
                                'name', 'way', 'range', 'userange', 'usearea'
                        ]:  # 避免覆盖已处理的
                            abil_section_data[
                                key_lower] = self._infer_and_format_value(
                                    value)

            # --- 添加数据 ---
            item_source_info = source_info_base + (f"Item Row {index+2}", )
            self._add_section_data(item_ini_type, item_id, item_section_data,
                                   item_name, item_source_info)

            if generate_abil and abil_id:
                abil_source_info = source_info_base + (
                    f"ItemAbility Row {index+2}", )
                self._add_section_data(abil_ini_type, abil_id,
                                       abil_section_data, abil_name,
                                       abil_source_info)

    def _process_general_sheet(self, file_path, sheet_name, sheet_df,
                               ini_type):
        """处理通用物编表格 (有 id 和 _parent 列)。"""
        logger.info(f"  开始处理通用 {ini_type} Sheet: {sheet_name}")
        source_info_base = (file_path, sheet_name)
        allowed_keys = self.editor_info_map.get(ini_type, set())

        for index, row in sheet_df.iterrows():
            row_data = {
                str(k).lower(): v
                for k, v in row.items() if pd.notna(v)
            }

            section_id = str(row_data.get('id', '')).strip()
            parent_id = str(row_data.get('_parent', '')).strip()
            section_name = row_data.get('name')  # 可能没有Name列

            if not section_id:
                logger.warning(
                    f"行 {index+2}: 缺少 'id'，无法处理。来源: {file_path} Sheet {sheet_name}"
                )
                self.errors.append(
                    f"警告：行 {index+2} 缺少 'id'。来源: {file_path}, {sheet_name}")
                continue

            # 查找父模板
            parent_template = self.ini_templates.get(parent_id)
            if parent_template:
                section_data = parent_template.copy()
                logger.debug(f"行 {index+2}: 使用父模板 '{parent_id}'。")
            else:
                # 如果找不到父模板，尝试使用类型默认模板，例如 "基础单位模版"
                default_template_name = f"基础{ini_type}模版"  # 构造默认模板名
                default_template = self.ini_templates.get(
                    default_template_name)
                if default_template:
                    section_data = default_template.copy()
                    logger.warning(
                        f"行 {index+2}: 未找到父模板 '{parent_id}'，使用默认模板 '{default_template_name}'。来源: {file_path} Sheet {sheet_name}"
                    )
                    self.errors.append(
                        f"警告：行 {index+2} 未找到父模板 '{parent_id}'，使用默认模板。来源: {file_path}, {sheet_name}"
                    )
                else:
                    section_data = {}  # 没有模板可用，从空字典开始
                    logger.warning(
                        f"行 {index+2}: 未找到父模板 '{parent_id}' 且无默认模板 '{default_template_name}'，将只使用Excel数据。来源: {file_path} Sheet {sheet_name}"
                    )
                    self.errors.append(
                        f"警告：行 {index+2} 未找到父模板 '{parent_id}' 且无默认模板。来源: {file_path}, {sheet_name}"
                    )

            # 应用Excel数据
            for key_lower, value in row_data.items():
                if key_lower in ['id', '_parent']: continue  # 跳过这两个特殊列

                if key_lower == 'name':
                    section_name = str(value)  # 更新名字

                if key_lower in allowed_keys:
                    # 特殊处理 (复用白泽的处理逻辑)
                    if key_lower == 'cool1':
                        try:
                            processed_value = float(value) / 100
                            section_data[
                                'cool1'] = self._infer_and_format_value(
                                    processed_value)
                        except (ValueError, TypeError):
                            logger.warning(
                                f"行 {index+2}: 字段 'cool1' 值 '{value}' 无效。来源: {file_path} Sheet {sheet_name}"
                            )
                    elif key_lower == 'acquire':
                        try:
                            acquire_val = float(value)
                            section_data[
                                'acquire'] = '0' if acquire_val == 0 else self._infer_and_format_value(
                                    acquire_val)
                            section_data[
                                'weapsOn'] = '0' if acquire_val == 0 else '1'
                        except (ValueError, TypeError):
                            logger.warning(
                                f"行 {index+2}: 字段 'acquire' 值 '{value}' 无效。来源: {file_path} Sheet {sheet_name}"
                            )
                    elif key_lower == 'file' or key_lower == 'model':
                        section_data['file'] = self._infer_and_format_value(
                            value)
                    else:
                        section_data[key_lower] = self._infer_and_format_value(
                            value)
                # else:
                # logger.debug(f"行 {index+2}: 字段 '{key_lower}' 不在 {ini_type} 允许的字段列表中，已忽略。")

            if not section_name:
                section_name = f"未知{ini_type}_{section_id}"
                logger.warning(
                    f"行 {index+2}: 未找到 'Name' 字段，使用默认名称 '{section_name}'。来源: {file_path} Sheet {sheet_name}"
                )
                self.errors.append(
                    f"警告：行 {index+2} 缺少'Name'。来源: {file_path}, {sheet_name}")

            # 确保 Name 字段存在且格式正确
            section_data['Name'] = self._infer_and_format_value(section_name)

            source_info = source_info_base + (f"Row {index+2}", )
            self._add_section_data(ini_type, section_id, section_data,
                                   section_name, source_info)

    def _infer_and_format_value(self, value):
        """根据规则推断值的类型并格式化为INI字符串。"""
        if pd.isna(value):
            return ''  # 空值返回空字符串

        s_value = str(value).strip()

        # 1. 检查是否已经是带引号的字符串
        if len(s_value) >= 2 and s_value.startswith('"') and s_value.endswith(
                '"'):
            # 可能需要处理内部引号转义，但 war3 ini 通常不严格要求
            return s_value

        # 2. 检查是否是布尔值 (true/false) - war3 ini 通常用 0/1 或 true/false
        if s_value.lower() == 'true':
            return 'true'  # 或者 '1'
        if s_value.lower() == 'false':
            return 'false'  # 或者 '0'

        # 3. 尝试转换为整数
        try:
            # 先尝试转 float 再转 int，处理 '1.0' -> '1' 的情况
            f_val = float(s_value)
            if f_val.is_integer():
                return str(int(f_val))
        except ValueError:
            pass  # 不是整数

        # 4. 尝试转换为浮点数 (避免科学记数法)
        try:
            f_val = float(s_value)
            # 格式化为常规表示法，保留合理精度 (例如6位)
            # 使用 {:f} 避免科学计数法
            return f"{f_val:.6f}".rstrip('0').rstrip('.')  # 去掉末尾多余的0和小数点
        except ValueError:
            pass  # 不是浮点数

        # 5. 默认视为字符串，添加双引号
        # 需要处理值内部可能存在的双引号
        processed_s_value = s_value.replace('"', '\\"')  # 简单转义，war3可能不需要
        return f'"{processed_s_value}"'

    def _add_section_data(self, ini_type, section_id, section_data,
                          section_name, source_info):
        """
        将处理好的 Section 数据添加到 generated_ini_data，并处理冲突。
        同时将名称和ID添加到 ts_mapping_data。

        Args:
            ini_type (str): INI 文件类型 (e.g., 'unit', 'ability').
            section_id (str): War3 物编 ID (e.g., 'h004', '"JZT1"'). 可能带引号。
            section_data (dict): 包含字段和值的字典。
            section_name (str): 物编名称 (用于TS映射)。
            source_info (tuple): 来源信息 (file_path, sheet_name, detail)。
        """
        clean_section_id = section_id.strip('"')  # 去掉可能的引号以进行冲突检查

        if clean_section_id in self.generated_ini_data[ini_type]:
            # 冲突发生
            existing_source = self.generated_ini_data[ini_type][
                clean_section_id].get('_source', ('未知', '未知', '未知'))
            error_msg = (
                f"合并冲突：类型 '{ini_type}' 中已存在 Section ID '{clean_section_id}'。"
                f" 新来源: {source_info[0]} - {source_info[1]} - {source_info[2]}。"
                f" 已有来源: {existing_source[0]} - {existing_source[1]} - {existing_source[2]}。已跳过新条目。"
            )
            logger.warning(error_msg)
            self.errors.append(f"冲突：{error_msg}")
        else:
            # 添加数据和来源信息
            section_data_with_source = section_data.copy()
            section_data_with_source['_source'] = source_info
            self.generated_ini_data[ini_type][
                clean_section_id] = section_data_with_source
            logger.debug(
                f"成功添加 Section '{clean_section_id}' 到类型 '{ini_type}'。来源: {source_info}"
            )

            # 添加到 TS 映射 (使用原始带引号的 ID)
            ts_file_type = ini_type  # 假设 TS 文件类型与 INI 类型一致
            # 对于 item sheet 生成的 ability，其类型是 ability，但要写入 itemabil.ts? 需要确认
            if ini_type == 'ability' and '_parent' not in section_data:  # 简单判断是否物品技能
                # 如果 ini_type 是 ability 且不是继承来的（可能是物品技能）
                # 判断来源是否 item sheet？或者根据 ID 前缀？
                if clean_section_id.startswith('A') and len(
                        clean_section_id) == 4:  # 物品技能ID Axxx
                    ts_file_type = 'itemabil'
                # elif clean_section_id.startswith(('X','Y','Z')) or clean_section_id.startswith(('JZT','WPL')): # 基础技能等
                #      pass # 保持 ability 类型，写入 abilityid.ts (如果需要的话)
                # else: pass # 其他 ability

            # 确保 section_name 有效
            if section_name and isinstance(section_name, str):
                clean_name = section_name.strip()
                if clean_name in self.ts_mapping_data[ts_file_type]:
                    # 名称冲突，可以警告或忽略
                    logger.warning(
                        f"TS映射名称冲突：类型 '{ts_file_type}' 中已存在名称 '{clean_name}'。"
                        f" 新ID: {section_id}, 已有ID: {self.ts_mapping_data[ts_file_type][clean_name]}。"
                        f" 来源: {source_info}")
                self.ts_mapping_data[ts_file_type][
                    clean_name] = section_id.strip('"')  # TS 值不带引号
            else:
                logger.warning(
                    f"无法为 Section ID '{section_id}' 添加TS映射，因为名称无效或缺失。来源: {source_info}"
                )
                self.errors.append(
                    f"警告：Section '{section_id}' 缺少有效名称无法生成TS映射。来源: {source_info}"
                )

    def _write_output(self):
        """将 generated_ini_data 写入INI文件，并处理额外输出路径。"""
        output_ini_dir = os.path.join(self.output_path, 'output', 'ini')
        try:
            os.makedirs(output_ini_dir, exist_ok=True)
            logger.info(f"确保INI输出目录存在: {output_ini_dir}")

            for ini_type, sections in self.generated_ini_data.items():
                if not sections: continue  # 跳过空类型

                ini_file_path = os.path.join(output_ini_dir, f"{ini_type}.ini")
                parser = configparser.ConfigParser(interpolation=None)
                parser.optionxform = str  # 保留大小写

                logger.info(f"开始写入INI文件: {ini_file_path}")
                for section_id, data in sections.items():
                    section_id_with_quotes = f'"{section_id}"'  # 确保 section ID 带引号写入
                    parser[section_id_with_quotes] = {}  # 创建 section
                    for key, value in data.items():
                        if key != '_source':  # 不写入内部来源信息
                            parser[section_id_with_quotes][key] = str(
                                value)  # 值应已格式化

                try:
                    with open(ini_file_path, 'w', encoding='utf-8') as f:
                        parser.write(f, space_around_delimiters=False)  # 紧凑格式
                    logger.info(f"成功写入INI文件: {ini_file_path}")

                    # 处理额外输出路径
                    if self.ini_output_path:
                        try:
                            os.makedirs(self.ini_output_path, exist_ok=True)
                            shutil.copy2(ini_file_path, self.ini_output_path)
                            logger.info(
                                f"已将 {ini_type}.ini 复制到额外目录: {self.ini_output_path}"
                            )
                        except Exception as copy_e:
                            logger.error(
                                f"复制 {ini_type}.ini 到额外目录 '{self.ini_output_path}' 时失败: {copy_e}"
                            )
                            self.errors.append(f"错误：复制文件失败 - {copy_e}")

                except IOError as write_e:
                    logger.error(f"写入INI文件 '{ini_file_path}' 时失败: {write_e}")
                    self.errors.append(f"错误：写入文件失败 - {write_e}")

        except Exception as e:
            logger.error(
                f"创建输出目录或写入INI文件时发生意外错误: {e}\n{traceback.format_exc()}")
            self.errors.append(f"错误：文件输出失败 - {e}")

    def _generate_ts_mapping(self):
        """将 ts_mapping_data 写入TS文件。"""
        output_ts_dir = os.path.join(self.output_path, 'output',
                                     'ts')  # 假设TS文件在 output/ts 下
        try:
            os.makedirs(output_ts_dir, exist_ok=True)
            logger.info(f"确保TS输出目录存在: {output_ts_dir}")

            # TS 文件名映射 (根据白泽参考)
            ts_filename_map = {
                'unit': 'unitid.ts',
                'item': 'itemid.ts',
                'itemabil': 'itemabil.ts',
                # 'ability': 'abilityid.ts' # 如果需要基础技能等的映射
            }

            for ts_type, mapping in self.ts_mapping_data.items():
                if not mapping: continue

                ts_filename = ts_filename_map.get(ts_type)
                if not ts_filename:
                    logger.warning(f"未找到类型 '{ts_type}' 对应的TS文件名，跳过生成。")
                    continue

                ts_file_path = os.path.join(output_ts_dir, ts_filename)
                logger.info(f"开始生成TS映射文件: {ts_file_path}")

                # 构建 TS 文件内容
                content = f"// Auto-generated by War3Excel tool\n"
                # 根据文件名确定变量名
                var_name = os.path.splitext(ts_filename)[0].replace(
                    'id', '') + 'Id'  # e.g. unitId, itemId, itemabilId
                content += f"export const {var_name}: {{ [key: string]: string }} = {{\n"
                # 对 mapping 按 key (名称) 排序，确保输出稳定
                sorted_mapping = sorted(mapping.items())
                for name, obj_id in sorted_mapping:
                    # TS 字符串需要转义特殊字符，这里简单处理引号和反斜杠
                    escaped_name = name.replace('\\',
                                                '\\\\').replace("'", "\\'")
                    content += f"  '{escaped_name}': '{obj_id}',\n"
                content += "};\n"

                try:
                    with open(ts_file_path, 'w', encoding='utf-8') as f:
                        f.write(content)
                    logger.info(f"成功写入TS映射文件: {ts_file_path}")
                except IOError as write_e:
                    logger.error(f"写入TS文件 '{ts_file_path}' 时失败: {write_e}")
                    self.errors.append(f"错误：写入TS文件失败 - {write_e}")

        except Exception as e:
            logger.error(
                f"创建输出目录或写入TS文件时发生意外错误: {e}\n{traceback.format_exc()}")
            self.errors.append(f"错误：TS文件生成失败 - {e}")

    def get_errors(self):
        """返回处理过程中记录的错误列表。"""
        return self.errors

    # --- 辅助方法 ---
    def _get_next_id(self, id_type):
        """根据类型获取下一个顺序ID (62进制)。"""
        if id_type == 'unit':
            count = self.id_counters['unit']
            self.id_counters['unit'] += 1
            return 'h' + self._dec_to_base62(count, 3)
        elif id_type == 'item':
            count = self.id_counters['item']
            self.id_counters['item'] += 1
            return 'I' + self._dec_to_base62(count, 3)
        elif id_type == 'item_ability':
            count = self.id_counters['item_ability']
            self.id_counters['item_ability'] += 1
            return 'A' + self._dec_to_base62(count, 3)
        else:
            logger.warning(f"未知的ID类型请求: {id_type}")
            return None

    def _get_order_id(self, index):
        """获取基础命令ID，自动取余循环使用。"""
        if not self.base_order_ids:
            logger.error("无法获取命令ID，因为基础命令ID列表为空。")
            self.errors.append("错误：基础命令ID列表为空，无法分配命令ID。")
            return "error_no_order_id"
        if not isinstance(index, int) or index < 0:
            logger.error(f"无效的命令ID索引: {index}")
            self.errors.append(f"内部错误：无效的命令ID索引 {index}")
            return "error_invalid_index"
        return self.base_order_ids[index % len(self.base_order_ids)]
