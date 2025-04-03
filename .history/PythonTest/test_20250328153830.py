

import re
print(re.match('^2','2stoooabatestas')) #规定必须以2开头，否则none 
print(re.match('^2s','2stoooabatestas')) #必须以2s开头
print(re.match('^2s','_2stoooabatestas')) #必须以2s开头