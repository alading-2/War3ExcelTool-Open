import re
import json
from typing import Any, Dict, List, Tuple, Set, Union
import logging
from ..utils.logger import get_logger

logger = get_logger(__name__)

class TypeHandler:
    """处理数据类型的类"""
    
    def __init__(self):
        """初始化TypeHandler类"""
        self.logger = logging.getLogger(__name__)
        
    def infer_type(self, value: Any) -> str:
        """
        推断数据的TypeScript类型
        
        Args:
            value: 要推断类型的值
            
        Returns:
            推断出的TypeScript类型名称
        """
        if value is None:
            return "any"
            
        if isinstance(value, bool):
            return "boolean"
            
        if isinstance(value, (int, float)):
            return "number"
            
        if isinstance(value, str):
            # 尝试解析为对象或数组
            try:
                if (value.startswith('{') and value.endswith('}')) or \
                   (value.startswith('[') and value.endswith(']')):
                    json_obj = json.loads(value)
                    if isinstance(json_obj, list):
                        return "any[]"
                    elif isinstance(json_obj, dict):
                        return "object"
                    else:
                        return "any"
            except (json.JSONDecodeError, TypeError):
                pass
                
            # 检查布尔值字符串
            if value.lower() in ('true', 'false'):
                return "boolean"
                
            # 检查数字字符串
            if re.match(r'^-?\d+(\.\d+)?$', value):
                return "number"
                
            return "string"
            
        # 复杂对象
        if isinstance(value, dict):
            return "object"
            
        if isinstance(value, list):
            return "any[]"
            
        return "any"
    
    def format_value_for_ts(self, value: Any, inferred_type: str, color_code: str = None) -> str:
        """
        根据推断的类型格式化值为TypeScript代码
        
        Args:
            value: 原始值
            inferred_type: 推断的类型
            color_code: 可选的颜色代码
            
        Returns:
            格式化后的值字符串
        """
        if value is None:
            return "null"
            
        if inferred_type == "boolean":
            # 处理布尔值
            if isinstance(value, str) and value.lower() == "true":
                return "true"
            elif isinstance(value, str) and value.lower() == "false":
                return "false"
            else:
                return str(value).lower()
                
        if inferred_type == "number":
            # 处理数字
            if isinstance(value, str):
                # 尝试转换字符串为数字
                try:
                    if '.' in value:
                        return str(float(value))
                    else:
                        return str(int(value))
                except ValueError:
                    return str(value)
            else:
                return str(value)
                
        if inferred_type == "string":
            # 处理字符串，添加颜色代码
            formatted_value = str(value).replace('"', '\\"')
            if color_code:
                return f'"{color_code}{formatted_value}|r"'
            else:
                return f'"{formatted_value}"'
                
        if inferred_type in ("object", "any[]"):
            # 处理对象和数组
            if isinstance(value, str):
                # 可能是JSON字符串
                try:
                    parsed = json.loads(value)
                    return json.dumps(parsed)
                except (json.JSONDecodeError, TypeError):
                    return f'"{value}"'
            else:
                # 直接使用对象
                try:
                    return json.dumps(value)
                except TypeError:
                    return f'"{str(value)}"'
                    
        # 默认处理为字符串
        return f'"{str(value)}"'
    
    def extract_ts_code(self, data_rows: List[Dict], keys: List[str]) -> Tuple[List[str], List[str]]:
        """
        从数据中提取TypeScript代码
        
        Args:
            data_rows: 数据行列表
            keys: 键名列表
            
        Returns:
            包含导入语句和其他代码的元组
        """
        imports = []
        other_code = []
        
        # 查找code列
        if "code" not in keys:
            return imports, other_code
            
        for row in data_rows:
            if "code" in row and row["code"]:
                code = str(row["code"])
                # 提取import语句
                import_lines = [line.strip() for line in code.split('\n') 
                               if line.strip().startswith('import ')]
                imports.extend(import_lines)
                
                # 提取非import语句
                other_lines = [line.strip() for line in code.split('\n') 
                              if line.strip() and not line.strip().startswith('import ')]
                other_code.extend(other_lines)
        
        # 去重
        imports = list(set(imports))
        
        return imports, other_code 