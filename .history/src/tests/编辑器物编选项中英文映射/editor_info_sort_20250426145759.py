"""
测试编辑器中英文映射生成，排序
"""

from src.core.ini.ini_parser import War3IniParser
from src.utils.logger import setup_logger

logger = setup_logger("WARNING")
logger.info("测试")

path1 = r"else\Test\编辑器物编选项中英文映射文件\WorldEditStrings_筛选过.ini"
path2 = r"else\Test\编辑器物编选项中英文映射文件\metadata_筛选.ini"

# 编辑器中英文映射生成测试
war3_ini_parser = War3IniParser(is_section_no_repetition=True)
result_dict = war3_ini_parser.parse_file(path1)
content, dict1, comment1 = result_dict["content"], result_dict[
    "data"], result_dict["comment"]
result_dict = war3_ini_parser.parse_file(path2)
dict2, comment2 = result_dict["data"], result_dict["comment"]

for key, data in dict2.items():
    keys = data.keys()
    if "displayname" in keys and "field" in keys:
        displayname = data.get("displayname")
        field = data.get("field")
        if displayname in content:
            content = content.replace(displayname + "=", field + "=")
        else:
            logger.warning(f"{field}，WorldEditStrings.txt中没有{displayname}")
    else:
        logger.warning(f"metadata.ini中{data}缺少displayname或field")
content.replace(" ", "")  # 删除空格
with open(r"resource\resource\editor_info_map.ini", "w",
          encoding="utf-8") as f:
    f.write(content)

path3 = r"resource\resource\editor_info_map.ini"
result_dict = War3IniParser.parse_ini(path3)

pass
