


import re
s = "this is a number 234-235-22-423"
# 1.贪婪模式
resule = re.match(r"(.+)(\d+-\d+-\d+-\d)",s)   #我们本想数字和字母拆解成两个分组
print(resule.groups())  #('this is a number 23', '4-235-22-4')但我们发现输出的结果中23的数字竟然被弄到前面去了
 
#因为+它会尽可能多的进行匹配，\d，只需要一个4就能满足，所以前面就尽可能多的匹配
# 2.关闭贪婪模式
#在数量词后面加上 ?，进入非贪婪模式，尽可能少的进行匹配
result = re.match(r"(.+?)(\d+-\d+-\d+-\d)",s)
print(result.groups())   #('this is a number ', '234-235-22-4')
