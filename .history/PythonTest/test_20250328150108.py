

import re
a = re.match('\D','23es12testasdtest')  
print(a)     #开头为数字所以返回none                          
b = re.match('\D\D','*es12testasdtest')   
print(b)   #返回*e




