from src.core.ini.ini_parser import IniParser, War3IniParser

path1 = r"else\Test\编辑器物编选项中英文映射文件\WorldEditStrings.txt"
path2 = r"else\Test\编辑器物编选项中英文映射文件\metadata.ini"

ini_parser = IniParser()
dict1 = ini_parser.parse_ini(path1)
dict2 = ini_parser.parse_ini(path2)
pass
