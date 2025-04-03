

import re
str = "csrftoken=ZjfvZBcDMcVs7kzYqexJqtKiJXIDxcmSnXhGD1ObR2deuHzaU0FuCxSmh10fSmhf; expires=Thu, 29 Jun 2023 07:59:04 GMT; Max-Age=31449600; Path=/; SameSite=Lax"
a = re.search(r'=(.*?);', str)
print(a.group())    #输出匹配的字符
print(a.group(1))    #输出匹配的字符


