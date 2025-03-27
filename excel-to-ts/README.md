# Excel 到 TypeScript 转换工具

## 项目简介

Excel 到 TypeScript 转换工具是一个 Python 应用程序，可以将 Excel 表格数据自动转换为 TypeScript 代码。这个工具专为需要从 Excel 数据生成 TypeScript 代码的开发人员设计。

## 主要功能

- **Excel 解析**：自动解析 Excel 文件，根据指定规则提取数据
- **类型推断**：自动判断数据类型，支持 number、string、boolean 和复杂类型
- **颜色处理**：支持提取并转换 Excel 中的文本颜色信息
- **代码生成**：生成符合规范的 TypeScript 接口和类
- **批量处理**：支持批量处理多个 Excel 文件
- **图形界面**：提供友好的用户界面，便于操作

## 安装方法

### 使用可执行文件（推荐）

1. 下载最新的安装包
2. 运行安装程序，按照提示进行安装
3. 安装完成后，从开始菜单或桌面快捷方式启动程序

### 从源码安装

1. 克隆仓库：

   ```
   git clone https://github.com/yourusername/excel-to-ts.git
   cd excel-to-ts
   ```

2. 安装依赖：

   ```
   pip install -r requirements.txt
   ```

3. 运行程序：
   ```
   python -m src.main
   ```

## 使用方法

### 图形界面

1. 启动程序
2. 选择包含 Excel 文件的输入目录
3. 选择 TypeScript 文件的输出目录
4. 勾选"递归处理子目录"选项（如果需要）
5. 点击"开始转换"按钮
6. 转换过程将在操作日志中显示

### 命令行

程序也支持命令行操作：

```
excel_to_ts -i /path/to/input -o /path/to/output -r
```

参数说明：

- `-i, --input`：输入目录
- `-o, --output`：输出目录
- `-r, --recursive`：递归处理子目录
- `--log-level`：日志级别，可选值为 DEBUG, INFO, WARNING, ERROR, CRITICAL
- `--batch-size`：批处理大小

## Excel 文件格式要求

为了正确转换，Excel 文件需要符合以下格式：

1. 第一行作为注释
2. 第二行作为数据的 key 值
3. 第三行及以下为实际数据
4. 第一列作为数据 ID 用于索引
5. 忽略首列为"//"的行
6. 空数据单元格不会被提取

## 生成的 TypeScript 代码

假设 Excel 文件名为"演员单位.xlsx"，生成的 TypeScript 文件将命名为"xlsx\_演员单位.ts"，包含：

1. 接口索引常量：`xlsx_inte_keys_演员单位`
2. 接口定义：`xlsx_inte_演员单位`
3. 数据常量：`xlsx_data_演员单位`
4. 类定义：`xlsx_演员单位`，包含 Start 方法

## 颜色代码支持

工具支持从 Excel 提取文本颜色，并转换为特定格式。例如，红色文本将转换为：

```typescript
"|cffff0000文本内容|r";
```

支持的颜色代码：

- 红色：`|cffff0000`
- 黄色：`|cffffff00`
- 绿色：`|cff00ff00`
- 蓝色：`|cff0000ff`
- 紫色：`|cffff00ff`
- 黑色：`|c00000000`
- 白色：`|cffffffff`

## 常见问题

1. **Q: 为什么我的 Excel 文件没有被正确转换？**  
   A: 请确保 Excel 文件格式符合要求，特别是第一行为注释，第二行为键名。

2. **Q: 能否自定义输出文件的命名格式？**  
   A: 当前版本不支持自定义命名格式，未来版本可能添加此功能。

3. **Q: 支持哪些 Excel 文件格式？**  
   A: 支持.xlsx 格式，不支持旧的.xls 格式。

## 贡献指南

欢迎贡献代码或提出建议！请遵循以下步骤：

1. Fork 仓库
2. 创建功能分支：`git checkout -b feature/your-feature`
3. 提交更改：`git commit -m 'Add your feature'`
4. 推送到分支：`git push origin feature/your-feature`
5. 提交 Pull Request

## 许可证

本项目采用 MIT 许可证。详情请参阅[LICENSE](LICENSE)文件。
