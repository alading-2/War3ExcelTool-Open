新功能：excel 转 lua，excel 转 json

1.这两个功能跟 excel 转 ts 类似，实现起来要更加简单，只需要输出数据的对象就行，输出的文件名参考 ts*generator.py ，只是扩展名变了，数据类的名字跟 ts 一样：data_name=f"{extension}\_data*{excel_name}"

2.json 直接根据字典 data_handler.py 的 get_data_dict 输出

3.这两个功能实现起来应该很简单，不要复杂化

4.新加功能参数 convert_to_json，默认 False，同时更改两个 config 文件

# 优化后的 Excel 转 Lua/JSON 功能实现指南

## 功能概述

开发 Excel 表格数据转换为 Lua 表和 JSON 对象的功能，作为对现有 Excel 转 TS 功能的补充。

## 详细要求

### 1. 数据结构与命名规范

- 输出文件命名: 参考 ts_generator.py 的命名逻辑，仅将扩展名改为.lua 和.json
- 数据变量命名: 保持与 TS 格式一致，使用 xlsx*data*{excel_name}形式
- Lua 格式: 生成 Lua 表结构，不需要类型定义，仅数据部分
- JSON 格式: 直接基于 data_handler.py 的 get_data_dict()方法返回的字典结构生成

### 2. 数据处理流程

- 数据源: 两种格式均使用 data_handler.py 处理后的数据
- Lua 生成器: 创建 lua_generator.py，参考 ts_generator.py 的数据处理逻辑
- JSON 生成器: 创建 json_generator.py，直接使用 Python 的 json 库序列化数据

### 3. 配置参数

- 新增 convert_to_json 参数，默认值为 False
- 确认 convert_to_lua 参数是否已存在，若不存在则添加，默认值为 False
- 在两个配置文件中同步更新：src/config.cfg 和 resource/resource/config.cfg

### 4. 处理器集成

- 在 processor.py 中添加对新生成器的支持
- 根据配置参数决定是否调用相应的生成器

### 5. 输出格式示例

- lua:

```
  xlsx_keys_table_ability = {
      "name", "icon", "method", "range", "area", "cool", "cost", "action", "targettp", "cast", "type"
  }

  xlsx_data_table_ability = {
      abil_1 = {
          name = "abil_1",
          icon = "ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp",
          method = "点",
          range = 500,
          -- 其他属性...
      },
      -- 其他数据...
  }
```

- json:

```
  {
      "xlsx_keys_table_ability": ["name", "icon", "method", "range", "area", "cool", "cost", "action", "targettp", "cast", "type"],
      "xlsx_data_table_ability": {
          "abil_1": {
              "name": "abil_1",
              "icon": "ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp",
              "method": "点",
              "range": 500,
              // 其他属性...
          },
          // 其他数据...
      }
  }
```
