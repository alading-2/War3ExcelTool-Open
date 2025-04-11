import re

print(r"\\\\")
str1 = r"a\c\\b\\\\\s"
print(str1)
val = re.sub(r"\\+", r"\\", str1)
print(val)
