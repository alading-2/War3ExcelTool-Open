import re

str1 = r"a\b\c\d"
print(str1)
val = re.sub(r"\\+", r"\\", str1)
print(val)
