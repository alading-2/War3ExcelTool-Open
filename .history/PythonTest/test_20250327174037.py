

import time
t = time.localtime()
print('t-->', t)
print('tm_year-->', t.tm_year)
for i in t:
    print(i)
