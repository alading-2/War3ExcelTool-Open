

import re
print(re.match('\w','23es 12testasdtest'))   #返回none
print(re.match('\w\w\w','aA_3es 12testasdtest'))   #返回none
print(re.match('\w\w\w','\n12testasdtest'))   #返回none
print(re.match('\w\w\w','__12testasdtest'))   #返回none



