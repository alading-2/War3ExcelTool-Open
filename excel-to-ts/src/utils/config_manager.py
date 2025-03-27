import os
import json
from typing import Dict, Any, Optional
import logging
from .logger import get_logger

logger = get_logger(__name__)

class ConfigManager:
    """管理应用配置的类"""
    
    DEFAULT_CONFIG = {
        "input_dir": "",
        "output_dir": "",
        "recursive": False,
        "batch_size": 10,
        "log_level": "INFO",
        "recent_files": []
    }
    
    def __init__(self, config_path: Optional[str] = None):
        """
        初始化ConfigManager类
        
        Args:
            config_path: 配置文件路径，如果为None则使用默认路径
        """
        self.logger = logging.getLogger(__name__)
        
        if config_path is None:
            # 默认配置路径
            user_home = os.path.expanduser("~")
            app_dir = os.path.join(user_home, ".excel_to_ts")
            os.makedirs(app_dir, exist_ok=True)
            self.config_path = os.path.join(app_dir, "config.json")
        else:
            self.config_path = config_path
            
        # 加载配置
        self.config = self._load_config()
    
    def _load_config(self) -> Dict[str, Any]:
        """
        从配置文件加载配置
        
        Returns:
            配置字典
        """
        try:
            if os.path.exists(self.config_path):
                with open(self.config_path, 'r', encoding='utf-8') as f:
                    config = json.load(f)
                    # 合并默认配置，确保所有必要的键都存在
                    return {**self.DEFAULT_CONFIG, **config}
            else:
                self.logger.info(f"配置文件不存在，使用默认配置: {self.config_path}")
                return self.DEFAULT_CONFIG.copy()
        except Exception as e:
            self.logger.error(f"加载配置时出错: {str(e)}")
            return self.DEFAULT_CONFIG.copy()
    
    def save_config(self) -> bool:
        """
        保存当前配置到文件
        
        Returns:
            是否成功保存
        """
        try:
            with open(self.config_path, 'w', encoding='utf-8') as f:
                json.dump(self.config, f, indent=4)
            self.logger.info(f"配置已保存到: {self.config_path}")
            return True
        except Exception as e:
            self.logger.error(f"保存配置时出错: {str(e)}")
            return False
    
    def get(self, key: str, default: Any = None) -> Any:
        """
        获取配置项
        
        Args:
            key: 配置键名
            default: 默认值，如果键不存在则返回此值
            
        Returns:
            配置值
        """
        return self.config.get(key, default)
    
    def set(self, key: str, value: Any) -> None:
        """
        设置配置项
        
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
        
    def add_recent_file(self, file_path: str, max_recent: int = 10) -> None:
        """
        添加最近使用的文件
        
        Args:
            file_path: 文件路径
            max_recent: 最大记录数
        """
        recent_files = self.get("recent_files", [])
        
        # 如果文件已存在，先移除
        if file_path in recent_files:
            recent_files.remove(file_path)
            
        # 添加到列表前端
        recent_files.insert(0, file_path)
        
        # 保持列表长度不超过max_recent
        if len(recent_files) > max_recent:
            recent_files = recent_files[:max_recent]
            
        self.set("recent_files", recent_files) 