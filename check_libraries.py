import importlib
import sys
import os


def check_library(library_name):
    try:
        importlib.import_module(library_name)
        return True
    except ImportError:
        # 特殊情况处理：pillow库实际import为PIL
        if library_name == 'pillow':
            try:
                importlib.import_module('PIL')
                return True
            except ImportError:
                return False
        # 特殊情况处理：pywin32库实际import为win32api等
        elif library_name == 'pywin32':
            try:
                importlib.import_module('win32api')
                return True
            except ImportError:
                return False
        return False


def read_requirements():
    """
    从requirements.txt文件读取所需的库列表
    返回：库名列表（不包含版本号）
    """
    try:
        with open('requirements.txt', 'r', encoding='utf-8') as f:
            # 读取每一行，去除空白字符，并只保留包名（去除版本号）
            libraries = []
            for line in f:
                line = line.strip()
                if line and not line.startswith('#'):  # 忽略空行和注释
                    # 分割包名和版本号，只保留包名
                    lib_name = line.split('>=')[0].split('==')[0].split(
                        '<')[0].strip()
                    libraries.append(lib_name.lower())  # 转换为小写以确保一致性
            return libraries
    except FileNotFoundError:
        print('错误：未找到 requirements.txt 文件')
        return []
    except Exception as e:
        print(f'读取 requirements.txt 时出错：{str(e)}')
        return []


print('==== 库安装状态检查 ====')

# 从requirements.txt读取库列表
required_libraries = read_requirements()

if not required_libraries:
    print('无法获取所需库列表，请确保 requirements.txt 文件存在且格式正确')
    sys.exit(1)

installed = []
not_installed = []

for lib in required_libraries:
    is_installed = check_library(lib)
    if is_installed:
        installed.append(lib)
    else:
        not_installed.append(lib)

print('\n已安装的库:')
for lib in installed:
    print(f'- {lib}')

print('\n未安装的库:')
for lib in not_installed:
    print(f'- {lib}')

print('\n==== 检查完成 ====')
