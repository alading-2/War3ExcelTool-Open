import re
from ast import literal_eval

raw_str = '{strength_p:3, attack_p:5,}'

# 步骤 1：处理键的引号问题（给键添加双引号）
formatted = re.sub(r'(\w+):', r'"\1":',
                   raw_str)  # 结果：'{"strength_p":3, "attack_p":5,}'

# 步骤 2：处理末尾的逗号问题
formatted = re.sub(r',\s*}', '}',
                   formatted)  # 结果：'{"strength_p":3, "attack_p":5}'

# 步骤 3：安全解析为字典
try:
    result = literal_eval(formatted)  # {'strength_p':3, 'attack_p':5}
except SyntaxError:
    print("格式转换失败")
