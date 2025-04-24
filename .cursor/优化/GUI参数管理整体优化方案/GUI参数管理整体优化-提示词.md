# 生成提示词：ConfigManager 统一参数管理与 GUI 自动化

## 目标

实现一个 ConfigManager，统一管理所有 GUI 参数，并支持参数的自动分类、控件自动生成、参数变动联动、配置持久化、异常处理和未来扩展。

## 详细要求

### 1. 参数分类与默认值

- 所有参数集中在 ConfigManager.DEFAULT_CONFIG 中，必须有默认值。
- 参数分为三类：

1. 路径参数（reset 时不变，仅在 reset_to_default 中批量设置）：

- input_path
- output_path
- ini_output
- w3x2lni_path

1. 功能参数（主界面 QCheckBox）：

- convert_to_ts
- convert_to_lua
- convert_to_ini
- convert_ini_to_excel
- baize_frame
- parse_w3x

1. 辅助参数（文件 → 高级设置）：

- recursive
- log_level
- sort_by_alpha
- font_size

### 2. 参数管理

- ConfigManager 负责所有参数的增删改查，提供 get、set、get_all 等接口。
- 参数分类、默认值、控件类型等元信息应在 ConfigManager 中统一定义，便于自动化和扩展。
- 支持参数的导入导出、备份和恢复，方便迁移和还原配置。

### 3. GUI 控件自动生成与联动

- 主界面功能参数 QCheckBox、config_dialog.py 中的辅助参数控件，均应根据 ConfigManager 的参数元信息自动生成。
- 支持未来扩展更多控件类型（如 QLineEdit、QComboBox 等），每个参数应有控件类型字段。
- 控件与参数双向绑定：控件变动时自动更新 ConfigManager，ConfigManager 变动时自动刷新控件显示。

### 4. 参数变动与持久化

- 参数变动时，ConfigManager 自动保存到 config.cfg 文件，并通知相关 GUI 界面刷新。
- 支持信号槽或回调机制，确保参数变动时界面和数据始终同步。
- 文件 → 高级设置点击 reset、ConfigManager.config 参数变化时，主界面和高级设置界面均能自动刷新。

### 5. 扩展性与未来需求

- 参数元信息应支持类型、分组、控件类型、只读/隐藏/国际化等标签，便于未来扩展。
- 支持参数分组显示、动态校验、国际化、权限控制等高级需求。

### 6. 异常处理与日志

- 所有参数操作、文件读写、GUI 联动等关键流程必须捕获异常，打印详细堆栈和当前参数，便于排查。
- 重要操作应有日志记录，便于后续维护和问题追踪。

### 7. 单元测试与可维护性

- 为 ConfigManager 和参数联动部分编写单元测试，确保参数管理、GUI 联动、配置持久化等功能的健壮性。
- 代码需遵循 PEP8、类型注解、模块化、详细注释和文档字符串等最佳实践。

---

请严格按照以上提示词实现 ConfigManager 统一参数管理和 GUI 自动化，确保所有细节和扩展性要求均被覆盖。如有不明之处，需主动与需求方沟通确认。
