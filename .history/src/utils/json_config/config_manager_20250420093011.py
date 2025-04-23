import os
import json
import shutil
import logging
from typing import Dict, Any, Optional

class JsonConfigManager:
    """
    JSON配置管理类
    
    用于加载、保存和管理应用程序的配置信息，支持使用JSON格式的配置文件。
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
    }
    
    def __init__(self, config_path: Optional[str] = None):
        """
        初始化配置管理器
        
        Args:
            config_path: 配置文件路径，如果为None则使用默认路径(./setting.json)
        """
        self.logger = logging.getLogger(__name__)
        
        # 设置配置文件路径
        self.config_path = config_path
        
        # 加载配置
        self.config = self._load_config()
    
    def _load_config(self) -> Dict[str, Any]:
        """
        从配置文件加载配置
        
        如果配置文件不存在，会尝试从默认位置复制一个，如果默认位置也没有，
        则使用内置的默认配置创建一个新的配置文件。
        
        Returns:
            配置字典
        """
        try:
            # 检查配置文件是否存在
            if os.path.exists(self.config_path):
                self.logger.info(f"加载配置文件: {self.config_path}")
                with open(self.config_path, 'r', encoding='utf-8') as f:
                    config = json.load(f)
                    # 合并默认配置和读取的配置
                    return {**self.DEFAULT_CONFIG, **config}
            else:
                self.logger.info(f"配置文件不存在: {self.config_path}")
                
                # 尝试从resource/resource/setting.json复制默认配置
                script_dir = os.path.dirname(os.path.abspath(__file__))
                base_dir = os.path.dirname(os.path.dirname(os.path.dirname(script_dir)))
                default_config_path = os.path.join(base_dir, "resource", "resource", "setting.json")
                
                if os.path.exists(default_config_path):
                    self.logger.info(f"从默认位置复制配置文件: {default_config_path}")
                    shutil.copy(default_config_path, self.config_path)
                    
                    # 读取复制后的配置文件
                    with open(self.config_path, 'r', encoding='utf-8') as f:
                        config = json.load(f)
                        # 合并默认配置和读取的配置
                        return {**self.DEFAULT_CONFIG, **config}
                else:
                    # 如果默认配置文件也不存在，创建一个新的
                    self.logger.info("默认配置文件也不存在，创建新的配置文件")
                    config = self.DEFAULT_CONFIG.copy()
                    self._save_config_internal(config)
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
            os.makedirs(os.path.dirname(self.config_path), exist_ok=True)
            
            # 将配置写入文件
            with open(self.config_path, 'w', encoding='utf-8') as f:
                json.dump(config, f, indent=4, ensure_ascii=False)
                
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
        success = self._save_config_internal(self.config)
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
        return self.config.get(key, default)
    
    def set(self, key: str, value: Any) -> None:
        """
        设置配置项的值
        
        Args:
            key: 配置键名
            value: 配置值
        """
        self.config[key] = value
    
    def update(self, config_dict: Dict[str, Any]) -> None:
        """
        批量更新配置
        
        Args:
            config_dict: 包含多个配置项的字典
        """
        self.config.update(config_dict)
    
    def get_all(self) -> Dict[str, Any]:
        """
        获取所有配置
        
        Returns:
            完整的配置字典
        """
        return self.config.copy()
    
    def reset_to_default(self) -> None:
        """
        重置配置为默认值
        """
        self.config = self.DEFAULT_CONFIG.copy() 