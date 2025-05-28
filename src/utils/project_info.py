from dataclasses import dataclass, asdict, field
import json
import yaml
import os
import sys
from typing import Dict, Any, Optional, Tuple
import logging


@dataclass
class ProjectInfo:
    """项目信息类，集中存储项目的各种元数据"""
    name: str = "War3ExcelTool_1.0"
    version: str = "v1.0.0"
    author: str = "阿拉丁"
    description: str = "功能：Excel转ts/lua/ini，解析w3x，ini转excel。"

    mode: str = ""  # 运行模式，只能是gui或cli
    # main.py路径
    main_abs_path: str = ""  # 绝对路径
    main_base_dir: str = ""  # 目录
    config_path: str = ""  # 与main.py相同目录的config文件目录

    # 在dataclass中，不能直接用{}作为字典的默认值。正确做法是用field(default_factory=dict)。
    # 编辑器选项中英文映射
    path_editor_info_map = "resource/resource/editor_info/editor_info_map.ini"
    dict_editor_info_map: Dict[str, Dict[str,
                                         Any]] = field(default_factory=dict)
    dict_editor_info_order: Dict[str, Any] = field(
        default_factory=dict
    )  # 编辑器选项顺序，unit,item,ability,buff,destructable,upgrade,doodad选项的排序

    # 编辑器选项详细信息
    path_editor_info_json_map = "resource/resource/editor_info/editor_info_map.json"
    dict_editor_info_json_map: Dict[str, Dict[str, Dict[str, str]]] = field(
        default_factory=dict)

    # ini_template
    path_ini_template = "resource/resource/excel_to_ini/excel_to_ini_template.ini"
    dict_ini_template: Dict[str, Any] = field(default_factory=dict)

    # 基础命令id
    path_base_orderid = "resource/resource/excel_to_ini/基础命令id.txt"
    tuple_base_orderid: Tuple[str] = ()

    @staticmethod
    def get_resource_path(relative_path: str) -> str:
        """
        获取资源文件的绝对路径，兼容开发环境和打包环境
        
        在开发环境中，会使用相对于项目根目录的路径
        在打包环境中，会使用相对于exe文件所在目录的路径
        
        Args:
            relative_path: 相对路径
            
        Returns:
            资源文件的绝对路径
        """
        logger = logging.getLogger(__name__)

        # 规范化相对路径，确保使用正斜杠
        relative_path = relative_path.replace("\\", "/")

        # 确定应用程序的基准目录
        if getattr(sys, 'frozen', False):
            # 如果应用程序被打包（PyInstaller）
            base_dir = os.path.dirname(sys.executable)
            logger.debug(f"运行在打包环境中，基准目录: {base_dir}")

            # 在打包环境中，资源可能在不同位置，按优先级尝试
            possible_paths = [
                # 1. exe同级目录下的资源文件
                os.path.join(base_dir, relative_path),
                # 2. exe同级的resource目录
                os.path.join(base_dir, os.path.basename(relative_path)),
                # 3. 直接在resource子目录下
                os.path.join(base_dir, "resource",
                             os.path.basename(relative_path))
            ]

            # 如果路径包含resource/resource，尝试简化路径
            if "resource/resource" in relative_path:
                simplified_path = relative_path.replace(
                    "resource/resource/", "resource/")
                possible_paths.append(os.path.join(base_dir, simplified_path))

            # 尝试所有可能的路径
            for path in possible_paths:
                if os.path.exists(path):
                    logger.debug(f"在打包环境中找到资源: {path}")
                    return path

            # 如果所有路径都不存在，记录详细信息并返回第一个路径
            logger.warning(f"资源文件在打包环境中未找到: {relative_path}")
            logger.warning(f"尝试过的路径: {possible_paths}")
            return possible_paths[0]  # 返回第一个路径，即使它不存在
        else:
            # 开发环境，使用项目根目录
            base_dir = os.path.abspath(
                os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
            logger.debug(f"运行在开发环境中，基准目录: {base_dir}")

            # 在开发环境中构建完整路径
            full_path = os.path.join(base_dir, relative_path)
            if os.path.exists(full_path):
                return full_path
            else:
                logger.warning(f"资源文件在开发环境中未找到: {full_path}")
                return full_path  # 返回路径，即使它不存在

    @staticmethod
    def read_init_file():
        from src.core.ini.ini_parser import War3IniParser
        # 1.先读取editor_info_map.ini
        path = ProjectInfo.get_resource_path(ProjectInfo.path_editor_info_map)
        result_dict = War3IniParser.parse_ini(path)
        # 编辑器选项中英文映射初始化，存储在ProjectInfo.dict_editor_info_map
        ProjectInfo.dict_editor_info_map = result_dict["data"]
        # 编辑器选项顺序初始化，存储在ProjectInfo.dict_editor_info_order
        ProjectInfo.dict_editor_info_order = result_dict["order"]

        # 2.读editor_info_map.json，记录了编辑器选项中英文映射详细信息
        path = ProjectInfo.get_resource_path(
            ProjectInfo.path_editor_info_json_map)
        with open(path, "r", encoding="utf-8") as f:
            json_dict = json.load(f)
        # 编辑器选项中英文映射初始化，存储在ProjectInfo.dict_editor_info_map
        ProjectInfo.dict_editor_info_json_map = json_dict

        # 3.读excel_to_ini_template.ini
        path = ProjectInfo.get_resource_path(ProjectInfo.path_ini_template)
        result_dict = War3IniParser.parse_ini(path)
        ProjectInfo.dict_ini_template = result_dict["data"]

        # 4.读基础命令id.txt
        path = ProjectInfo.get_resource_path(ProjectInfo.path_base_orderid)
        with open(path, 'r', encoding='utf-8') as f:
            # 过滤空行和注释行
            list = [
                line.strip() for line in f
                if line.strip() and not line.strip().startswith('#')
            ]
        ProjectInfo.tuple_base_orderid = tuple(list)

    def to_dict(self) -> Dict[str, Any]:
        """将项目信息转换为字典格式"""
        return asdict(self)

    def to_json(self) -> str:
        """将项目信息转换为JSON字符串"""
        return json.dumps(self.to_dict(), ensure_ascii=False, indent=2)

    def to_yaml(self) -> str:
        """将项目信息转换为YAML字符串"""
        try:
            return yaml.dump(self.to_dict(), allow_unicode=True)
        except ImportError:
            print("警告: 未安装PyYAML库，无法导出YAML格式")
            return ""

    def save_to_file(self, file_path: str, format: str = "json") -> None:
        """
        将项目信息保存到文件
        
        参数:
            file_path: 文件保存路径
            format: 保存格式，支持 'json' 或 'yaml'
        """
        try:
            with open(file_path, 'w', encoding='utf-8') as f:
                if format.lower() == 'json':
                    f.write(self.to_json())
                elif format.lower() == 'yaml':
                    f.write(self.to_yaml())
                else:
                    raise ValueError(f"不支持的格式: {format}")
            print(f"项目信息已保存到: {file_path}")
        except Exception as e:
            print(f"保存项目信息时出错: {e}")
