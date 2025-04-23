# src/core/ini_parser.py
# Ini文件解析器模块

from ast import Dict
import configparser
from ..utils.logger import logger
from typing import Dict, Any, List # 导入 List
import logging

class IniParser:
    def __init__(self, file_path):
        self.config = configparser.ConfigParser()
        # 保留原始键的大小写
        self.config.optionxform = str
        self.logger=logging.getLogger(__name__)

    def parse_ini(self, path: str) -> List[Dict[str, str]]: # 更新返回类型提示
        """解析INI文件，返回字典列表，每个字典代表一个节。"""
        parsed_data = []
        try:
            # 指定编码以支持中文等字符
            files_read = self.config.read(path, encoding='utf-8')
            if not files_read:
                self.logger.error(f"无法读取或文件为空: {path}")
                return [] # 如果文件未读取成功或为空，返回空列表

            self.logger.info(f"成功读取INI文件: {path}")

            for section_name in self.config.sections():
                section_dict = {"id": section_name}
                for key, value in self.config.items(section_name):
                    # 值保持为字符串
                    section_dict[key] = value
                parsed_data.append(section_dict)

            return parsed_data
        except configparser.MissingSectionHeaderError:
            self.logger.error(f"文件缺少节头 (Section Header): {path}", exc_info=True)
            return [] # 或根据需要处理此错误
        except Exception as e:
            self.logger.error(f"解析INI文件 {path} 时出错: {e}", exc_info=True)
            return [] # 出错时返回空列表