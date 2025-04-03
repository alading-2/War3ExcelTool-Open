

import re
print(re.match(r'.*ve\b','aaave.2testaabcd'))  #因为在python中\代表转义，所以前面加上r消除转义
print(re.match(r'.*ve\b','aaave\n.2testaabcd'))  #因为在python中\代表转义，所以前面加上r消除转义
print(re.match(r'.*ve\b','aaave2testaabcd'))
print(re.match(r'.*ve\b','aaave_2testaabcd'))

print('-----------------------------------------')
print(re.match(r'.*ve\B','aaave.2testaabcd'))  #因为在python中\代表转义，所以前面加上r消除转义
print(re.match(r'.*ve\B','aaave\n.2testaabcd'))  #因为在python中\代表转义，所以前面加上r消除转义
print(re.match(r'.*ve\B','aaave2testaabcd'))
print(re.match(r'.*ve\B','aaave_2testaabcd'))

