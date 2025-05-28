import subprocess
import sys
import os
import importlib


def check_library(library_name):
    """检查库是否已安装"""
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
    """从requirements.txt文件读取所需的库列表"""
    try:
        with open('requirements.txt', 'r', encoding='utf-8') as f:
            # 读取每一行，去除空白字符，并只保留包名（去除版本号）
            libraries = []
            package_specs = []
            for line in f:
                line = line.strip()
                if line and not line.startswith('#'):  # 忽略空行和注释
                    # 分割包名和版本号，只保留包名
                    lib_name = line.split('>=')[0].split('==')[0].split(
                        '<')[0].strip()
                    libraries.append(lib_name.lower())  # 转换为小写以确保一致性
                    package_specs.append(line)  # 保留完整的包规格（包括版本号）
            return libraries, package_specs
    except FileNotFoundError:
        print('错误：未找到 requirements.txt 文件')
        return [], []
    except Exception as e:
        print(f'读取 requirements.txt 时出错：{str(e)}')
        return [], []


def install_missing_libraries():
    """安装缺失的库"""
    print('==== 检查并安装缺失的库 ====')

    # 从requirements.txt读取库列表
    libraries, package_specs = read_requirements()

    if not libraries:
        print('无法获取所需库列表，请确保 requirements.txt 文件存在且格式正确')
        return False

    # 检查哪些库缺失
    missing_libs = []
    missing_specs = []

    for i, lib in enumerate(libraries):
        if not check_library(lib):
            missing_libs.append(lib)
            missing_specs.append(package_specs[i])

    if not missing_libs:
        print('所有库已安装，无需下载')
        return True

    print(f'\n发现 {len(missing_libs)} 个缺失的库，准备安装:')
    for lib in missing_libs:
        print(f'- {lib}')

    # 安装缺失的库
    success_count = 0
    failed_count = 0

    for spec in missing_specs:
        print(f'\n正在安装: {spec}')

        # 使用pip安装，添加--trusted-host参数以避免SSL证书问题
        cmd = [
            sys.executable, "-m", "pip", "install", "--trusted-host",
            "pypi.org", "--trusted-host", "files.pythonhosted.org", spec
        ]

        try:
            subprocess.run(cmd, check=True)
            print(f'✓ 成功安装: {spec}')
            success_count += 1
        except subprocess.CalledProcessError as e:
            print(f'✗ 安装失败: {spec}')
            print(f'错误信息: {e}')
            print(f'建议：')
            print(f'1. 检查包名是否正确')
            print(
                f'2. 尝试手动安装: pip install {spec} --trusted-host pypi.org --trusted-host files.pythonhosted.org'
            )
            failed_count += 1

    print('\n==== 安装完成 ====')
    print(f'- 成功安装: {success_count} 个包')
    print(f'- 安装失败: {failed_count} 个包')

    if failed_count > 0:
        print('\n有些包安装失败，请检查上面的错误信息。')
        return False
    else:
        print('\n所有缺失的依赖安装成功！')
        return True


if __name__ == "__main__":
    print("War3ExcelTool 缺失依赖安装工具")
    print("===========================")
    install_missing_libraries()
    print("\n你可以运行 'python check_libraries.py' 来验证安装结果。")
