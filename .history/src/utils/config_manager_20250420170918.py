import os
import shutil
import logging
from typing import Dict, Any, Optional
from src.core.ini_parser import IniParser

class ConfigManager:
    """
    配置管理类
    
    用于加载、保存和管理应用程序的配置信息，支持使用CFG格式的配置文件。
    主要功能：
    - 从文件加载配置
    - 将配置保存到文件
    - 获取和设置配置项
    - 在缺少配置文件时自动创建默认配置
    """
    
    # 默认配置字典
    DEFAULT_CONFIG = {
        # 转换选项
        "convert_to_ts": False,  # 是否执行 Excel -> TS 转换
        "convert_to_lua": False,  # 是否执行 Excel -> Lua 转换
        "convert_to_ini": False,  # 是否执行 Excel -> Ini 转换
        "convert_ini_to_excel": False,  # 是否执行 Ini -> Excel 转换
        
        # 基本设置
        "recursive": True,  # 是否递归处理输入目录
        "log_level": "INFO",  # 日志级别
        
        # 白泽框架设置
        "baize_frame": True,  # 白泽框架

        # 新增配置项
        "ini_output": "",  # 生成ini的路径
        "w3x2lni_path": "",  # w3x2lni的路径
        "parse_w3x": False,  # 是否解析w3x
        "sort_by_alpha": False,  # 生成表格是否按字母排序
        "font_size": 14,  # 字体大小
    }
    
    # 静态配置字典
    config = DEFAULT_CONFIG.copy()
    default_config_path=r"resource\resource\config.cfg"
    
    def __init__(self, config_path: Optional[str] = None):
        """
        初始化配置管理器
        
        Args:
            config_path: 配置文件路径，如果为None则使用默认路径(./config.cfg)
        """
        self.logger = logging.getLogger(__name__)
        # 设置配置文件路径
        self.config_path = config_path or os.path.join("config.cfg")
        
    def load_config(self):
        """
        加载配置
        """
        ConfigManager.config = self._load_config()
    
    def _load_config(self) -> Dict[str, Any]:
        """
        从配置文件加载配置
        
        如果配置文件不存在，会尝试从默认位置复制一个，如果默认位置也没有，
        则使用内置的默认配置创建一个新的配置文件。
        
        Returns:
            配置字典
        """
        try:
            # 如果配置文件不存在
            if not os.path.exists(self.config_path):
                self.logger.info(f"配置文件不存在: {self.config_path}")
                
                if os.path.exists(ConfigManager.default_config_path):
                    self.logger.info(f"从默认位置复制配置文件: {ConfigManager.default_config_path}")
                    shutil.copy(ConfigManager.default_config_path, self.config_path)
                else:
                    # 如果默认配置文件也不存在，创建一个新的
                    self.logger.info("默认配置文件也不存在，创建新的配置文件")
                    config = self.DEFAULT_CONFIG.copy()
                    self._save_config_internal(config)
                    return config
            
            # 加载配置文件
            self.logger.info(f"加载配置文件: {self.config_path}")
            # 使用IniParser解析配置文件
            ini_parser = IniParser()
            config_data = ini_parser.parse_ini(self.config_path)
            
            # 尝试从配置获取设置，如果配置不存在则使用默认值
            config = self.DEFAULT_CONFIG.copy()
            
            # 遍历所有配置节
            for section, section_data in config_data.items():
                for key, default_value in self.DEFAULT_CONFIG.items():
                    if key in section_data:
                        # 根据默认值类型转换配置值
                        if isinstance(default_value, bool):
                            config[key] = section_data[key].lower() == 'true'
                        elif isinstance(default_value, int):
                            config[key] = int(section_data[key])
                        else:
                            config[key] = section_data[key]
            
            return config
                    
        except Exception as e:
            self.logger.error(f"加载配置时出错: {e}")
            return self.DEFAULT_CONFIG.copy()
    
    def _save_config_internal(self, config: Dict[str, Any]) -> bool:
        """
        内部方法：将配置字典保存到文件
        
        Args:
            config: 要保存的配置字典
            
        Returns:
            是否成功保存
        """
        try:
            # 确保配置文件所在目录存在
            os.makedirs(os.path.dirname(self.config_path) if os.path.dirname(self.config_path) else '.', exist_ok=True)
            
            # 读取现有文件内容（如果存在）
            existing_lines = []
            if os.path.exists(self.config_path):
                with open(self.config_path, 'r', encoding='utf-8') as f:
                    existing_lines = f.readlines()
            
            # 如果文件不存在或为空，创建一个新的带有 [Settings] 节点的文件
            if not existing_lines:
                with open(self.config_path, 'w', encoding='utf-8') as f:
                    f.write("[Settings]\n")
                    for key, value in config.items():
                        # 确保布尔值为小写
                        if isinstance(value, bool):
                            str_value = str(value).lower()
                        else:
                            str_value = str(value)
                        f.write(f"{key} = {str_value}\n")
                return True
            
            # 解析现有配置行，找出键值对行的索引
            key_line_map = {}
            section = None
            section_found = False
            
            for i, line in enumerate(existing_lines):
                line = line.strip()
                # 识别节点
                if line.startswith('[') and line.endswith(']'):
                    section = line[1:-1]
                    if section == 'Settings':
                        section_found = True
                # 识别键值对
                elif '=' in line and section == 'Settings':
                    key = line.split('=')[0].strip()
                    key_line_map[key] = i
            
            # 如果没有找到 Settings 节点，添加一个
            if not section_found:
                existing_lines.append("[Settings]\n")
            
            # 更新现有行或添加新行
            for key, value in config.items():
                # 确保布尔值为小写
                if isinstance(value, bool):
                    str_value = str(value).lower()
                else:
                    str_value = str(value)
                
                # 构造新的键值对行
                new_line = f"{key} = {str_value}\n"
                
                # 如果键已存在，更新该行
                if key in key_line_map:
                    line_idx = key_line_map[key]
                    # 分割原行，保留注释部分
                    original_line = existing_lines[line_idx]
                    comment_pos = original_line.find('#')
                    if comment_pos != -1:
                        # 保留注释
                        new_line = f"{key} = {str_value} {original_line[comment_pos:]}"
                    existing_lines[line_idx] = new_line
                else:
                    # 键不存在，添加到文件末尾
                    existing_lines.append(new_line)
            
            # 写回文件
            with open(self.config_path, 'w', encoding='utf-8') as f:
                f.writelines(existing_lines)
                
            return True
        except Exception as e:
            self.logger.error(f"保存配置时出错: {e}")
            return False
    
    def save_config(self) -> bool:
        """
        保存当前配置到文件
        
        Returns:
            是否成功保存
        """
        success = self._save_config_internal(ConfigManager.config)
        if success:
            self.logger.info(f"配置已保存到: {self.config_path}")
        return success
    
    def get(self, key: str, default: Any = None) -> Any:
        """
        获取配置项的值
        
        Args:
            key: 配置键名
            default: 默认值，如果键不存在则返回此值
            
        Returns:
            配置值
        """
        return ConfigManager.config.get(key, default)
    
    def set(self, key: str, value: Any) -> None:
        """
        设置配置项的值
        
        Args:
            key: 配置键名
            value: 配置值
        """
        ConfigManager.config[key] = value
    
    def update(self, config_dict: Dict[str, Any]) -> None:
        """
        批量更新配置
        
        Args:
            config_dict: 包含多个配置项的字典
        """
        ConfigManager.config.update(config_dict)
    
    def set_all(self, config_dict: Dict[str, Any]) -> None:
        """
        设置全部配置
        
        Args:
            config_dict: 完整的配置字典
        """
        ConfigManager.config = self.DEFAULT_CONFIG.copy()
        ConfigManager.config.update(config_dict)
    
    def get_all(self) -> Dict[str, Any]:
        """
        获取所有配置
        
        Returns:
            完整的配置字典
        """
        return ConfigManager.config.copy()
    
    def reset_to_default(self) -> None:
        """
        重置配置为默认值
        """
        ConfigManager.config = self.DEFAULT_CONFIG.copy() 