# src/core/w3x_parser.py
# W3X解析器模块

import os
import logging
import subprocess
import shutil
from typing import Dict, Any, List, Optional, Tuple

logger = logging.getLogger(__name__)


class W3xParser:
    """
    魔兽争霸3地图文件(w3x)解析器
    
    利用w3x2lni工具将w3x文件转换为易于处理的格式，
    然后进行进一步处理以支持导入/导出功能。
    """

    def __init__(self, w3x2lni_path: str):
        """
        初始化W3x解析器
        
        Args:
            w3x2lni_path: w3x2lni工具路径
        """
        self.w3x2lni_path = w3x2lni_path
        self.w3x2lni_exec = os.path.join(w3x2lni_path, "w2l.exe")

        # 验证w3x2lni工具路径
        if not os.path.exists(self.w3x2lni_exec):
            logger.error(f"找不到w3x2lni可执行文件: {self.w3x2lni_exec}")
            raise FileNotFoundError(f"找不到w3x2lni可执行文件: {self.w3x2lni_exec}")

    def parse_w3x(self, w3x_file: str, output_dir: str) -> bool:
        """
        解析w3x文件
        
        Args:
            w3x_file: w3x文件路径
            output_dir: 输出目录
            
        Returns:
            是否成功解析
        """
        logger.info(f"开始解析w3x文件: {w3x_file}")

        try:
            # 确保输出目录存在
            os.makedirs(output_dir, exist_ok=True)

            # 构建命令行参数
            cmd = [
                self.w3x2lni_exec,
                "lni",  # 使用lni模式
                w3x_file,  # 输入文件
                output_dir  # 输出目录
            ]

            # 执行命令
            # 记录执行的命令到日志
            logger.debug(f"执行命令: {' '.join(cmd)}")
            # 调用子进程执行w3x2lni工具命令
            # capture_output=True: 捕获标准输出和错误输出
            # text=True: 将输出作为文本而非字节返回
            # encoding='utf-8': 使用UTF-8编码处理输出
            result = subprocess.run(cmd,
                                    capture_output=True,
                                    text=True,
                                    encoding='utf-8')

            # 检查执行结果
            if result.returncode != 0:
                logger.error(f"解析w3x文件失败: {result.stderr}")
                return False

            logger.info(f"成功解析w3x文件，输出目录: {output_dir}")
            logger.debug(f"命令输出: {result.stdout}")

            return True

        except Exception as e:
            logger.error(f"解析w3x文件时发生错误: {e}", exc_info=True)
            return False

    def extract_tables(self, output_dir: str) -> Dict[str, str]:
        """
        从w3x解析结果中提取数据表
        
        Args:
            output_dir: w3x解析输出目录
            
        Returns:
            提取的数据表映射，格式为 {表名: 文件路径}
        """
        tables = {}

        try:
            # 提取单位、物品、技能等数据表
            table_mapping = {
                "units": "war3map.w3u",
                "items": "war3map.w3t",
                "abilities": "war3map.w3a",
                "buffs": "war3map.w3h",
                "destructables": "war3map.w3b",
                "upgrades": "war3map.w3q"
            }

            # 使用os.walk遍历目录树，搜索解析后的目录结构，找到数据表文件
            # os.walk函数会生成一个三元组(当前目录路径, 当前目录下的子目录列表, 当前目录下的文件列表)
            # 它会递归地遍历指定目录及其所有子目录，是查找文件的强大工具
            for root, _, files in os.walk(output_dir):
                # 遍历映射表中的每个表名和对应的文件名
                for table_name, file_name in table_mapping.items():
                    # 检查当前目录下是否存在目标文件
                    if file_name in files:
                        # 构建文件的完整路径
                        table_path = os.path.join(root, file_name)
                        # 将表名和对应的文件路径存入结果字典
                        tables[table_name] = table_path
                        # 记录日志，表示找到了数据表
                        logger.debug(f"找到数据表 {table_name}: {table_path}")

            if not tables:
                logger.warning(f"未从解析结果中找到任何数据表: {output_dir}")

            return tables

        except Exception as e:
            logger.error(f"提取数据表时发生错误: {e}", exc_info=True)
            return {}

    def process_w3x(self, w3x_file: str, output_dir: str) -> Dict[str, Any]:
        """
        完整处理w3x文件，包括解析和提取数据
        
        Args:
            w3x_file: w3x文件路径
            output_dir: 输出目录
            
        Returns:
            处理结果，包含成功标志和提取的数据
        """
        result = {"success": False, "tables": {}, "errors": []}

        try:
            # 解析w3x文件
            parse_success = self.parse_w3x(w3x_file, output_dir)
            if not parse_success:
                result["errors"].append("解析w3x文件失败")
                return result

            # 暂时没用
            # 提取数据表
            # tables = self.extract_tables(output_dir)
            # if not tables:
            #     result["errors"].append("未从解析结果中找到任何数据表")
            #     return result

            # 更新结果
            result["success"] = True
            # result["tables"] = tables

            return result

        except Exception as e:
            logger.error(f"处理w3x文件时发生错误: {e}", exc_info=True)
            result["errors"].append(str(e))
            return result

    def cleanup(self, output_dir: str) -> bool:
        """
        清理解析产生的临时文件
        
        Args:
            output_dir: 临时输出目录
            
        Returns:
            是否成功清理
        """
        try:
            if os.path.exists(output_dir):
                shutil.rmtree(output_dir)
                logger.info(f"已清理临时目录: {output_dir}")
            return True
        except Exception as e:
            logger.error(f"清理临时目录时发生错误: {e}", exc_info=True)
            return False
