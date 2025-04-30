#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import traceback
import logging
from src.core.excel.excel_parser import ExcelParser
from src.utils.project_info import ProjectInfo

# 配置日志
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    handlers=[logging.StreamHandler()],
)


def setup_project_info():
    """设置项目信息，确保ProjectInfo.main_base_dir正确设置"""
    # 获取当前脚本的绝对路径
    script_path = os.path.abspath(__file__)
    # 获取项目根目录（假设是脚本所在目录）
    base_dir = os.path.dirname(script_path)

    # 设置ProjectInfo的main_base_dir
    ProjectInfo.main_base_dir = base_dir

    # 创建临时目录（如果不存在）
    temp_dir = os.path.join(ProjectInfo.main_base_dir, "xlsx_copy_path")
    os.makedirs(temp_dir, exist_ok=True)

    logging.info(f"项目根目录: {ProjectInfo.main_base_dir}")
    logging.info(f"临时Excel目录: {temp_dir}")

    return temp_dir


def test_excel_parser():
    """测试ExcelParser能否正确复制处理Excel文件"""
    try:
        # 设置项目信息
        temp_dir = setup_project_info()

        # 获取测试用的Excel文件路径
        # 这里假设有一个测试用的Excel文件
        test_excel_path = input("请输入测试Excel文件的完整路径: ")

        if not os.path.exists(test_excel_path):
            logging.error(f"Excel文件不存在: {test_excel_path}")
            return

        logging.info(f"开始解析Excel文件: {test_excel_path}")

        # 创建ExcelParser实例并解析Excel文件
        parser = ExcelParser()
        results = parser.parse_excel(test_excel_path)

        # 检查临时目录中是否还有Excel文件
        temp_files = os.listdir(temp_dir)
        excel_files = [f for f in temp_files if f.endswith((".xlsx", ".xls"))]

        if excel_files:
            logging.warning(f"临时目录中仍有Excel文件: {excel_files}")
        else:
            logging.info("临时Excel文件已正确清理")

        # 输出解析结果
        logging.info(f"成功解析了 {len(results)} 个工作表")
        for i, metadata in enumerate(results):
            sheet_name = metadata["sheet_name"]
            filename = metadata["filename"]
            logging.info(f"[{i+1}] {filename} - {sheet_name}")

    except Exception as e:
        logging.error(f"测试过程中发生错误: {str(e)}")
        logging.error(traceback.format_exc())


if __name__ == "__main__":
    test_excel_parser()
