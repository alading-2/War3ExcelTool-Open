import argparse

parser = argparse.ArgumentParser(prog="myprogram")
parser.add_argument("-f", "--foo", nargs="+", help="foo of the %(prog)s program")
args = parser.parse_args()
print(args)
print(args.foo)
for i in range(len(args.foo)):
    print(f"arg{i}={sys.argv[i]}")
