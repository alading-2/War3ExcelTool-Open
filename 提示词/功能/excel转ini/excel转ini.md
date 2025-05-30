# 新功能：excel 转 ini

## -1. 新建辅助参数：玩家数量，这个参数用于确定技能物编生成的数量，默认 5

## 0. war3 物编 id 使用 62 进制，从小到大依次是 0-9,a-z,A-Z，id 必须是 4 位，要写两个函数：10 进制转 62 进制，62 进制转 10 进制

## 1. 如何辨别生成 ini 的种类：根据 sheet 的名字判断。ini_parser.py 的 OBJECT_TYPE_MAPPING 判断，直接用 OBJECT_TYPE_MAPPING，不要再自己写一个了，比如 sheet 名字为'单位'或'unit'，生成的 ini 名字为 unit

---

## 2. 白泽框架下，需要额外识别名字为 table 的 excel 文件，sheet 为 unit、ability、item 的 sheet，这三个 sheet 分别有不同的处理方式：

首先物编模版从 resource\resource\excel_to_ini\excel_to_ini_template.ini 获取，用 War3IniParser.parse_ini 解析成字典 dict

### 一、ability

#### 基础技能模版（12×3× 玩家数量个），物编类型：ability

首先加载技能模版 dict["基础技能模版"]到一个新的字典 dict_new
分成 3 种：无目标/单位目标/点目标

变量：p=0-(玩家数量-1),x=0-3(4 列),y=0-2(3 行),

- (1) 无目标：DataB=0,DataC=1
- (2) 单位目标：DataB=1,DataC=1,targs="notself,ground,structure,air,ward,item,self"
- (3) 点目标：DataB=3,DataC=1,targs="notself,ground,structure,air,ward,item,self"
  上面提到的 DataB=0 是指 dict_new["DataB"]=0，字典变量名字没有指定，你自己起名字
- (4) 物编 id：X/Y/Z+玩家序号+技能按钮位置\_x+技能 x 按钮位置\_y
  id 第 1 位：无目标为 X，单位目标为 Y，点目标为 Z
  id 第 2 位：玩家序号：p
  id 第 3 位：技能按钮位置\_x：x:0-3，4 列
  id 第 4 位：技能 x 按钮位置\_y：y:0-2，3 行
  id=X/Y/Z+p+x+y
- (5) 最多 12×3 个技能，对应 12×3 个固定的基础命令 ID，n=0-35，从命令 ID 列表获取，对应 12 个技能位置，每个位置有 3 个技能：无目标/单位目标/点目标，每个玩家 36 个技能的命令，只要这 36 个技能命令 id 不重复就没问题
  Order=order_id_list[n] # 命令串
  DataF=n # 基础命令 id
  Buttonpos_1=x # 按钮位置 x:0-3
  Buttonpos_2=y # 按钮位置 y:0-2
  Name=f"{p}+{x}+{y}" # 名称

#### 建造技能模版（4 个），物编类型：ability

m=1-4
id=f'"JZT+{m}"' #id
\_parent="AIbt" #父级：建造技能
Buttonpos_1=m-1 #按钮位置 x:0-3
UnitID=f'"jzd{m}"' #创建单位：设置好的指定瞭望塔

#### 移动技能模版（1 个），物编类型：ability

#### 物品栏技能模版（6 个），物编类型：ability

m=1-6
id=f'"WPL+{m}"' #id
DataA=m # 数据 A，施法持续时间

### 二、unit

#### 马甲单位模版，物编类型：unit

#### 基础单位模版，物编类型：unit

白泽框架下名字为 table 的 excel 文件，sheet 为 unit 的表，从第 2 行开始是数据，每有一个数据创建一个单位物编
物品数量为 n，从 4 开始
id:id="h+n"
首先加载基础单位模版成字典，在此基础上修改
如果表格第二行 key 名包含 resource\resource\editor_info_map.ini 中 unit 包含的物编选项，小写匹配就行，写进字典
比如有 file，就把对应的数据写进字典，如：file=对应单元格数据
如果有 cool1=对应数据
如果有 collision=对应数据
如果有 scale=对应数据
如果有 spd=对应数据
如果有 acquire 再判断，（主动攻击距离）
'''
if acquire ==0:
acquire=0
weapsOn=0
else:
acquire=对应值
weapsOn=1
'''

#### 瞭望塔模版，物编类型：unit

加载瞭望塔模版，加上
m=1-4
id=f'"jzd+{m}"'

#### 瞭望塔模版-没有模型，物编类型：unit

### 三、item

#### 基础物品模版，物编类型：item

白泽框架下名字为 table 的 excel 文件，sheet 为 item 的表，从第 2 行开始是数据每有一个数据创建一个物品物编和一个物品技能物编，物品的物品技能 id 与物品技能物编的 id 对应
物品数量为 n，从 4 开始
加载基础物品模版成字典，在此基础上修改
物品的 id 第一位是 I，后面接物品数量 n 转 62 进制数，不足 3 位补 0
id="A+n"
如果表格第二行 key 名包含 resource\resource\editor_info_map.ini 中 unit 包含的物编选项，小写匹配就行，写进字典
比如 droppable,goldcost
如果是 model/file
写入 file=对应

#### 物品技能模版，物编类型：ability

加载物品技能模版成字典，在此基础上修改
物品技能的 id 第一位是 A，后面接物品数量 n 转 62 进制数，不足 3 位补 0
物品技能 abilList="A+n"
![表格第二列使用方式 way 限定在（无/无目标/单位/点/建造）](image/excel转ini/1745570002761.png)
图片说明表格第二列使用方式 way 限定在（无/无目标/单位/点/建造），再获取列名为使用范围的列的值 range

```
if way="无":
不写入物品技能模版，即被动技能，无需使用物编技能模版
if way="无目标":
DataB=0
elif way="点":
if range==0:
DataC=1
else:
DataC=3 #目标选取图像
elif way="单位":
DataB=1
DataC=1
elif way="建造":
abilList="JZT1" #这个特殊
```

Order=order_id_list[n] # 命令串
DataF=n # 基础命令 id
Rng=列名为使用距离对应的值
Area=列名为使用范围对应的值

## 3.生成名字与物编 id 映射的 ts 文件

参考：else\参考\白泽\itemabil.ts,else\参考\白泽\unitid.ts,else\参考\白泽\itemid.ts
分别是单位/物品/物品技能的名字与对应的物编 id
至于 id 从哪开始，上面已经分别有说明
单位：h004 开始
物品：I004 开始
物品技能：A000 开始

## 4.基础命令 ID：resource\resource\excel_to_ini\基础命令 id.txt，先解析，存放在列表，需要获取时从列表 order_id_list 获取，一共应该是 193 个命令，要自动取余，超过就从 0 开始

## 5.最好可以记录每个 ini 数据是来自哪个 excel 文件的哪个 sheet 的，用于错误信息显示

## 6.最后相同 ini 种类的数据需要合并在一起，比如只生成一个 unit.ini，合并的过程如果遇到相同的 section，不覆盖，跳过，并且生成错误信息，最好指明是哪个 excel 文件的哪个 sheet 的哪个 section，这个 section 一般是 war3 物编 id

## 7.如果设置了导出 ini 的路径 ini_output，最后需要把生成的 ini 文件额外复制到 ini_output 目录下

## 8.生成的 ini 要做类型判断，字符串要保证首尾有双引号"，数字直接输出

## 9.补充：如果 excel 文件有名为 id 和\_parent 的列（第二行 key 值），也视为物编表格，同意要额外转化成 ini

---

# 对于 AI 指出模糊点说明：

1. excel 文件格式与字段映射
   首先 excel 转 ini 功能仅对物编表格进行转化，物编表格的判断方法：

- (1)白泽框架下：名为 table 的 excel 文件，里面的名为 unit/ability/item 的 sheet 要转化成对应的 unit/ability/item.ini
- (2) excel 文件中的 sheet 的第二行 key 值有名为 id 和\_parent 的列，也视为物编表格，这种对 excel 文件名没要求，但对 sheet 有要求，需要在 OBJECT_TYPE_MAPPING 范围内

当然最好在解析 excel 的时候就用列表记录哪些 excel 文件的哪些 sheet 要转化成 ini，最后同类型 ini 合并生成
"如果表格第二行 key 名包含 xxx.ini 中的选项就写进字典"，小写匹配也行，不匹配就不管

2. 模板字段的动态处理
   有些字段需要特殊处理，只是我提到的几个，不考虑后续
3. 基础命令 id 分配
   不需要，war3 基础命令 id 是共用的
4. 是否统一格式你自己决定，不需要输出文件
5. 合并策略
   不覆盖
6. 类型判断
   参考 ExcelParser 的 infer_type_single，不过 war3ini 不支持科学计数法，遇到"123"双引号里面只有数字的，算字符串，反正"......"双引号之内的都是字符串类型 7.输出路径与文件命名
   输出到输出路径+output+ini，拼成路径
7. 最后也是最重要的一点：这个功能实现起来其实很简单，希望你尽量简洁完成，在 processor.py 已经解析过 excel 表格的内容了，只需根据解析出来的数据进行判断就可以了。
