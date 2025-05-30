# GUI 模式参数管理整体优化

现在参数管理混乱，需要整体优化模式

最终目的：在 ConfigManager 统一管理，不需要到 main_window.py 或 config_dialog.py 单独配置

0.现在所有参数放在 ConfigManager.DEFAULT_CONFIG，并且有默认值

我希望能分成 3 种参数

(1)reset 不更改的参数：也就是 4 个路径参数，在 reset_to_default 中使用，直接用 for 设置，不用一个个写：

"input_path"，"output_path"，"ini_output"，"w3x2lni_path"

(2)功能参数：要创建 main_window 的 QCheckBox

"convert_to_ts": False, # 是否执行 Excel -> TS 转换

"convert_to_lua": False, # 是否执行 Excel -> Lua 转换

"convert_to_ini": False, # 是否执行 Excel -> Ini 转换 "convert_ini_to_excel": False, # 是否执行 Ini -> Excel 转换 "baize_frame": True, # 白泽框架

"parse_w3x": False, # 是否解析 w3x

(3)辅助参数

辅助参数添加到文件 → 高级设置，也就是 config_dialog.py 里面

"recursive": True, # 是否递归处理输入目录

"log_level": "INFO", # 日志级别

"sort_by_alpha": False, # 生成表格是否按字母排序

"font_size": 14, # 字体大小

3 种参数在 ConfigManager 分别设置 3 个列表按顺序分类管理

既然有了参数类型和默认值，我希望可以直接通过 3 种参数进行 GUI 初始化

1.recursive 从功能参数改到辅助参数

2.用 ConfigManager 统一管理 GUI 参数显示

main_window 的 QCheckBox 对应选项的值统一从 ConfigManager.get 获取

start_conversion 的 config 直接从 ConfigManager.get_all 获取，而不是用 isChecked 判断

3.GUI 参数动态变化。

在文件 → 高级设置点击 reset 时、ConfigManager.config 参数一有变化时，主界面的功能参数选项的 QCheckBoxGUI 和 config_dialog.py 的辅助参数显示跟着变，同时直接保存到 config.cfg 文件

相同地，点击 QCheckBoxGUI 按钮时，用 ConfigManager.set 直接更新对应的参数，同时保存到 config.cfg 文件

### 总结与优化建议

#### 1. 现有方案总结

您的意图非常清晰：希望将所有 GUI 参数统一交由 ConfigManager 管理，并按“路径参数”“功能参数”“辅助参数”三类进行分类。每类参数有独立的默认值和用途，所有参数的增删改查、GUI 控件的生成、参数变动时的同步刷新和持久化都由 ConfigManager 统一负责。这样可以极大减少 main_window.py 和 config_dialog.py 中的重复和混乱逻辑，提升代码的可维护性和扩展性。

#### 2. 方案亮点

- 参数分类清晰，便于管理和扩展。
- 默认值集中管理，避免分散在各处。
- GUI 控件（如 QCheckBox）可根据参数自动生成，减少硬编码。
- 参数变动时，ConfigManager 负责同步刷新 GUI 和保存配置文件，保证界面和数据一致。
- 所有参数的读取、修改、保存都通过 ConfigManager 的统一接口完成，便于后续维护和测试。

#### 3. 需要进一步澄清和优化的地方

1. 参数类型的扩展性

目前分为三类参数，未来如果有“只读参数”“隐藏参数”或“高级参数”，是否容易扩展？建议在 ConfigManager 中为每个参数增加“类型”或“标签”字段，便于后续扩展和自动化处理。

1. GUI 控件的自动生成机制

目前只提到 QCheckBox，未来如果有其他类型控件（如 QLineEdit、QComboBox 等），建议为每个参数增加“控件类型”字段，并在 ConfigManager 中提供控件工厂方法，实现控件的自动生成和绑定。

1. 参数变动的事件机制

ConfigManager 如何通知 GUI 刷新？建议采用信号槽机制（如 PyQt 的 Signal），或者回调机制，确保参数变动时能自动刷新相关界面，避免手动刷新遗漏。

1. 参数的持久化和恢复

建议 ConfigManager 支持参数的导入导出、备份和恢复，方便用户迁移和还原配置。

提示词应涵盖以下几个方面：

- 参数分类（路径参数、功能参数、辅助参数）及其默认值
- 所有参数由 ConfigManager 统一管理，支持增删改查
- GUI 控件（如 QCheckBox 等）根据参数自动生成
- 参数变动时，ConfigManager 负责同步刷新 GUI 和保存配置
- 支持参数的导入导出、备份和恢复
- 未来可扩展性（如控件类型、参数分组、国际化等）
- 异常处理和日志记录
- 单元测试和可维护性要求
