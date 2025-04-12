import json


d = {"防御": 2785, "法抗": 58118}
# d = 1, 234, 567.89e6
j = json.dumps(d, ensure_ascii=False, indent=4, separators=(",", ": "))
print(j)
pass
