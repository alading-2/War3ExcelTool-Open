#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Excel格式化功能测试脚本
测试Excel文件格式优化功能
"""

import os
import sys
import pandas as pd
from pathlib import Path
import logging
import shutil

# 添加项目根目录到Python路径
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from src.utils.excel_utils import format_excel_workbook
from src.core.excel_writer import ExcelWriter

# 配置日志
logging.basicConfig(level=logging.INFO, 
                    format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

def create_test_excel(file_path):
    """创建测试用Excel文件"""
    # 创建一些测试数据
    data = {
        'ID': ['A001', 'A002', 'A003'],
        '名称': ['测试单位1', '测试单位2', '测试单位3'],
        '攻击力': [100, 200, 300],
        '防御力': [50, 75, 90],
        '描述': ['这是一个测试单位描述，内容比较长可能会换行', 
               '这是另一个测试单位描述，内容也比较长', 
               '这是第三个测试单位描述，内容同样比较长'],
    }
    
    # 创建多个sheet
    sheets = {
        '单位': pd.DataFrame(data),
        '物品': pd.DataFrame(data),
        '技能': pd.DataFrame(data)
    }
    
    # 写入Excel文件
    with pd.ExcelWriter(file_path, engine='openpyxl') as writer:
        for sheet_name, df in sheets.items():
            df.to_excel(writer, sheet_name=sheet_name, index=False)
    
    logger.info(f"创建测试Excel文件: {file_path}")

def test_format_excel_function():
    """测试Excel格式化函数"""
    # 创建测试目录
    test_dir = Path(__file__).parent / "test_output"
    test_dir.mkdir(exist_ok=True)
    
    # 测试文件路径
    test_file = test_dir / "test_format.xlsx"
    
    try:
        # 创建测试Excel文件
        create_test_excel(test_file)
        
        # 执行格式化
        logger.info("开始执行Excel格式化...")
        result = format_excel_workbook(test_file)
        
        if result:
            logger.info("Excel格式化成功完成!")
            logger.info(f"请查看格式化后的文件: {test_file}")
        else:
            logger.error("Excel格式化失败!")
        
    except Exception as e:
        logger.error(f"测试过程中发生错误: {e}")
    
    logger.info("格式化功能测试完成")

def test_excel_writer_with_formatting():
    """测试ExcelWriter类的格式化功能"""
    # 创建测试目录
    test_dir = Path(__file__).parent / "test_output"
    test_dir.mkdir(exist_ok=True)
    
    # 测试文件路径
    test_file = test_dir / "test_writer_format.xlsx"
    
    try:
        # 准备测试数据
        test_data = {
            'unit': {
                'h001': {'id': 'h001', 'name': '测试英雄1', 'attack': 100, 'defense': 50},
                'h002': {'id': 'h002', 'name': '测试英雄2', 'attack': 120, 'defense': 60}
            },
            'item': {
                'i001': {'id': 'i001', 'name': '测试物品1', 'cost': 1000, 'effect': '增加100点攻击力'},
                'i002': {'id': 'i002', 'name': '测试物品2', 'cost': 2000, 'effect': '增加50点防御力'}
            }
        }
        
        # 检查资源目录中是否有模板文件
        resource_dir = Path(__file__).parent.parent.parent / "resource" / "resource"
        template_file = resource_dir / "物编.xlsx"
        
        # 如果没有模板，创建一个简单的模板
        if not template_file.exists():
            resource_dir.mkdir(parents=True, exist_ok=True)
            create_test_excel(template_file)
            logger.info(f"创建了模板文件: {template_file}")
        
        # 创建ExcelWriter实例
        writer = ExcelWriter(template_path=str(template_file))
        
        # 写入数据并应用格式化
        logger.info("开始写入数据并应用格式化...")
        result = writer.write_to_excel(test_data, str(test_file), apply_formatting=True)
        
        if result:
            logger.info("数据写入并格式化成功!")
            logger.info(f"请查看生成的文件: {test_file}")
        else:
            logger.error("数据写入或格式化失败!")
        
    except Exception as e:
        logger.error(f"测试过程中发生错误: {e}")
    
    logger.info("ExcelWriter格式化功能测试完成")

if __name__ == "__main__":
    # 执行测试
    test_format_excel_function()
    print("\n" + "-" * 50 + "\n")
    test_excel_writer_with_formatting() 