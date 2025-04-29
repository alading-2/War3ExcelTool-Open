import os
import shutil
import logging
from typing import Dict, Any, Optional, List
from src.core.ini.ini_parser import War3IniParser
from src.utils.project_info import ProjectInfo


class ConfigManager:
    """
    配置管理类
    
    用于加载、保存和管理应用程序的配置信息，支持使用CFG格式的配置文件。
    主要功能：
    - 从文件加载配置（支持自动创建默认配置）
    - 将配置保存到文件（支持保留注释和原有结构）
    - 获取和设置配置项（自动类型转换和校验）
    - 提供参数元信息，支持GUI自动生成控件和参数分类
    - 支持参数分组（路径参数、功能参数、辅助参数），便于界面分区管理
    - 保证ConfigManager、GUI界面和配置文件三者参数同步，防止丢失或不同步
    """

    # 参数元信息字典，定义每个参数的分类、控件类型、分组、标签、默认值、只读属性、描述等
    # 这部分信息用于GUI自动生成控件、参数分组、界面注释等
    PARAM_META = {
        # 路径参数
        "input_path": {
            "category": "path",  # 参数分类：路径参数
            "default": ProjectInfo.main_base_dir,  # 默认值
            "widget": "QLineEdit",  # 推荐控件类型
            "label": "输入目录",  # 界面显示标签
            "group": "路径参数",  # 分组
            "readonly": False,  # 是否只读
            "desc": "Excel输入文件夹路径"  # 参数描述
        },
        "output_path": {
            "category": "path",
            "default": ProjectInfo.main_base_dir,
            "widget": "QLineEdit",
            "label": "基础输出目录",
            "group": "路径参数",
            "readonly": False,
            "desc": "所有转换结果的基础输出目录"
        },
        "ini_output": {
            "category": "path",
            "default": "",
            "widget": "QLineEdit",
            "label": "INI输出路径",
            "group": "路径参数",
            "readonly": False,
            "desc": "生成INI文件的输出路径"
        },
        "w3x2lni_path": {
            "category": "path",
            "default": "",
            "widget": "QLineEdit",
            "label": "w3x2lni工具路径",
            "group": "路径参数",
            "readonly": False,
            "desc": "w3x2lni工具的可执行文件路径"
        },
        # 功能参数
        "convert_to_ts": {
            "category": "feature",  # 参数分类：功能参数
            "default": False,
            "widget": "QCheckBox",
            "label": "Excel -> TypeScript",
            "group": "功能参数",
            "readonly": False,
            "desc": "是否执行Excel到TS转换"
        },
        "convert_to_lua": {
            "category": "feature",
            "default": False,
            "widget": "QCheckBox",
            "label": "Excel -> Lua",
            "group": "功能参数",
            "readonly": False,
            "desc": "是否执行Excel到Lua转换"
        },
        "convert_to_ini": {
            "category": "feature",
            "default": False,
            "widget": "QCheckBox",
            "label": "Excel -> Ini",
            "group": "功能参数",
            "readonly": False,
            "desc": "是否执行Excel到Ini转换"
        },
        "convert_ini_to_excel": {
            "category": "feature",
            "default": False,
            "widget": "QCheckBox",
            "label": "Ini -> Excel",
            "group": "功能参数",
            "readonly": False,
            "desc": "是否执行Ini到Excel转换"
        },
        "parse_w3x": {
            "category": "feature",
            "default": False,
            "widget": "QCheckBox",
            "label": "解析w3x",
            "group": "功能参数",
            "readonly": False,
            "desc": "是否解析w3x文件"
        },
        # 辅助参数
        "baize_frame": {
            "category": "assist",  # 参数分类：辅助参数
            "default": True,
            "widget": "QCheckBox",
            "label": "白泽框架",
            "group": "辅助参数",
            "readonly": False,
            "desc": "是否启用白泽框架"
        },
        "recursive": {
            "category": "assist",  # 参数分类：辅助参数
            "default": True,
            "widget": "QCheckBox",
            "label": "递归处理输入目录",
            "group": "辅助参数",
            "readonly": False,
            "desc": "是否递归处理输入目录"
        },
        "log_level": {
            "category": "assist",
            "default": "INFO",
            "widget": "QComboBox",
            "label": "日志级别",
            "group": "辅助参数",
            "readonly": False,
            "desc": "日志输出级别"
        },
        "sort_by_alpha": {
            "category": "assist",
            "default": False,
            "widget": "QCheckBox",
            "label": "按字母排序生成表格",
            "group": "辅助参数",
            "readonly": False,
            "desc": "生成表格时是否按字母排序"
        },
        "font_size": {
            "category": "assist",
            "default": 14,
            "widget": "QSpinBox",
            "label": "字体大小",
            "group": "辅助参数",
            "readonly": False,
            "desc": "Excel导出字体大小"
        },
        "remove_empty_columns": {
            "category": "assist",  # 参数分类：辅助参数
            "default": True,
            "widget": "QCheckBox",
            "label": "生成Excel的删除全空列",
            "group": "辅助参数",
            "readonly": False,
            "desc": "生成Excel时是否删除全是空值的列，建议保留默认True。"
        },
        "player_count": {
            "category": "assist",  # 参数分类：辅助参数
            "default": 5,
            "widget": "QSpinBox",
            "label": "玩家数量",
            "group": "辅助参数",
            "readonly": False,
            "desc": "生成基础技能等物编时的玩家数量，影响技能物编数量，默认为5。"
        },
    }

    # 默认配置字典（自动从PARAM_META生成，保证参数和元信息一致）
    DEFAULT_CONFIG = {k: v["default"] for k, v in PARAM_META.items()}

    # 静态配置字典，存储当前所有参数的值
    config = DEFAULT_CONFIG.copy()
    default_config_path = r"resource\resource\config.cfg"  # 默认配置文件路径
    config_path = ""

    def __init__(self):
        """
        初始化配置管理器
        - 加载配置文件（如果不存在则自动创建）
        - 初始化日志记录器
        """
        self.logger = logging.getLogger(__name__)
        self.load_config()  # 加载配置

    def load_config(self):
        """
        加载配置文件内容到config静态变量
        """
        ConfigManager.config = self._load_config()

    def _load_config(self) -> Dict[str, Any]:
        """
        从配置文件加载配置
        - 如果配置文件不存在，优先从默认位置复制，否则用内置默认值创建
        - 支持类型自动转换，保证参数类型与元信息一致
        Returns:
            配置字典
        """
        try:
            # 检查配置文件是否存在
            if not os.path.exists(ConfigManager.config_path):
                self.logger.info(f"配置文件不存在: {ConfigManager.config_path}")

                if os.path.exists(ConfigManager.default_config_path):
                    self.logger.info(
                        f"从默认位置复制配置文件: {ConfigManager.default_config_path}")
                    shutil.copy(ConfigManager.default_config_path,
                                ConfigManager.config_path)
                else:
                    # 默认配置文件也不存在，创建新文件
                    self.logger.error("默认配置文件不存在")
                    raise FileNotFoundError("默认配置文件不存在")

            # 加载配置文件内容
            self.logger.info(f"加载配置文件: {ConfigManager.config_path}")
            config_data = War3IniParser.parse_ini(ConfigManager.config_path)

            # 以默认配置为基础，逐项覆盖
            config = self.DEFAULT_CONFIG.copy()

            # 遍历所有配置节和参数，类型自动转换
            for section, section_data in config_data.items():
                for key, default_value in self.DEFAULT_CONFIG.items():
                    if key in section_data:
                        # 按默认值类型转换
                        if isinstance(default_value, bool):
                            config[key] = section_data[key].lower() == 'true'
                        elif isinstance(default_value, int):
                            config[key] = int(section_data[key])
                        else:
                            config[key] = section_data[key]

            return config

        except Exception as e:
            self.logger.error(f"加载配置时出错: {e}")
            raise e

    def _save_config_internal(self, config: Dict[str, Any]) -> bool:
        """
        内部方法：将配置字典保存到文件
        - 保留原有注释和结构，支持增量更新
        Args:
            config: 要保存的配置字典
        Returns:
            是否成功保存
        """
        try:
            # 确保配置文件目录存在
            os.makedirs(os.path.dirname(ConfigManager.config_path)
                        if os.path.dirname(ConfigManager.config_path) else '.',
                        exist_ok=True)

            # 读取现有文件内容（保留注释）
            existing_lines = []
            if os.path.exists(ConfigManager.config_path):
                with open(ConfigManager.config_path, 'r',
                          encoding='utf-8') as f:
                    existing_lines = f.readlines()

            # 解析现有配置行，找出每个键所在行
            key_line_map = {}

            for i, line in enumerate(existing_lines):
                line = line.strip()
                # 识别节点
                if line.startswith('[') and line.endswith(']'):
                    section = line[1:-1]
                # 识别键值对
                elif '=' in line:
                    key = line.split('=')[0].strip()
                    key_line_map[key] = i

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
            with open(ConfigManager.config_path, 'w', encoding='utf-8') as f:
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
            self.logger.info(f"配置已保存到: {ConfigManager.config_path}")
        return success

    @classmethod
    def get_param_meta(cls, key: str) -> Dict[str, Any]:
        """
        获取参数的元信息（如控件类型、分组、标签、默认值等）
        Args:
            key: 参数名
        Returns:
            元信息字典
        """
        return cls.PARAM_META.get(key, {})

    @classmethod
    def get_params_by_category(cls, category: str) -> List[str]:
        """
        获取指定分类下的所有参数名（如path/feature/assist）
        Args:
            category: 分类名
        Returns:
            参数名列表
        """
        return [
            k for k, v in cls.PARAM_META.items()
            if v.get("category") == category
        ]

    @classmethod
    def get_param_widget_type(cls, key: str) -> str:
        """
        获取参数推荐的控件类型（如QLineEdit、QCheckBox等）
        Args:
            key: 参数名
        Returns:
            控件类型字符串
        """
        return cls.PARAM_META.get(key, {}).get("widget", "QLineEdit")

    def get(self, key: str, default: Any = None) -> Any:
        """
        获取配置项的值，并根据元信息自动类型转换
        Args:
            key: 配置键名
            default: 默认值
        Returns:
            配置值（自动转换为正确类型）
        """
        value = ConfigManager.config.get(key, default)
        meta = self.get_param_meta(key)
        if not meta:
            return value
        expected_type = type(meta["default"])
        try:
            if expected_type is bool:
                return bool(value) if isinstance(
                    value, bool) else str(value).lower() == "true"
            if expected_type is int:
                return int(value)
            if expected_type is float:
                return float(value)
            return value
        except Exception as e:
            self.logger.error(f"参数 {key} 类型转换失败: {e}")
            return meta["default"]

    def set(self, key: str, value: Any) -> None:
        """
        设置配置项的值，自动类型校验和转换
        Args:
            key: 配置键名
            value: 配置值
        """
        meta = self.get_param_meta(key)
        if not meta:
            ConfigManager.config[key] = value
            return
        expected_type = type(meta["default"])
        try:
            if expected_type is bool:
                ConfigManager.config[key] = bool(value) if isinstance(
                    value, bool) else str(value).lower() == "true"
            elif expected_type is int:
                ConfigManager.config[key] = int(value)
            elif expected_type is float:
                ConfigManager.config[key] = float(value)
            else:
                ConfigManager.config[key] = value
        except Exception as e:
            self.logger.error(f"参数 {key} 设置失败: {e}")
            ConfigManager.config[key] = meta["default"]

    def update(self, config_dict: Dict[str, Any]) -> None:
        """
        批量更新配置（不会重置未包含的参数）
        Args:
            config_dict: 包含多个配置项的字典
        """
        ConfigManager.config.update(config_dict)

    def set_all(self, config_dict: Dict[str, Any]) -> None:
        """
        设置全部配置（先重置为默认值，再批量更新）
        Args:
            config_dict: 完整的配置字典
        """
        ConfigManager.config = self.DEFAULT_CONFIG.copy()
        ConfigManager.config.update(config_dict)

    def get_all(self) -> Dict[str, Any]:
        """
        获取所有配置项的当前值
        Returns:
            完整的配置字典
        """
        return ConfigManager.config.copy()

    def reset_to_default(self) -> None:
        """
        重置配置为默认值（保留关键路径参数）
        """
        config = ConfigManager.DEFAULT_CONFIG.copy()
        # 保留input_path, output_path, ini_output, w3x2lni_path，避免用户路径丢失
        config["input_path"] = ConfigManager.config.get("input_path")
        config["output_path"] = ConfigManager.config.get("output_path")
        config["ini_output"] = ConfigManager.config.get("ini_output")
        config["w3x2lni_path"] = ConfigManager.config.get("w3x2lni_path")
        ConfigManager.config = config
        self.save_config()
