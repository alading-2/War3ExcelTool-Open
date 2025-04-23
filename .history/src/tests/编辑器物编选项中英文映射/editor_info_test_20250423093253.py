from src.core.ini.ini_parser import IniParser, War3IniParser
from src.utils.logger import setup_logger

logger = setup_logger()
logger.info("测试")

path1 = r"else\Test\编辑器物编选项中英文映射文件\WorldEditStrings.txt"
path2 = r"else\Test\编辑器物编选项中英文映射文件\metadata.ini"

ini_parser = War3IniParser()
dict1, comment1 = ini_parser.parse_file(path1)
dict2, comment2 = ini_parser.parse_file(path2)
# 中英文映射字典
map_dict = {}
# 中文注释映射
WESTRING = dict1.values()
for data in dict2.values():
    keys = data.keys()
    if "displayname" in keys and "field" in keys:
        displayname = data.get("displayname")
        field = data.get("field")
        if displayname in WESTRING:
            map_dict[field] = WESTRING[displayname]
        else:
            logger.warning(f"WorldEditStrings.txt中没有{displayname}对应的中文注释")
    else:
        logger.warning(f"metadata.ini中{data}缺少displayname或field")

pass
