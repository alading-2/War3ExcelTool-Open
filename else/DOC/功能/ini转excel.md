ini 转 excel

1.首先通过 parse_ini 解析 ini 文件，返回 ConfigParser 对象

2.通过 ini 判断是哪个种类的物编的方式：通过文件名

3.物编的所有类型：单位/unit，物品/item，技能/ability，buff，可破坏物/destructable，科技/upgrade，这里/是或的意思，也就是名字中包含单位或者 unit 算一类

4.新加函数：可以通过 ini 文件名识别到指定的种类，比如：单位 123.ini,unit1ak.ini，都能识别成 unit 类型，也就是 ini 文件名中包含上述物编类型中的指定字符串就行

5.解析后的 ConfigParser 对象存到一个字典中 Dict[str,ConfigParser]，字典的索引是 unit/item/ability/buff/destructable/upgrade

6.如果有多个同类物编 ini 文件，比如 unit1.ini,unit2.ini,unit3.ini，则将这些同类 ini 文件数据整合，即他们解析后的 ConfigParser 对象数据叠加，这里要在 IniParser 新加一个将两个 ConfigParser 对象数据叠加的函数：data_add，self.config 是本类中的 ConfigParser 对象，需要传入一个参数：data:ConfigParser，将 data 的数据加进 self.config，要注意如果 self.config 和 data 有相同的 section 则不再添加，用 section in self.config 来判断，若有相同 section 要用 logger.warning 记录。

7.如果 convert_ini_to_excel=true，且上述字典不为空，则将 resource\resource\物编.xlsx 复制到对应输出路径，最后的数据也写进这里

8.最后将字典所有数据统一写进一个表的多个 sheet 中，注意物编类型，比如 unit 类型写进单位 sheet 中。
