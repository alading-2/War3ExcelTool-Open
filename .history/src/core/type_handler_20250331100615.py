import re  # 导入正则表达式模块，用于模式匹配
import json  # 导入JSON模块，用于解析和生成JSON数据
from typing import Any, Dict, List, Tuple, Set, Union  # 导入类型提示功能
import logging  # 导入日志模块
from ..utils.logger import get_logger  # 从项目的utils目录导入自定义日志获取函数

# 获取当前模块的日志记录器
logger = get_logger(__name__)  # __name__是Python的特殊变量，表示当前模块名称

class TypeHandler:
    """处理数据类型的类
    
    这个类负责处理Excel数据和TypeScript类型之间的转换，包括：
    1. 推断数据的TypeScript类型
    2. 将值格式化为TypeScript代码
    3. 从数据中提取TypeScript代码片段
    """
    
    def __init__(self):
        """初始化TypeHandler类的新实例
        
        创建一个日志记录器，用于记录类型处理过程中的信息
        """
        # 获取一个与当前类关联的日志记录器
        self.logger = logging.getLogger(__name__)
        
    def infer_type(self, value: Any) -> str:
        """
        推断数据的TypeScript类型
        
        根据传入值的Python类型和内容特征，推断对应的TypeScript类型。
        支持推断布尔值、数字、字符串、数组、对象等多种类型。
        
        Args:
            value: 要推断类型的值，可以是任何Python数据类型
            
        Returns:
            推断出的TypeScript类型名称，例如"string"、"number"、"boolean"等
            
        示例:
            >>> handler = TypeHandler()
            >>> handler.infer_type(42)
            "number"
            >>> handler.infer_type("Hello")
            "string"
        """
        # 如果值为None，返回"any"类型
        if value is None:
            return "any"
            
        # 如果值是布尔类型，返回"boolean"
        if isinstance(value, bool):  # isinstance检查值是否为指定类型的实例
            return "boolean"
            
        # 如果值是整数或浮点数，返回"number"
        if isinstance(value, (int, float)):  # 可以同时检查多种类型
            return "number"
            
        # 如果值是字符串，进一步分析它可能代表的类型
        if isinstance(value, str):
            # 尝试解析为JSON对象或数组
            try:
                # 检查字符串是否像JSON对象或数组
                if (value.startswith('{') and value.endswith('}')) or \
                   (value.startswith('[') and value.endswith(']')):
                    # 尝试解析JSON字符串
                    json_obj = json.loads(value)
                    
                    # 根据解析结果判断类型
                    if isinstance(json_obj, list):
                        return "any[]"  # TypeScript数组类型
                    elif isinstance(json_obj, dict):
                        return "object"  # TypeScript对象类型
                    else:
                        return "any"  # 其他情况返回any类型
            except (json.JSONDecodeError, TypeError):
                # 如果JSON解析失败，忽略错误继续执行
                pass
                
            # 检查字符串是否代表布尔值（"true"或"false"）
            if value.lower() in ('true', 'false'):
                return "boolean"
                
            # 检查字符串是否代表数字（使用正则表达式匹配）
            # ^表示开始，-?表示可选的负号，\d+表示一个或多个数字
            # (\.\d+)?表示可选的小数部分，$表示结束
            if re.match(r'^-?\d+(\.\d+)?$', value):
                return "number"
                
            # 其他字符串一律视为string类型
            return "string"
            
        # 如果值是字典，返回"object"
        if isinstance(value, dict):
            return "object"
            
        # 如果值是列表，返回"any[]"（TypeScript中的任意类型数组）
        if isinstance(value, list):
            return "any[]"
            
        # 默认情况下返回"any"类型
        return "any"
    
    def format_value_for_ts(self, value: Any, inferred_type: str, color_code: str = None) -> str:
        """
        根据推断的类型格式化值为TypeScript代码
        
        将Python值转换为可以直接在TypeScript代码中使用的字符串表示形式，
        如果提供了颜色代码，还会为字符串类型的值添加颜色标记。
        
        Args:
            value: 原始值，需要转换为TypeScript代码的值
            inferred_type: 推断的TypeScript类型，如"string"、"number"等
            color_code: 可选的颜色代码，用于给字符串添加颜色标记
            
        Returns:
            格式化后的值字符串，可以直接用在TypeScript代码中
            
        示例:
            >>> handler = TypeHandler()
            >>> handler.format_value_for_ts(42, "number")
            "42"
            >>> handler.format_value_for_ts("Hello", "string", "|cffff0000")
            ""|cffff0000Hello|r""
        """
        # 处理None值，在TypeScript中表示为null
        if value is None:
            return "null"
            
        # 处理布尔类型值
        if inferred_type == "boolean":
            # 如果是字符串"true"，转换为true
            if isinstance(value, str) and value.lower() == "true":
                return "true"
            # 如果是字符串"false"，转换为false
            elif isinstance(value, str) and value.lower() == "false":
                return "false"
            # 其他情况转换为小写的布尔值（true或false）
            else:
                return str(value).lower()
                
        # 处理数字类型值
        if inferred_type == "number":
            # 如果是字符串形式的数字，尝试转换为实际的数字
            if isinstance(value, str):
                try:
                    # 如果包含小数点，转换为浮点数
                    if '.' in value:
                        return str(float(value))
                    # 否则转换为整数
                    else:
                        return str(int(value))
                except ValueError:
                    # 如果转换失败，直接返回原字符串
                    return str(value)
            # 如果已经是数字类型，直接转换为字符串
            else:
                return str(value)
                
        # 处理字符串类型值
        if inferred_type == "string":
            # 处理字符串，将双引号转义（避免与字符串边界的引号冲突）
            formatted_value = str(value).replace('"', '\\"')
            
            # 如果提供了颜色代码，添加颜色标记
            if color_code:
                return f'"{color_code}{formatted_value}|r"'
            # 否则返回普通字符串
            else:
                return f'"{formatted_value}"'
                
        # 处理对象和数组类型值
        if inferred_type in ("object", "any[]"):
            # 如果是字符串形式的JSON
            if isinstance(value, str):
                try:
                    # 尝试解析JSON字符串
                    parsed = json.loads(value)
                    # 将解析后的对象再次转换为JSON字符串（确保格式正确）
                    return json.dumps(parsed)
                except (json.JSONDecodeError, TypeError):
                    # 如果解析失败，将其作为普通字符串处理
                    return f'"{value}"'
            else:
                # 如果已经是复杂对象，尝试直接转换为JSON字符串
                try:
                    return json.dumps(value)
                except TypeError:
                    # 如果转换失败，将其作为普通字符串处理
                    return f'"{str(value)}"'
                    
        # 默认处理：将值转换为带引号的字符串
        return f'"{str(value)}"'
    
    def extract_ts_code(self, data_rows: List[Dict], keys: List[str]) -> Tuple[List[str], List[str]]:
        """
        从数据中提取TypeScript代码
        
        遍历数据行，查找包含TypeScript代码的列（名为"code"的列），
        并分离出导入语句和其他代码。
        
        Args:
            data_rows: 数据行列表，每个元素是包含数据的字典
            keys: 键名列表，表示数据可能包含的列名
            
        Returns:
            包含两个列表的元组:
            - 第一个列表包含所有导入语句（import语句）
            - 第二个列表包含所有其他代码
            
        示例:
            如果数据行中"code"列包含：
            "import { Player } from './player';
             const MAX_LEVEL = 100;"
            
            则返回: 
            (["import { Player } from './player';"], ["const MAX_LEVEL = 100;"])
        """
        # 创建空列表，分别存储导入语句和其他代码
        imports = []    # 存储import语句
        other_code = [] # 存储其他代码
        
        # 检查键名列表中是否包含"code"列
        if "code" not in keys:
            return imports, other_code # 如果没有code列，直接返回空结果
            
        # 遍历所有数据行
        for row in data_rows:
            # 检查当前行是否包含"code"键，并且值不为空
            if "code" in row and row["code"]:
                # 获取code列的值并转换为字符串
                code = str(row["code"])
                
                # 提取import语句（以"import "开头的行）
                # 1. 使用split('\n')将代码分割为多行
                # 2. 遍历每一行，找出以'import '开头的行
                # 3. 使用strip()去除行首尾的空白字符
                import_lines = [line.strip() for line in code.split('\n') 
                               if line.strip().startswith('import ')]
                # 将提取的import语句添加到导入列表中
                imports.extend(import_lines)
                
                # 提取非import语句（不是空行且不以"import "开头的行）
                other_lines = [line.strip() for line in code.split('\n') 
                              if line.strip() and not line.strip().startswith('import ')]
                # 将提取的其他代码添加到其他代码列表中
                other_code.extend(other_lines)
        
        # 去除导入语句中的重复项
        imports = list(set(imports))  # set()创建集合，自动去重，然后转回列表
        
        # 返回导入语句和其他代码
        return imports, other_code 