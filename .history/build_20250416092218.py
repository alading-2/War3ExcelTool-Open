import os
import sys
import shutil
import subprocess
import time
import psutil
from pathlib import Path

def close_running_exe(exe_name="War3ExcelTool.exe"):
    """
    检查并关闭正在运行的同名exe
    
    Args:
        exe_name: 要检查的exe名称
    
    Returns:
        bool: 是否成功关闭进程
    """
    print(f"检查是否有 {exe_name} 正在运行...")
    
    # 遍历所有进程
    for proc in psutil.process_iter(['pid', 'name']):
        try:
            # 检查进程名是否匹配
            if proc.info['name'].lower() == exe_name.lower():
                print(f"找到正在运行的 {exe_name}，PID: {proc.info['pid']}，正在关闭...")
                proc.terminate()  # 尝试正常终止进程
                
                # 等待进程终止，最多等待5秒
                try:
                    proc.wait(timeout=5)
                    print(f"已成功关闭 {exe_name}")
                    return True
                except psutil.TimeoutExpired:
                    # 如果超时，强制结束进程
                    print(f"正常关闭超时，正在强制结束 {exe_name}...")
                    proc.kill()
                    return True
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            continue
    
    print(f"没有找到正在运行的 {exe_name}")
    return False

def open_executable(exe_path):
    """
    打开指定的可执行文件
    
    Args:
        exe_path: 可执行文件路径
    """
    if os.path.exists(exe_path):
        print(f"正在打开 {exe_path}...")
        # 使用系统默认程序打开
        if sys.platform == 'win32':
            os.startfile(exe_path)
        else:
            # 在类Unix系统上使用subprocess
            subprocess.Popen(['open', exe_path])
    else:
        print(f"错误: 找不到可执行文件 {exe_path}")

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
    
    # 添加UPX路径（如果有）
    os.environ['UPX_DIR'] = r'E:\upx-4.2.0-win64'
    
    # PyInstaller命令
    cmd = [
        "pyinstaller",
        "--clean",
        "War3ExcelTool.spec",
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
    # 检查并关闭正在运行的程序
    close_running_exe("War3ExcelTool.exe")
    
    # 清理旧的构建文件
    clean_build_directories()
    
    # 构建可执行文件
    build_executable()
    
    # 创建安装程序
    create_installer()
    
    # 打开新生成的可执行文件
    # exe_path = os.path.join("dist", "War3ExcelTool.exe")
    # if os.path.exists(exe_path):
    #     # 等待一秒确保文件已完全写入
    #     time.sleep(1)
    #     open_executable(exe_path)
    
    print("所有构建步骤完成！")

if __name__ == "__main__":
    main()