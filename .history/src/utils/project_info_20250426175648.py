from dataclasses import dataclass, asdict, field
import json
import yaml
from typing import Dict, Any, Optional, Tuple


@dataclass
class ProjectInfo:
    """项目信息类，集中存储项目的各种元数据"""
    name: str = "War3ExcelTool"
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
    path_editor_info_map = r"resource\resource\editor_info\editor_info_map.ini"
    dict_editor_info_map: Dict[str, str] = field(default_factory=dict)
    dict_editor_info_order: Dict[str, Any] = field(
        default_factory=dict
    )  # 编辑器选项顺序，unit,item,ability,buff,destructable,upgrade,doodad选项的排序

    # 编辑器选项详细信息
    path_editor_info_json_map = r"resource\resource\editor_info\editor_info_map.json"
    dict_editor_info_json_map: Dict[str, Dict[str, Dict[str, str]]] = field(
        default_factory=dict)

    # ini_template
    path_ini_template = r"resource\resource\excel_to_ini\excel_to_ini_template.ini"
    dict_ini_template: Dict[str, Any] = field(default_factory=dict)

    # 基础命令id
    path_base_orderid = r"resource\resource\excel_to_ini\基础命令id.txt"
    tuple_base_orderid: Tuple[str] = ()

    @staticmethod
    def read_init_file():
        from src.core.ini.ini_parser import War3IniParser
        # 1.先读取editor_info_map.ini
        path = ProjectInfo.path_editor_info_map
        result_dict = War3IniParser.parse_ini(path)
        # 编辑器选项中英文映射初始化，存储在ProjectInfo.dict_editor_info_map
        ProjectInfo.dict_editor_info_map = result_dict["data"]
        # 编辑器选项顺序初始化，存储在ProjectInfo.dict_editor_info_order
        ProjectInfo.dict_editor_info_order = result_dict["order"]

        # 2.读editor_info_map.json，记录了编辑器选项中英文映射详细信息
        path = ProjectInfo.path_editor_info_json_map
        with open(path, "r", encoding="utf-8") as f:
            json_dict = json.load(f)
        # 编辑器选项中英文映射初始化，存储在ProjectInfo.dict_editor_info_map
        ProjectInfo.dict_editor_info_json_map = json_dict

        # 3.读excel_to_ini_template.ini
        path = ProjectInfo.path_ini_template
        result_dict = War3IniParser.parse_ini(path)
        ProjectInfo.dict_ini_template = result_dict["data"]

        # 4.读基础命令id.txt
        path = ProjectInfo.path_base_orderid
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
