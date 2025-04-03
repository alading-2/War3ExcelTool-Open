import os
import subprocess

# 设置工作目录为当前脚本所在目录
os.chdir(os.path.dirname(os.path.abspath(__file__)))

# 命令行参数
cmd = [
    'pyinstaller',
    '--onefile',
    '--name=SimpleTest',
    'simple_app.py'
]

# 执行命令
print("Starting PyInstaller...")
result = subprocess.run(cmd, capture_output=True, text=True)

# 输出结果
print("\nSTDOUT:")
print(result.stdout)

print("\nSTDERR:")
print(result.stderr)

print(f"\nExit code: {result.returncode}")

# 检查是否成功
if result.returncode == 0:
    print("\nBuild successful! Check the 'dist' folder for the executable.")
else:
    print("\nBuild failed. See the error messages above.")

# 列出dist目录内容
print("\nContents of 'dist' directory:")
try:
    for file in os.listdir('dist'):
        print(f" - {file}")
except Exception as e:
    print(f"Error listing 'dist' directory: {e}") 