from dataclasses import dataclass, asdict
import json
import yaml
from typing import Dict, Any, Optional


@dataclass
class ProjectInfo:
    """项目信息类，集中存储项目的各种元数据"""
    name: str = "War3ExcelTool"
    version: str = "v1.0.0"
    author: str = "阿拉丁"
    description: str = "功能：Excel转ts、lua、ini，ini转excel。"

    mode: str = ""  # 运行模式，只能是gui或cli
    # main.py路径
    main_abs_path: str = ""  # 绝对路径
    main_base_dir: str = ""  # 目录
    config_path: str = ""  # 与main.py相同目录的config文件目录

    # 可以根据需要添加更多字段

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
