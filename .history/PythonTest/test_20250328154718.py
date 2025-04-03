

import re
print(re.match(r'.*ve\b','aaave.2testaabcd'))  #因为在python中\代表转义，所以前面加上r消除转义
print(re.match(r'.*ve\b','aaave2testaabcd'))