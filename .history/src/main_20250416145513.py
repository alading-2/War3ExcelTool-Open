import os  # 导入操作系统模块，用于处理文件路径
import sys  # 导入系统模块，用于访问与Python解释器和系统相关的变量和函数
import argparse  # 导入命令行参数解析模块，用于解析命令行参数
from typing import Dict, Any  # 导入类型提示功能
from PyQt5.QtWidgets import QApplication  # 从PyQt5导入QApplication类，用于创建GUI应用

# 从项目中导入自定义模块
from src.ui.main_window import MainWindow  # 导入主窗口界面类
from src.utils.logger import setup_logger  # 导入日志设置函数
from src.utils.config_manager import ConfigManager  # 导入配置管理器类


def parse_args():
    """解析命令行参数

    创建一个参数解析器，定义程序支持的命令行参数，并返回解析结果。
    这允许用户通过命令行选项控制程序的行为。

    Returns:
        解析后的命令行参数对象，包含用户提供的所有选项值
    """
    # 创建一个ArgumentParser对象，用于定义和解析命令行参数
    parser = argparse.ArgumentParser(
        description="War3ExcelTool",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,  # 显示默认值
    )

    # 添加输入目录参数，用-i或--input指定
    parser.add_argument("-i", "--input", required=True, help="设置输入目录")
    # 添加输出目录参数，用-o或--output指定
    parser.add_argument("-o", "--output", required=True, help="设置输出目录")
    # 添加递归处理选项，用-r或--recursive指定，是一个开关型参数
    parser.add_argument(
        "-r",
        "--recursive",
        # * 注意：填了参数-r，存储false，没有填-r，存储true，所以一般不用填-r，要设置为True的时候才填-r
        action="store_false",
        help="递归处理子目录中的Excel文件，默认true",
    )
    # Excel转ts文件
    parser.add_argument(
        "--tots",
        action="store_false",
        help="是否开启Excel转ts，默认True",
    )
    # Excel转lua文件
    parser.add_argument(
        "--tolua",
        action="store_true",
        help="是否开启Excel转lua，默认False",
    )
    # Excel转ini文件
    parser.add_argument(
        "--toini",
        action="store_false",
        help="是否开启Excel转ini，默认True",
    )
    # ini转Excel文件
    parser.add_argument(
        "--toexcel",
        action="store_false",
        help="是否开启Excel转ini，默认True",
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

    # 解析命令行参数并返回结果
    return parser.parse_args()

def closesplash():
    """关闭启动界面"""
    try:
        import pyi_splash
        pyi_splash.close()
    except:
        pass

def main():
    """程序入口点

    这是程序的主函数，负责初始化应用程序，包括：
    1. 解析命令行参数
    2. 加载和更新配置
    3. 设置日志系统
    4. 创建并启动GUI应用

    程序执行从这里开始，直到GUI应用关闭为止。
    """
    
    # 解析命令行参数
    args = parse_args()
    # 创建配置管理器实例并加载配置
    config_manager = ConfigManager()

    # 如果命令行提供了参数，使用这些参数更新配置
    # 这样命令行参数会覆盖配置文件中的设置
    if args.input:  # 如果提供了输入目录
        config_manager.set("input_dir", args.input)
    if args.output:  # 如果提供了输出目录
        config_manager.set("output_dir", args.output)
    if args.recursive:  # 如果设置了递归处理
        config_manager.set("recursive", True)
    if args.log_level:  # 如果提供了日志级别
        config_manager.set("log_level", args.log_level)
    if args.batch_size:  # 如果提供了批处理大小
        config_manager.set("batch_size", args.batch_size)

    # 设置日志记录器
    # 从配置中获取日志级别，如果没有则默认为INFO
    log_level = config_manager.get("log_level", "INFO")
    # 获取用户主目录路径，'C:\\Users\\29701'
    user_home = os.path.expanduser("~")  # ~ 表示用户主目录
    # 在用户主目录下创建日志目录，'C:\\Users\\29701\\.war3exceltool\\logs'
    log_dir = os.path.join(user_home, ".war3exceltool", "logs")
    # 设置日志记录器，返回配置好的logger对象
    logger = setup_logger(log_dir, log_level)

    # 关闭启动画面
    closesplash()
    
    # 创建Qt应用程序对象，传入命令行参数
    app = QApplication(sys.argv)
    # 设置应用程序名称，用于显示在标题栏等处
    app.setApplicationName("War3ExcelTool(Excel转ts、lua、ini，ini转excel)")

    # 创建主窗口实例
    main_window = MainWindow()
    # 显示主窗口
    main_window.show()

    # 启动应用程序事件循环并等待程序退出
    # app.exec_() 会阻塞直到用户关闭应用
    # sys.exit() 确保程序返回适当的退出代码
    sys.exit(app.exec_())


# 这个条件判断确保只有直接运行此文件时才会执行main()函数
# 如果这个文件被作为模块导入，则不会执行main()
if __name__ == "__main__":
    main()  # 调用主函数开始程序执行
