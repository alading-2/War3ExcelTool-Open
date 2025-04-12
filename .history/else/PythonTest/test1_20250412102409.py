import json


d = "{'id':'001', 'name':'张三', 'age':'20'}"
d = 123
j = json.dumps(d, ensure_ascii=False)
print(j)
