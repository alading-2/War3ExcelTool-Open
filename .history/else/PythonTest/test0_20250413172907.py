import argparse
import sys

parser = argparse.ArgumentParser(
    prog="myprogram",
    # formatter_class=argparse.ArgumentDefaultsHelpFormatter,  # 显示默认值
)
parser.add_argument("-a", type=int, default=42, help="FOO!")
parser.add_argument("bar", nargs="*", default=[1, 2, 3], help="BAR!")
args = parser.parse_args()
print("")
print(args)
print(args.bar)
for i in range(len(sys.argv)):
    print(f"arg{i}={sys.argv[i]}")
