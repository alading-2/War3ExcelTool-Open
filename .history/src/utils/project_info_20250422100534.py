from dataclasses import dataclass, asdict
import json
import yaml
from typing import Dict, Any, Optional


@dataclass
class ProjectInfo:
    """项目信息类，集中存储项目的各种元数据"""
    name: str = "War3ExcelTool"
    version: str = "1.0.0"
    author: str = "阿拉丁"
    description: str = "Excel转换工具"

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


# # 创建一个全局实例，方便导入
# project_info = ProjectInfo()

# # 示例: 如何在代码中使用
# if __name__ == "__main__":
#     # 打印项目信息
#     print(f"项目名称: {project_info.name}")
#     print(f"版本: {project_info.version}")
#     print(f"作者: {project_info.author}")

#     # 导出为不同格式
#     print("\nJSON格式:")
#     print(project_info.to_json())

#     print("\nYAML格式:")
#     print(project_info.to_yaml())

#     # 保存到文件
#     project_info.save_to_file("project_info.json")
#     project_info.save_to_file("project_info.yaml", format="yaml")
