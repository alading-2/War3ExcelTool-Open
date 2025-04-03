

import re
a = re.match('test','testasdtest')  
print(a)                             #返回一个匹配对象
print(a.group())                     #返回test，获取不到则报错
print(a.span())           #返回匹配结果的位置，左闭右开区间
print(re.match('test','atestasdtest'))  #返回None
    




