from src.utils.file_utils import find_excel_files
import re

path = "else\\Test\\excel\\test"
files_list = find_excel_files(path, True)
pass
file = "else\\Test\\excel\\test\\~$test.xlsx"
val = re.search(r"~\$\w+\.xlsx", file)
print(file)
