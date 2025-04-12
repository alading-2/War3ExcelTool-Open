import json


d = "{'id':'001', 'name':'张三', 'age':'20'}"
# d = 1, 234, 567.89e6
j = json.dumps(d, ensure_ascii=False)
print(j)
