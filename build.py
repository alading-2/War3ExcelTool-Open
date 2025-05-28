import os
import sys
import shutil
import subprocess
import psutil

from pathlib import Path
from src.utils.project_info import ProjectInfo  # 导入项目信息
import logging

# 获取日志记录器
logger = logging.getLogger(__name__)


def close_running_exe(exe_name=f"{ProjectInfo.name}.exe"):
    """
    检查并关闭正在运行的同名exe
    
    Args:
        exe_name: 要检查的exe名称
    
    Returns:
        bool: 是否成功关闭进程
    """
    logger.info(f"检查是否有 {exe_name} 正在运行...")

    # 遍历所有进程
    for proc in psutil.process_iter(['pid', 'name']):
        try:
            # 检查进程名是否匹配
            if proc.info['name'].lower() == exe_name.lower():
                logger.info(
                    f"找到正在运行的 {exe_name}，PID: {proc.info['pid']}，正在关闭...")
                proc.terminate()  # 尝试正常终止进程

                # 等待进程终止，最多等待5秒
                try:
                    proc.wait(timeout=5)
                    logger.info(f"已成功关闭 {exe_name}")
                    return True
                except psutil.TimeoutExpired:
                    # 如果超时，强制结束进程
                    logger.info(f"正常关闭超时，正在强制结束 {exe_name}...")
                    proc.kill()
                    return True
        except (psutil.NoSuchProcess, psutil.AccessDenied,
                psutil.ZombieProcess):
            continue

    logger.info(f"没有找到正在运行的 {exe_name}")
    return False


def open_executable(exe_path):
    """
    打开指定的可执行文件
    
    Args:
        exe_path: 可执行文件路径
    """
    if os.path.exists(exe_path):
        logger.info(f"正在打开 {exe_path}...")
        # 使用系统默认程序打开
        if sys.platform == 'win32':
            os.startfile(exe_path)
        else:
            # 在类Unix系统上使用subprocess
            subprocess.Popen(['open', exe_path])
    else:
        logger.error(f"错误: 找不到可执行文件 {exe_path}")


def build_executable():
    """使用PyInstaller构建可执行文件"""
    logger.info("使用PyInstaller构建可执行文件...")

    # 添加UPX路径（如果有）
    os.environ['UPX_DIR'] = r'E:\upx-4.2.0-win64'

    # PyInstaller命令
    cmd = [
        "pyinstaller",
        "--clean",
        "--workpath=package\\build",
        f"--distpath=package\\{ProjectInfo.name}",
        "War3ExcelTool.spec",
    ]

    # 运行PyInstaller
    subprocess.run(cmd)

    # 构建完成后复制README.md到输出目录
    dist_dir = f"package\\{ProjectInfo.name}"
    if os.path.exists("README.md"):
        shutil.copy("README.md", dist_dir)
        logger.info(f"已复制README.md到 {dist_dir}")

    # 创建初始配置文件
    config_path = os.path.join(dist_dir, "config.cfg")
    if not os.path.exists(config_path):
        logger.info(f"在打包目录中创建初始配置文件: {config_path}")
        try:
            # 从项目中复制默认配置
            default_config = "resource/resource/config.cfg"
            if os.path.exists(default_config):
                shutil.copy(default_config, config_path)
                logger.info(f"已从 {default_config} 复制配置文件")
            else:
                # 如果默认配置不存在，报错
                logger.error(f"错误: 找不到默认配置文件: {default_config}")
        except Exception as e:
            logger.error(f"创建配置文件时出错: {e}")

    # 确保关键资源文件存在
    logger.info("检查并确保关键资源文件存在...")
    resource_files = {
        # 源文件路径 : 目标文件路径
        "resource/resource/editor_info/editor_info_map.ini":
        os.path.join(dist_dir, "resource/editor_info/editor_info_map.ini"),
        "resource/resource/editor_info/editor_info_map.json":
        os.path.join(dist_dir, "resource/editor_info/editor_info_map.json"),
        "resource/resource/excel_to_ini/excel_to_ini_template.ini":
        os.path.join(dist_dir,
                     "resource/excel_to_ini/excel_to_ini_template.ini"),
        "resource/resource/excel_to_ini/基础命令id.txt":
        os.path.join(dist_dir, "resource/excel_to_ini/基础命令id.txt"),
        "resource/resource/物编.xlsx":
        os.path.join(dist_dir, "resource/物编.xlsx"),
        # 添加配置文件复制规则
        "resource/resource/config.cfg":
        os.path.join(dist_dir, "resource/resource/config.cfg"),
    }

    for src_path, dest_path in resource_files.items():
        if os.path.exists(src_path):
            # 确保目标目录存在
            os.makedirs(os.path.dirname(dest_path), exist_ok=True)
            # 复制文件
            shutil.copy(src_path, dest_path)
            logger.info(f"已复制资源文件: {src_path} -> {dest_path}")
        else:
            logger.warning(f"警告: 资源文件不存在: {src_path}")

    logger.info("构建完成！")


def create_installer():
    """创建安装程序"""
    logger.info("创建安装程序...")

    # 这里可以使用Inno Setup、NSIS等工具创建Windows安装程序
    # 此处省略具体实现...

    logger.info("安装程序创建完成！")


def main():
    """主函数"""
    # 检查并关闭正在运行的程序
    close_running_exe(f"{ProjectInfo.name}.exe")

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

    logger.info("所有构建步骤完成！")


if __name__ == "__main__":
    main()
