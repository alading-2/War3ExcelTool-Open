imports = []  # 存储import语句
other_code = []  # 存储其他代码
code = """import ActorTypeUtil from "@/ActorTypeUtil";
    for (let datum of data) {
        if (datum.id) {
            ActorTypeUtil.registerActorType(datum as any);
        }
    }"""

# 提取import语句（以"import "开头的行）
# 1. 使用split('\n')将代码分割为多行
# 2. 遍历每一行，找出以'import '开头的行
# 3. 使用strip()去除行首尾的空白字符
import_lines = [
    line.strip() for line in code.split('\n')
    if line.strip().startswith('import ')
]
# 将提取的import语句添加到导入列表中
imports.extend(import_lines)

# 提取非import语句（不是空行且不以"import "开头的行）
other_lines = [
    line.strip() for line in code.split('\n')
    if line.strip() and not line.strip().startswith('import ')
]
# 将提取的其他代码添加到其他代码列表中
other_code.extend(other_lines)
print("imports", imports)
print("other_code", other_code)
