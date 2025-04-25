"""
测试编辑器中英文映射生成，排序
"""

from src.core.ini.ini_parser import IniParser, War3IniParser
from src.utils.logger import setup_logger

logger = setup_logger("WARNING")
logger.info("测试")

path1 = r"else\Test\编辑器物编选项中英文映射文件\WorldEditStrings_筛选过.txt"
path2 = r"else\Test\编辑器物编选项中英文映射文件\metadata_筛选.ini"

# 编辑器中英文映射生成测试
War3IniParser.is_section_no_repetition = True
dict1, comment1 = War3IniParser.parse_ini(path1)
dict2, comment2 = War3IniParser.parse_ini(path2)
# 中英文映射字典
map_dict = {}
# 中文注释映射
for key, value in dict1.items():
    WESTRING = value
for key, data in dict2.items():
    keys = data.keys()
    if "displayname" in keys and "field" in keys:
        displayname = data.get("displayname")
        field = data.get("field").lower()  #小写更容易判断
        if displayname in WESTRING:
            if field not in map_dict:
                map_dict[field] = WESTRING[displayname]
            else:
                logger.info(f"map_dict中已存在键{field}")
        else:
            logger.warning(
                f"{field}WorldEditStrings.txt中没有{displayname}对应的中文注释")
    else:
        logger.warning(f"metadata.ini中{data}缺少displayname或field")
map_dict = {'editor_info_map': map_dict}
data_str = War3IniParser.to_string(map_dict)

with open(r"resource\resource\editor_info_map.ini", "w",
          encoding="utf-8") as f:
    f.write(data_str)

path = r"resource\resource\editor_info_map.ini"
dict3, comment3 = War3IniParser.parse_ini(path)
if dict3 == map_dict:
    logger.info("解析前后相等")
else:
    logger.warning("解析前后不相等")
pass
