

import re
print(re.match('12[^234]','232s12testasdtest'))  #因为开头的12没匹配上，所以直接返回none
print(re.match('12[^234]','1232s12testasdtest')) #返回none
print(re.match('12[^234]','1252s12testasdtest')) #返回125
