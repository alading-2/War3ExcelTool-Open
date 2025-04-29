项目功能：Excel 表格数据自动转换为 War3 物编 INI 代码

核心目标：

根据特定的 Excel 表格数据，生成符合魔兽争霸 III 物编格式的 .ini 文件。整个过程应尽量简洁，核心逻辑基于 processor.py 已解析的 Excel 数据进行判断和处理。

输入：

1. Excel 文件： 包含需要转换的物编数据。

- 物编表格判断依据：
- 白泽框架下，文件名包含 table，且 Sheet 名在 OBJECT_TYPE_MAPPING （如 unit, ability, item）中。
- Sheet 的第二行（Key 值行）包含 id 和 \_parent 列。
- 需要记录每个 INI 数据来源于哪个 Excel 文件的哪个 Sheet，用于错误信息显示。

1. 物编模板： resource\resource\excel_to_ini\excel_to_ini_template.ini。
2. 基础命令 ID 列表： resource\resource\excel_to_ini\基础命令 id.txt (需要解析并存入列表)。
3. 物编选项映射： resource\resource\editor_info_map.ini (用于匹配 Excel 列名和 INI 字段)。
4. 辅助参数： 玩家数量 (默认为 5，用于计算基础技能数量)。
5. 导出路径： ini_output (可选，用于复制生成的 INI 文件)。

处理逻辑 (基于已解析的 Excel 数据)：

1. 解析 Excel： processor.py 已经完成此步骤，只需使用其解析结果。
2. 判断物编类型： 根据 Sheet 名或 Excel 列 (id, \_parent) 判断物编类型 (unit, ability, item 等)，参考 ini_parser.py 的 OBJECT_TYPE_MAPPING。
3. 加载模板： 根据物编类型加载对应的 INI 模板部分。
4. 数据填充与转换：

- 遍历 Excel 数据行，为每行数据生成对应的 INI Section。
- 字段匹配： 将 Excel 列名与 resource\resource\editor_info_map.ini 中的物编选项进行小写匹配，将数据写入对应的 INI 字段。
- 特殊字段处理：
- cool1: Excel 数据 / 100。
- collision: 直接使用 Excel 数据。
- scale: 直接使用 Excel 数据。
- spd: 直接使用 Excel 数据。
- acquire: 根据值判断 weapsOn (0 则 weapsOn=0, 否则 acquire=Excel 值, weapsOn=1)。
- model/file: 写入 file=对应数据。
- 数据类型： 根据 War3 INI 规则判断。字符串需加双引号 "..." (包括只有数字的字符串)，数字直接输出。

1. ID 生成 (62 进制)：

- 实现 10 进制转 62 进制和 62 进制转 10 进制函数。
- 根据物编类型和规则生成 4 位 62 进制 ID (如基础技能 ID, 单位/物品/物品技能 ID)。

1. 基础技能生成：

- 根据玩家数量、技能类型 (无目标/单位目标/点目标) 和位置，生成 12\*3\*玩家数量个基础技能物编。
- ID 规则：X/Y/Z + 玩家序号 + 按钮位置 x + 按钮位置 y (均为 0-61 的 62 进制字符)。
- Order 字段：从基础命令 ID 列表按索引取值 (注意取余)。
- 其他字段 (DataB, DataC, targs, DataF, Buttonpos_1, Buttonpos_2, Name) 根据规则填充。

1. 建造技能生成： 生成 4 个，ID 规则 JZTm (m=1-4)，父级 AIbt，其他字段填充。
2. 移动技能生成： 生成 1 个。
3. 物品栏技能生成： 生成 6 个，ID 规则 WPLm (m=1-6)，DataA = m。
4. 马甲单位/基础单位/瞭望塔/物品/物品技能生成： 根据各自规则和 Excel 数据生成，注意 ID 规则和特殊字段处理。

输出：

1. INI 文件： 按物编类型合并生成对应的 .ini 文件 (如 unit.ini, ability.ini, item.ini)。

- 合并策略：遇到相同 Section (War3 物编 ID) 时，跳过并生成错误信息，指明来源 Excel 文件、Sheet 和 Section ID。

1. TS 映射文件：

- 生成 unitid.ts, itemid.ts, itemabil.ts，包含名字与物编 ID 的映射关系。
- ID 起始值：单位 h004，物品 I004，物品技能 A000。

1. 错误信息： 记录合并冲突、无效数据等信息，指明来源。
2. 复制文件： 如果设置了 ini_output 路径，将生成的 INI 文件复制过去。

实现强调：

- 简洁化： 利用 processor.py 已解析的数据，避免重复解析。
- 数据驱动： 核心逻辑是根据已解析的数据进行判断和填充。
- 模块化： 将 ID 转换、INI 字段处理等逻辑封装为函数。

优化建议：

- 数据结构： 考虑使用合适的数据结构 (如字典嵌套) 存储解析后的 Excel 数据和 INI 模板数据，方便查找和修改。
- 配置文件： 将 OBJECT_TYPE_MAPPING 和字段匹配规则 (resource\resource\editor_info_map.ini) 统一管理，减少硬编码。
- 错误处理： 详细记录错误信息，包括行号、列名、Sheet 名、文件名，方便用户排查。
