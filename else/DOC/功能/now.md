任务：将 `pretreatment.py` 中的预处理功能集成到 `data_handler.py` 中。

具体要求：

1. **集成位置：** 在 `data_handler.py` 文件中，找到“检查 DataFrame 是否有足够的行”的逻辑之后，但在“从第二行提取键名(列名)”的逻辑之前插入预处理步骤。
2. **核心逻辑：**
   - 调用 `pretreatment.py` 中的 `extract_preprocessor_directives` 函数，处理 DataFrame 的第一行（或指定的预处理指令行），以识别需要预处理的列及其规则，生成预处理规则字典。
   - 调用 `pretreatment.py` 中的 `apply_column_preprocessors` 函数，使用上一步生成的规则字典，对整个 DataFrame（除了指令行）进行清理。清理操作应包括移除单元格中的预处理指令、换行符 (`\n`) 和首尾多余的空格。
3. **审查与优化 `pretreatment.py`：**
   - **明确指令格式 (`pattern`)：** 在代码注释或文档中清晰定义预处理指令的具体格式（是固定字符串、正则表达式，还是其他模式？）。
   - **字符串清理：** 检查 `apply_column_preprocessors` 或其调用的辅助函数中，用于清理单元格值的逻辑（例如 `replace(pattern, "").replace("\n","").strip()`）。评估其健壮性，并考虑使用正则表达式（如 `re.sub`）进行更灵活或一次性的替换，特别是处理指令本身可能包含空格或换行符的情况。
   - **DataFrame 修改效率：** 检查 `apply_column_preprocessors` 修改 DataFrame 的方式。如果使用了基于 `iloc` 或 `loc` 的显式循环，请考虑将其重构为更高效、更符合 Pandas 习惯用法的向量化操作，如 `.apply()`, `.applymap()` 或针对字符串列的 `.str` 系列方法，以避免性能问题和潜在的 `SettingWithCopyWarning`。
4. **健壮性与维护性：**
   - 在 `pretreatment.py` 中添加适当的错误处理（例如，处理非字符串单元格、无效指令格式）。
   - 考虑添加日志记录以追踪预处理过程。
   - （可选，推荐）为 `extract_preprocessor_directives` 和 `apply_column_preprocessors` 编写单元测试。
5. **文档更新：** 在 `README.md` 或相关模块的文档字符串 (docstrings) 中，更新关于预处理逻辑、指令格式和使用方法的说明。

请根据上述要求，修改 `data_handler.py` 和 `pretreatment.py` 文件。
