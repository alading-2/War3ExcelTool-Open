# src/core/ini_generator.py
# Ini代码生成器模块
import os
import shutil
import configparser
from typing import Dict, List, Tuple, Set, Any, Optional


class Excel_to_ini:
    """
    Excel 转 INI 工具 - 将Excel数据转换为War3物编INI文件

    此模块接收processor.py解析后的Excel数据，根据预设规则生成符合War3规范的INI文件
    和相应的TypeScript ID映射文件。
    """

    # 62进制转换函数
    def int_to_base62(n: int) -> str:
        """将10进制数转换为62进制字符串"""
        chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        result = ""
        while n > 0:
            result = chars[n % 62] + result
            n //= 62
        return result.zfill(4) if len(result) <= 4 else result

    def base62_to_int(s: str) -> int:
        """将62进制字符串转换为10进制数"""
        chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        result = 0
        for char in s:
            result = result * 62 + chars.index(char)
        return result

    def load_order_ids(file_path: str) -> List[str]:
        """加载基础命令ID列表"""
        with open(file_path, 'r', encoding='utf-8') as f:
            return [line.strip() for line in f if line.strip()]

    def load_ini_template(file_path: str) -> Dict[str, Dict[str, str]]:
        """加载INI模板文件"""
        config = configparser.ConfigParser()
        config.read(file_path, encoding='utf-8')
        return {
            section: dict(config[section])
            for section in config.sections()
        }

    def format_ini_value(value: Any) -> str:
        """格式化INI值，确保字符串带引号"""
        if isinstance(value, str):
            # 如果值不是以双引号开头和结尾，添加双引号
            if not (value.startswith('"') and value.endswith('"')):
                return f'"{value}"'
            return value
        return str(value)

    def convert_excel_to_ini(
        parsed_data: Dict[str, Any],
        player_count: int = 5,
        ini_output_path: Optional[str] = None
    ) -> Tuple[Dict[str, Dict[str, Dict[str, str]]], List[str]]:
        """
        将解析后的Excel数据转换为War3物编INI数据
        
        Args:
            parsed_data: processor.py解析的Excel数据
            player_count: 玩家数量，用于计算基础技能数
            ini_output_path: 可选的INI文件导出路径
            
        Returns:
            转换后的INI数据字典和错误信息列表
        """
        # 初始化数据结构
        ini_data = {'unit': {}, 'ability': {}, 'item': {}}
        error_logs = []
        ts_mappings = {'unit': {}, 'item': {}, 'ability': {}}

        # 加载资源
        template_path = 'resource/resource/excel_to_ini/excel_to_ini_template.ini'
        order_ids_path = 'resource/resource/excel_to_ini/基础命令id.txt'
        editor_map_path = 'resource/resource/editor_info_map.ini'

        templates = load_ini_template(template_path)
        order_id_list = load_order_ids(order_ids_path)

        # 加载编辑器信息映射
        editor_map = configparser.ConfigParser()
        editor_map.read(editor_map_path, encoding='utf-8')

        # 处理模板类技能
        # 1. 基础技能模板（无目标/单位目标/点目标）
        ability_base_template = templates.get("基础技能模版", {})
        for p in range(player_count):
            for x in range(4):  # 0-3，4列
                for y in range(3):  # 0-2，3行
                    # 无目标技能
                    no_target_id = f"X{p}{x}{y}"
                    no_target = ability_base_template.copy()
                    no_target["DataB"] = "0"
                    no_target["DataC"] = "1"
                    no_target["Order"] = order_id_list[y * 4 + x]
                    no_target["DataF"] = str(y * 4 + x)
                    no_target["Buttonpos_1"] = str(x)
                    no_target["Buttonpos_2"] = str(y)
                    no_target["Name"] = f'"{p}+{x}+{y}"'
                    ini_data['ability'][no_target_id] = no_target

                    # 单位目标技能
                    unit_target_id = f"Y{p}{x}{y}"
                    unit_target = ability_base_template.copy()
                    unit_target["DataB"] = "1"
                    unit_target["DataC"] = "1"
                    unit_target[
                        "targs"] = '"notself,ground,structure,air,ward,item,self"'
                    unit_target["Order"] = order_id_list[y * 4 + x + 12]
                    unit_target["DataF"] = str(y * 4 + x + 12)
                    unit_target["Buttonpos_1"] = str(x)
                    unit_target["Buttonpos_2"] = str(y)
                    unit_target["Name"] = f'"{p}+{x}+{y}"'
                    ini_data['ability'][unit_target_id] = unit_target

                    # 点目标技能
                    point_target_id = f"Z{p}{x}{y}"
                    point_target = ability_base_template.copy()
                    point_target["DataB"] = "3"
                    point_target["DataC"] = "1"
                    point_target[
                        "targs"] = '"notself,ground,structure,air,ward,item,self"'
                    point_target["Order"] = order_id_list[y * 4 + x + 24]
                    point_target["DataF"] = str(y * 4 + x + 24)
                    point_target["Buttonpos_1"] = str(x)
                    point_target["Buttonpos_2"] = str(y)
                    point_target["Name"] = f'"{p}+{x}+{y}"'
                    ini_data['ability'][point_target_id] = point_target

        # 2. 建造技能模板
        for m in range(1, 5):
            build_id = f"JZT{m}"
            build_skill = {
                "_parent": '"AIbt"',
                "Buttonpos_1": str(m - 1),
                "UnitID": f'"jzd{m}"'
            }
            ini_data['ability'][build_id] = build_skill

        # 3. 移动技能模板（简化处理）
        ini_data['ability']["MOVE"] = {"_parent": '"Amov"'}

        # 4. 物品栏技能模板
        for m in range(1, 7):
            item_skill_id = f"WPL{m}"
            item_skill = {"DataA": str(m)}
            ini_data['ability'][item_skill_id] = item_skill

        # 处理Excel数据
        for file_name, file_data in parsed_data.items():
            is_table_file = 'table' in file_name.lower()

            for sheet_name, sheet_data in file_data.items():
                # 确定物编类型
                object_type = None
                if sheet_name.lower() in ['unit', 'ability', 'item']:
                    object_type = sheet_name.lower()
                elif sheet_data and len(sheet_data) > 1:
                    # 检查第二行是否包含id和_parent列
                    keys = [k.lower() for k in sheet_data[1].keys()]
                    if 'id' in keys and '_parent' in keys:
                        # 根据OBJECT_TYPE_MAPPING确定类型
                        # 简化处理，假设和sheet_name相关
                        if 'unit' in sheet_name.lower():
                            object_type = 'unit'
                        elif 'ability' in sheet_name.lower():
                            object_type = 'ability'
                        elif 'item' in sheet_name.lower():
                            object_type = 'item'

                if not object_type:
                    continue

                # 处理数据行
                for row_idx, row_data in enumerate(sheet_data[2:],
                                                   2):  # 从第二行开始
                    if not row_data:
                        continue

                    # 生成物编ID
                    section_id = None
                    if object_type == 'unit':
                        # 单位ID: h004开始
                        n = row_idx + 2  # 简化处理
                        section_id = f"h{n:03d}"
                    elif object_type == 'item':
                        # 物品ID: I004开始
                        n = row_idx + 2
                        section_id = f"I{n:03d}"
                        # 同时生成物品技能
                        ability_id = f"A{n:03d}"
                        ability_data = {}

                        # 处理物品技能
                        way = row_data.get('way', '').lower()
                        if way and way != '无':
                            ability_data['_parent'] = '"AInv"'

                            if way == '无目标':
                                ability_data['DataB'] = '0'
                            elif way == '点':
                                range_val = row_data.get('range', 0)
                                ability_data['DataB'] = '3'
                                ability_data[
                                    'DataC'] = '1' if range_val == 0 else '3'
                            elif way == '单位':
                                ability_data['DataB'] = '1'
                                ability_data['DataC'] = '1'
                            elif way == '建造':
                                ability_data['_parent'] = '"JZT1"'

                            # 命令ID和其他数据
                            n_mod = (row_idx - 2) % len(order_id_list)
                            ability_data['Order'] = order_id_list[n_mod]
                            ability_data['DataF'] = str(n_mod)

                            # 距离和范围
                            if 'range' in row_data:
                                ability_data['Rng'] = str(row_data['range'])
                            if 'area' in row_data:
                                ability_data['Area'] = str(row_data['area'])

                            # 添加到ini_data
                            ini_data['ability'][ability_id] = ability_data

                            # 物品添加技能列表
                            row_data['abilList'] = f'"{ability_id}"'

                            # 添加到TS映射
                            item_name = row_data.get('name', f'物品{n}')
                            ts_mappings['ability'][item_name] = ability_id

                    # 处理通用字段
                    section_data = {}
                    for key, value in row_data.items():
                        key_lower = key.lower()

                        # 特殊字段处理
                        if key_lower == 'cool1' and value:
                            section_data['cool1'] = str(float(value) / 100)
                        elif key_lower == 'acquire':
                            if value == 0:
                                section_data['acquire'] = '0'
                                section_data['weapsOn'] = '0'
                            else:
                                section_data['acquire'] = str(value)
                                section_data['weapsOn'] = '1'
                        elif key_lower in ['model', 'file']:
                            section_data['file'] = format_ini_value(value)
                        elif key_lower in [
                                'droppable', 'goldcost', 'collision', 'scale',
                                'spd'
                        ]:
                            section_data[key_lower] = str(value)
                        elif editor_map.has_option(object_type, key_lower):
                            # 根据editor_info_map匹配字段
                            section_data[key_lower] = format_ini_value(value)

                    # 如果有id和_parent，使用它们
                    if 'id' in row_data:
                        section_id = row_data['id']
                    if '_parent' in row_data:
                        section_data['_parent'] = format_ini_value(
                            row_data['_parent'])

                    if section_id and section_data:
                        # 检查是否存在冲突
                        if section_id in ini_data[object_type]:
                            error_logs.append(
                                f"冲突: {file_name}-{sheet_name}-{section_id} 已存在，跳过"
                            )
                        else:
                            ini_data[object_type][section_id] = section_data

                            # 添加到TS映射
                            name = row_data.get('name',
                                                f'{object_type}{section_id}')
                            ts_mappings[object_type][name] = section_id

        # 输出INI文件
        output_dir = 'output/ini'
        os.makedirs(output_dir, exist_ok=True)

        for obj_type, sections in ini_data.items():
            if not sections:
                continue

            ini_file_path = os.path.join(output_dir, f"{obj_type}.ini")
            with open(ini_file_path, 'w', encoding='utf-8') as f:
                for section_id, section_data in sections.items():
                    f.write(f"[{section_id}]\n")
                    for key, value in section_data.items():
                        f.write(f"{key}={value}\n")
                    f.write("\n")

            # 复制到ini_output_path
            if ini_output_path:
                os.makedirs(ini_output_path, exist_ok=True)
                shutil.copy(ini_file_path,
                            os.path.join(ini_output_path, f"{obj_type}.ini"))

        # 输出TS映射文件
        ts_dir = 'output/ts'
        os.makedirs(ts_dir, exist_ok=True)

        # 生成unitid.ts
        with open(os.path.join(ts_dir, 'unitid.ts'), 'w',
                  encoding='utf-8') as f:
            f.write("export const UnitId = {\n")
            for name, unit_id in ts_mappings['unit'].items():
                f.write(f"    {name}: '{unit_id}',\n")
            f.write("};\n")

        # 生成itemid.ts
        with open(os.path.join(ts_dir, 'itemid.ts'), 'w',
                  encoding='utf-8') as f:
            f.write("export const ItemId = {\n")
            for name, item_id in ts_mappings['item'].items():
                f.write(f"    {name}: '{item_id}',\n")
            f.write("};\n")

        # 生成itemabil.ts
        with open(os.path.join(ts_dir, 'itemabil.ts'), 'w',
                  encoding='utf-8') as f:
            f.write("export const ItemAbilId = {\n")
            for name, abil_id in ts_mappings['ability'].items():
                if abil_id.startswith('A'):  # 只包含物品技能
                    f.write(f"    {name}: '{abil_id}',\n")
            f.write("};\n")

        # 输出错误日志
        if error_logs:
            with open('output/excel_to_ini_errors.log', 'w',
                      encoding='utf-8') as f:
                for error in error_logs:
                    f.write(f"{error}\n")

        return ini_data, error_logs


# 在processor.py中调用
# from excel_to_ini_converter import convert_excel_to_ini
#
# def process_files(excel_files, output_dir, ini_output=None, player_count=5):
#     parsed_data = parse_excel_files(excel_files)
#     ...
#     # 调用Excel转INI功能
#     ini_data, errors = convert_excel_to_ini(parsed_data, player_count, ini_output)
#     if errors:
#         for error in errors:
#             print(f"警告: {error}")
