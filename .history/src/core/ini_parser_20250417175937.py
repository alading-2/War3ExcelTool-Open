# src/core/ini_parser.py
# Ini文件解析器模块

# 导入必要的库
from ast import Dict # 从 ast 模块导入 Dict 类型提示 (虽然这里可能未使用，但保留)
import configparser # 导入用于解析 INI 文件的 configparser 模块
from typing import Dict, Any, List # 导入类型提示 Dict, Any, List
import logging # 导入 Python 内置的日志记录模块

class IniParser:
    """
    用于解析 INI 配置文件的类。
    """
    def __init__(self):
        """
        初始化 IniParser 实例。
        创建一个 configparser 对象，并设置保留原始键的大小写。
        获取一个 logger 实例用于记录日志。
        """
        self.config = configparser.ConfigParser()
        # 设置 configparser 保留 INI 文件中选项键的原始大小写，
        # 默认情况下 configparser 会将所有键转换为小写。
        self.config.optionxform = str
        # 获取当前模块的 logger 实例
        self.logger=logging.getLogger(__name__)

    def parse_ini(self, path: str) -> Any: # 更新返回类型提示
        """
        解析指定路径的 INI 文件。

        Args:
            path (str): INI 文件的路径。

        Returns:
            List[Dict[str, str]]: 一个包含字典的列表。
            
            每个字典代表 INI 文件中的一个节 (section)。
            每个字典包含一个 "id" 键（值为节名称）以及该节下的所有键值对。
            如果文件读取失败、为空或解析出错，则返回空列表。
        """
        parsed_data = [] # 初始化用于存储解析结果的列表
        try:
            # 尝试读取 INI 文件，使用 utf-8-sig 编码以支持中文等非 ASCII 字符并处理 BOM
            files_read = self.config.read(path, encoding='utf-8-sig')
            # 检查文件是否成功读取
            if not files_read:
                # 如果文件未找到或无法读取，记录错误日志并返回空列表
                self.logger.error(f"无法读取或文件为空: {path}")
                return  # 如果文件未读取成功或为空，返回空列表

            # 记录成功读取文件的信息
            self.logger.info(f"成功读取INI文件: {path}")
            return self.config

        except configparser.MissingSectionHeaderError:
            # 捕获并处理缺少节头的错误
            self.logger.error(f"文件缺少节头 (Section Header): {path}", exc_info=True)
            return  # 或根据需要处理此错误
        except Exception as e:
            # 捕获并处理其他所有解析过程中可能发生的异常
            self.logger.error(f"解析INI文件 {path} 时出错: {e}", exc_info=True)
            return  # 出错时返回空列表