"""
测试编辑器中英文映射生成，排序
"""

import json
import os
from src.core.ini.ini_parser import War3IniParser
from src.utils.logger import setup_logger

logger = setup_logger("WARNING")
logger.info("测试")

path1 = r"else\Test\编辑器物编选项中英文映射文件\WorldEditStrings_筛选过.ini"
path2 = r"else\Test\编辑器物编选项中英文映射文件\metadata_筛选.ini"

# 编辑器中英文映射生成测试
war3_ini_parser = War3IniParser(is_section_no_repetition=True)
result_dict = war3_ini_parser.parse_file(path1)
content1, dict1, comment1 = result_dict["content"], result_dict[
    "data"], result_dict["comment"]
result_dict = war3_ini_parser.parse_file(path2)
dict2, comment2 = result_dict["data"], result_dict["comment"]
# 读取editor_info_map.ini
path3 = r"resource\resource\editor_info\editor_info_map.ini"
result_dict = War3IniParser.parse_ini(path3)
content3, dict3, comment3, order_dict3 = result_dict["content"], result_dict[
    "data"], result_dict["comment"], result_dict["order"]


# 确认类型的函数
def type_confirm(num: str) -> str:
    if num == '0':
        return "int"
    elif num == '1':
        return "float"
    elif num == '2':
        return "float"
    elif num == '3':
        return "string"
    else:
        return


# 遍历metadata.ini
json_dict = {}  # 将metadata.ini转换为json格式
for key, data in dict2.items():
    keys = data.keys()
    if "displayname" in keys and "field" in keys:
        displayname = data.get("displayname")
        field = data.get("field")
        type_num = data.get("type")  # 类型
        type = type_confirm(type_num)
        if not type:
            logger.error("类型无法判断")

        # 生成editor_info_map.ini
        if displayname in content1:
            content1 = content1.replace(displayname + "=", field + "=")
        else:
            logger.warning(f"{field}，WorldEditStrings.txt中没有{displayname}")
        # 生成.json
        for object_type, data4 in dict1.items():
            if displayname in data4.keys():
                if object_type not in json_dict:
                    json_dict[object_type] = {}
                if field not in json_dict[object_type]:
                    json_dict[object_type][field] = {}
                json_dict[object_type][field]["name"] = field
                json_dict[object_type][field]["type"] = type
                json_dict[object_type][field]["comment"] = data4[displayname]

    else:
        logger.warning(f"metadata.ini中{data}缺少displayname或field")
content1.replace(" ", "")  # 删除空格
with open(r"resource\resource\editor_info\editor_info_map.ini",
          "w",
          encoding="utf-8") as f:
    f.write(content1)

# 遍历json_dict
for object_type, data4 in json_dict.items():
    path4 = os.path.join(r"resource\resource\editor_info",
                         f"{object_type}.json")
    with open(path4, "w", encoding="utf-8") as f:
        f.write(json.dumps(data4, ensure_ascii=False, indent=4))
# 生成一个总的文件
path = r"resource\resource\editor_info\editor_info_map.json"
with open(path, "w", encoding="utf-8") as f:
    f.write(json.dumps(json_dict, ensure_ascii=False, indent=4))
pass
