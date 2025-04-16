import os  # 导入操作系统模块，用于处理文件路径和文件操作
import json  # 导入JSON模块，用于读写JSON格式的配置文件
from typing import Dict, Any, Optional  # 导入类型提示功能
import logging  # 导入日志模块
from .logger import get_logger  # 从当前包的logger模块导入自定义日志获取函数

# 获取当前模块的日志记录器
logger = get_logger(__name__)  # __name__是Python的特殊变量，表示当前模块名称

class ConfigManager:
    """管理应用配置的类
    
    这个类负责加载、保存和管理应用程序的配置信息，包括：
    - 输入和输出目录设置
    - 处理选项（如递归处理）
    - 日志级别
    - 最近使用的文件记录
    等等。
    
    配置信息保存在JSON文件中，通常位于用户主目录下的.war3exceltool文件夹中。
    """
    
    # 默认配置字典，包含所有必需的配置项和默认值
    DEFAULT_CONFIG = {
        "input_dir": "",  # 输入目录，默认为空
        "output_dir": "",  # 输出目录，默认为空
        "recursive": False,  # 是否递归处理子目录，默认否
        "batch_size": 10,  # 批处理大小，默认10
        "log_level": "INFO",  # 日志级别，默认INFO
        "recent_files": []  # 最近使用的文件列表，默认为空列表
    }
    
    def __init__(self, config_path: Optional[str] = None):
        """
        初始化ConfigManager类的新实例
        
        创建配置管理器，加载配置文件。如果未提供配置文件路径，
        则使用默认路径（用户主目录下的.war3exceltool/config.json）。
        
        Args:
            config_path: 配置文件路径，如果为None则使用默认路径
        """
        # 获取一个与当前类关联的日志记录器
        self.logger = logging.getLogger(__name__)
        
        # 确定配置文件路径
        if config_path is None:
            # 如果未提供路径，使用默认路径
            # 获取用户主目录
            user_home = os.path.expanduser("~")  # ~ 表示用户主目录，C:\Users\29701
            # 在用户主目录下创建.war3exceltool目录用于存储配置，C:\Users\29701\.war3exceltool
            app_dir = os.path.join(user_home, ".war3exceltool")
            # 确保配置目录存在，exist_ok=True表示如果目录已存在则不报错
            os.makedirs(app_dir, exist_ok=True)
            # 设置配置文件完整路径
            self.config_path = os.path.join(app_dir, "config.json")
        else:
            # 如果提供了路径，直接使用
            self.config_path = config_path
            
        # 加载配置，将从文件中读取的配置或默认配置存储在实例变量中
        self.config = self._load_config()
    
    def _load_config(self) -> Dict[str, Any]:
        """
        从配置文件加载配置
        
        读取指定路径的JSON配置文件，如果文件不存在或读取失败，
        则返回默认配置。下划线前缀表示这是一个内部方法，不应该在类外部调用。
        
        Returns:
            配置字典，包含所有配置项及其值
            
        Note:
            即使配置文件存在并成功读取，也会与默认配置合并，
            确保所有必要的配置项都存在。
        """
        try:
            # 检查配置文件是否存在
            if os.path.exists(self.config_path):
                # 如果存在，打开并读取内容
                with open(self.config_path, 'r', encoding='utf-8') as f:
                    # 将JSON文件解析为字典
                    config = json.load(f)
                    # 将默认配置与读取的配置合并
                    # ** 是字典解包运算符，将字典的键值对展开
                    # {**dict1, **dict2} 创建一个新字典，包含两个字典的所有键值对
                    # 如果有重复的键，后面字典的值会覆盖前面字典的值
                    return {**self.DEFAULT_CONFIG, **config}
            else:
                # 如果配置文件不存在，记录信息并返回默认配置的副本
                self.logger.info(f"配置文件不存在，使用默认配置: {self.config_path}")
                # copy()方法创建字典的副本，避免直接修改DEFAULT_CONFIG
                return self.DEFAULT_CONFIG.copy()
        except Exception as e:
            # 捕获任何可能的异常（如JSON解析错误）
            self.logger.error(f"加载配置时出错: {str(e)}")
            # 出错时返回默认配置的副本
            return self.DEFAULT_CONFIG.copy()
    
    def save_config(self) -> bool:
        """
        保存当前配置到文件
        
        将当前内存中的配置写入到配置文件。如果文件不存在，会创建新文件。
        
        Returns:
            是否成功保存：True表示成功，False表示失败
        """
        try:
            # 打开文件准备写入，'w'表示写入模式，如果文件不存在会创建新文件
            with open(self.config_path, 'w', encoding='utf-8') as f:
                # 将配置字典转换为JSON格式并写入文件
                # indent=4 使输出的JSON格式化，更易于人工阅读
                json.dump(self.config, f, indent=4)
            # 记录成功信息
            self.logger.info(f"配置已保存到: {self.config_path}")
            # 返回成功标志
            return True
        except Exception as e:
            # 捕获并记录任何可能的异常（如权限错误、磁盘满等）
            self.logger.error(f"保存配置时出错: {str(e)}")
            # 返回失败标志
            return False
    
    def get(self, key: str, default: Any = None) -> Any:
        """
        获取配置项的值
        
        从配置字典中获取指定键的值，如果键不存在则返回默认值。
        
        Args:
            key: 配置键名，要获取的配置项的名称
            default: 默认值，如果键不存在则返回此值
            
        Returns:
            配置值，如果键存在则返回对应的值，否则返回默认值
            
        Example:
            >>> config = ConfigManager()
            >>> input_dir = config.get("input_dir", "")
            >>> batch_size = config.get("batch_size", 10)
        """
        # 使用字典的get方法获取值，如果键不存在则返回default
        return self.config.get(key, default)
    
    def set(self, key: str, value: Any) -> None:
        """
        设置配置项的值
        
        更新配置字典中指定键的值。如果键不存在，会创建新的键值对。
        注意：这只更新内存中的配置，要保存到文件需要调用save_config()。
        
        Args:
            key: 配置键名，要设置的配置项的名称
            value: 配置值，要设置的值
            
        Example:
            >>> config = ConfigManager()
            >>> config.set("input_dir", "C:/data")
            >>> config.set("recursive", True)
            >>> config.save_config()  # 保存到文件
        """
        # 使用字典的赋值语法更新或添加键值对
        self.config[key] = value
        
    def update(self, config_dict: Dict[str, Any]) -> None:
        """
        批量更新多个配置项
        
        一次性更新多个配置项，通过传入一个包含键值对的字典。
        注意：这只更新内存中的配置，要保存到文件需要调用save_config()。
        
        Args:
            config_dict: 包含多个配置项的字典，键为配置名，值为配置值
            
        Example:
            >>> config = ConfigManager()
            >>> config.update({
            ...     "input_dir": "C:/data",
            ...     "output_dir": "C:/output",
            ...     "recursive": True
            ... })
            >>> config.save_config()  # 保存到文件
        """
        # 使用字典的update方法批量更新配置
        self.config.update(config_dict)
        
    def add_recent_file(self, file_path: str, max_recent: int = 10) -> None:
        """
        添加文件到最近使用的文件列表
        
        将文件路径添加到最近使用的文件列表的开头。如果文件已在列表中，
        会先移除旧的记录再添加到开头，保证最新使用的文件总是在列表的最前面。
        列表长度会自动限制在指定的最大记录数内。
        
        Args:
            file_path: 文件路径，要添加到最近文件列表的文件路径
            max_recent: 最大记录数，最近文件列表的最大长度，默认为10
            
        Example:
            >>> config = ConfigManager()
            >>> config.add_recent_file("C:/data/example.xlsx")
            >>> config.save_config()  # 保存到文件
        """
        # 获取当前的最近文件列表，如果配置中没有则返回空列表
        recent_files = self.get("recent_files", [])
        
        # 如果文件已在列表中，先移除旧的记录
        if file_path in recent_files:
            recent_files.remove(file_path)
            
        # 将文件路径添加到列表的开头（索引0的位置）
        recent_files.insert(0, file_path)
        
        # 如果列表长度超过了最大记录数，截取前max_recent个元素
        if len(recent_files) > max_recent:
            recent_files = recent_files[:max_recent]
            
        # 更新配置中的最近文件列表
        self.set("recent_files", recent_files) 