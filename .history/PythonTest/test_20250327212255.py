
from enum import Enum

class WeekDay(Enum):
    Mon = 0
    Tue = 1
    Wed = 2
    Thu = 3
    Fri = 4


# 枚举成员
print(WeekDay.Mon)
# 枚举成员名称
print(WeekDay.Mon.name)
# 枚举成员值
print(WeekDay.Mon.value)





