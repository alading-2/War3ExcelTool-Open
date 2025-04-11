import re

str1 = r"a\b\c\d"
val = re.sub(r"\\+", r"\\", str1)
print(val)
