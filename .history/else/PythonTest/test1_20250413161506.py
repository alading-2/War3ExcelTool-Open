import argparse

print("脚本已启动！")
parser = argparse.ArgumentParser(description="War3Excel工具")
# 修改1：将input/output参数设为必需
parser.add_argument(
    "-i", "--input", required=True, help="设置输入目录"
)  # 添加required=True
parser.add_argument(
    "-o", "--output", required=True, help="设置输出目录"
)  # 添加required=True
# 添加递归处理选项，用-r或--recursive指定，是一个开关型参数
parser.add_argument(
    "-r",
    "--recursive",
    action="store_true",  # 指定这是一个布尔标志，不需要值
    help="递归处理子目录中的Excel文件",
)
# 添加日志级别参数，用--log-level指定，有限定的选项值
parser.add_argument(
    "--log-level",
    choices=["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],  # 限制可选值
    default="INFO",  # 默认值为INFO
    help="日志级别",
)
# 添加批处理大小参数，用--batch-size指定，必须是整数
parser.add_argument(
    "--batch-size",
    type=int,  # 指定参数类型为整数
    default=10,  # 默认值为10
    help="批处理大小",
)

# 修改2：添加异常处理
try:
    args = parser.parse_args()
    print(args)
except SystemExit:
    print("\n参数解析失败，请检查参数格式")
    raise
