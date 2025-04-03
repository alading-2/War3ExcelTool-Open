

import re
s = """<img data-original="https://img02.sogoucdn.com/app/a/100520024/36189693dc8db6bd7c0be389f8aaddbd.jpg" src="https://img02.sogoucdn.com/app/a/100520024/36189693dc8db6bd7c0be389f8aaddbd.jpg" width="250" height="375" .jpg>"""
result1 = re.search(r"src=\"https.*.jpg\"",s)   
print(result1.group())
 
result2 = re.search(r"src=\"(https.*.jpg)\"",s) #我只是想将网址提取出来，所以httpxx加括号，这样我就可以把它单独提取出来，src则不会出来
print(result2.groups()[0])


