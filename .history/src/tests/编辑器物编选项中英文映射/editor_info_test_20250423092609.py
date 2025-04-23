from src.core.ini.ini_parser import IniParser, War3IniParser

path1 = r"else\Test\编辑器物编选项中英文映射文件\WorldEditStrings.txt"
path2 = r"else\Test\编辑器物编选项中英文映射文件\metadata.ini"

ini_parser = War3IniParser()
dict1, comment1 = ini_parser.parse_file(path1)
dict2, comment2 = ini_parser.parse_file(path2)
# 中文注释映射
WESTRING = dict1.values()
for data in dict2.values():
    keys = data.keys()
    if "displayname" in keys and "field" in keys:
        displayname = data.get("displayname")
        if displayname in WESTRING:
            print(displayname)
    else:
        
pass
