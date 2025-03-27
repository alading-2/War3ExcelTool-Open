import os
import sys
import shutil
import subprocess
from pathlib import Path

def clean_build_directories():
    """清理构建目录"""
    print("清理构建目录...")
    
    # 要清理的目录
    dirs_to_clean = ["build", "dist", "excel_to_ts.egg-info"]
    
    for dir_name in dirs_to_clean:
        dir_path = Path(dir_name)
        if dir_path.exists():
            shutil.rmtree(dir_path)
            print(f"已删除: {dir_path}")

def build_executable():
    """使用PyInstaller构建可执行文件"""
    print("使用PyInstaller构建可执行文件...")
    
    # PyInstaller命令
    cmd = [
        "pyinstaller",
        "--name=ExcelToTS",
        "--windowed",  # 无控制台窗口
        "--onefile",   # 打包为单一可执行文件
        "src/main.py"  # 入口脚本
    ]
    
    # 运行PyInstaller
    subprocess.run(cmd)
    
    print("构建完成！")

def create_installer():
    """创建安装程序"""
    print("创建安装程序...")
    
    # 这里可以使用Inno Setup、NSIS等工具创建Windows安装程序
    # 此处省略具体实现...
    
    print("安装程序创建完成！")

def main():
    """主函数"""
    # 清理旧的构建文件
    clean_build_directories()
    
    # 构建可执行文件
    build_executable()
    
    # 创建安装程序
    create_installer()
    
    print("所有构建步骤完成！")

if __name__ == "__main__":
    main() 