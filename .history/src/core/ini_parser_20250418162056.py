# src/core/ini_parser.py
# Ini文件解析器模块

# 导入必要的库
from ast import Dict
import configparser
import re  # 添加正则表达式模块
from typing import Optional, Dict, Any, List
import logging
import os

# 新增物编类型映射常量
OBJECT_TYPE_MAPPING = {
    'unit': ['单位', 'unit'],
    'item': ['物品', 'item'],
    'ability': ['技能', 'ability'],
    'buff': ['buff'],
    'destructable': ['可破坏物', 'destructable'],
    'upgrade': ['科技', 'upgrade']
}

class War3IniParser(configparser.ConfigParser):
    """自定义的War3 INI解析器，扩展标准ConfigParser以支持War3物编格式"""
    
    def __init__(self, **kwargs):
        # 确保不区分大小写选项被禁用
        kwargs['strict'] = False  # 允许重复键
        super().__init__(**kwargs)
        self.optionxform = str  # 保留键的原始大小写
        
    def read_file(self, f, source=None):
        """重写read_file方法以预处理War3 INI文件格式"""
        # 预处理文件内容
        content = f.read()
        
        # 1. 将 -- 注释转换为 # 注释
        content = re.sub(r'^\s*--\s*(.*?)$', r'# \1', content, flags=re.MULTILINE)
        
        # 2. 处理多行数组 - 将多行的 {...} 转换为单行
        # 匹配以 = { 开始，以 } 结束的多行块
        pattern = r'(\w+)\s*=\s*\{(.*?)\}(?=\s*$|\s*\n)'
        
        def replace_multiline_array(match):
            key = match.group(1)
            # 获取数组内容并移除所有换行和多余空格
            array_content = re.sub(r'\s+', ' ', match.group(2).strip())
            # 返回单行格式
            return f"{key} = {{{array_content}}}"
        
        # 使用DOTALL模式匹配跨行内容
        content = re.sub(pattern, replace_multiline_array, content, flags=re.DOTALL)
        
        # 将处理后的内容传递给标准解析器
        import io
        super().read_file(io.StringIO(content), source)

class IniParser:
    """
    用于解析 INI 配置文件的类。
    """
    def __init__(self):
        """
        初始化 IniParser 实例。
        创建一个自定义的 War3IniParser 对象，能够处理魔兽争霸3的物编INI格式。
        获取一个 logger 实例用于记录日志。
        """
        self.config = War3IniParser()
        self.logger = logging.getLogger(__name__)

    def parse_ini(self, path: str) -> Any:
        """
        解析指定路径的 INI 文件。

        Args:
            path (str): INI 文件的路径。

        Returns:
            ConfigParser: 解析后的配置对象。
            如果文件读取失败、为空或解析出错，则返回None。
        """
        try:
            # 使用自定义解析器读取文件
            with open(path, 'r', encoding='utf-8-sig') as f:
                self.config.read_file(f, path)
            
            # 检查是否有节
            if not self.config.sections():
                self.logger.error(f"文件没有有效的节: {path}")
                return None

            # 记录成功读取文件的信息
            self.logger.info(f"成功读取INI文件: {path}")
            return self.config

        except FileNotFoundError:
            self.logger.error(f"找不到文件: {path}")
            return None
        except configparser.MissingSectionHeaderError as e:
            self.logger.error(f"文件缺少节头 (Section Header): {path}", exc_info=True)
            return None
        except Exception as e:
            self.logger.error(f"解析INI文件 {path} 时出错: {e}", exc_info=True)
            return None

    def data_add(self, other_parser: configparser.ConfigParser) -> None:
        """合并两个 ConfigParser 对象的数据"""
        for section in other_parser.sections():
            if self.config.has_section(section):
                self.logger.warning(f"发现重复 Section: {section}，已跳过")
                continue
                
            self.config.add_section(section)
            for key, value in other_parser.items(section):
                self.config.set(section, key, value)

    @staticmethod
    def detect_ini_type(filename: str) -> Optional[str]:
        """通过文件名检测物编类型"""
        filename_lower = filename.lower()
        for obj_type, keywords in OBJECT_TYPE_MAPPING.items():
            if any(kw in filename_lower for kw in keywords):
                return obj_type
        return None