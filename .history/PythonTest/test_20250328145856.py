

import re
a = re.match('..','testasdtest')  
print(a.group())   #输出te                             
b = re.match('ab.','testasdtest')  
print(b) #返回none，因为表达式是以固定的ab开头然后跟上通配符. 所以必须要先匹配上ab才会往后进行匹配
c = re.match('te.','testasdtest')  
print(c) 




