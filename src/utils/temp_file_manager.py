#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
temp_file_manager.py - 临时文件管理器

此模块实现了一个统一的临时文件管理器，负责创建、管理和清理临时文件，
支持线程安全操作和进程退出时自动清理功能。
"""

import os
import shutil
import time
import uuid
import tempfile
import atexit
import logging
from threading import Lock
from typing import Set, Optional


class TempFileManager:
    """
    临时文件管理器
    负责创建、管理和清理临时文件
    """

    _instance = None
    _temp_files = set()  # 记录所有创建的临时文件
    _temp_dirs = set()  # 记录所有创建的临时目录
    _main_temp_dir = None  # 主临时目录
    _lock = Lock()  # 线程安全锁

    def __new__(cls):
        """单例模式实现"""
        if cls._instance is None:
            cls._instance = super(TempFileManager, cls).__new__(cls)
            cls._instance._initialize()
        return cls._instance

    def _initialize(self):
        """初始化临时文件管理器"""
        self.logger = logging.getLogger(__name__)

        # 创建主临时目录
        self._main_temp_dir = tempfile.mkdtemp(prefix="war3excel_")
        self._temp_dirs.add(self._main_temp_dir)
        self.logger.info(f"创建主临时目录: {self._main_temp_dir}")

        # 注册退出时清理
        atexit.register(self.cleanup_all)

    def create_temp_dir(self, prefix: str = "") -> str:
        """
        创建临时目录
        
        参数:
            prefix: 目录名前缀
            
        返回:
            临时目录路径
        """
        with self._lock:
            # 生成唯一目录名
            unique_id = str(uuid.uuid4())[:8]
            if prefix:
                dir_name = f"{prefix}_{unique_id}"
            else:
                dir_name = f"temp_{unique_id}"

            temp_dir_path = os.path.join(self._main_temp_dir, dir_name)

            try:
                # 创建目录
                os.makedirs(temp_dir_path, exist_ok=True)
                # 记录临时目录
                self._temp_dirs.add(temp_dir_path)
                self.logger.debug(f"创建临时目录: {temp_dir_path}")
                return temp_dir_path
            except Exception as e:
                self.logger.error(f"创建临时目录失败: {str(e)}", exc_info=True)
                raise

    def create_temp_file(self,
                         source_file: Optional[str] = None,
                         prefix: str = "",
                         suffix: str = "") -> str:
        """
        创建临时文件
        
        参数:
            source_file: 可选的源文件路径，如果提供则复制源文件内容
            prefix: 文件名前缀
            suffix: 文件名后缀
            
        返回:
            临时文件路径
        """
        with self._lock:
            # 生成唯一文件名
            unique_id = str(uuid.uuid4())[:8]
            if prefix:
                base_name = f"{prefix}_{unique_id}"
            else:
                base_name = f"temp_{unique_id}"

            if suffix:
                if not suffix.startswith('.'):
                    suffix = f".{suffix}"
                file_name = f"{base_name}{suffix}"
            elif source_file:
                # 使用源文件的扩展名
                _, file_ext = os.path.splitext(source_file)
                file_name = f"{base_name}{file_ext}"
            else:
                file_name = base_name

            temp_file_path = os.path.join(self._main_temp_dir, file_name)

            try:
                if source_file:
                    # 复制源文件
                    shutil.copy2(source_file, temp_file_path)
                else:
                    # 创建空文件
                    with open(temp_file_path, 'wb') as f:
                        pass

                # 记录临时文件
                self._temp_files.add(temp_file_path)
                self.logger.debug(f"创建临时文件: {temp_file_path}")
                return temp_file_path
            except Exception as e:
                self.logger.error(f"创建临时文件失败: {str(e)}", exc_info=True)
                raise

    def remove_temp_file(self,
                         temp_file_path: str,
                         max_retries: int = 5,
                         retry_delay: float = 0.5) -> bool:
        """
        安全删除临时文件，支持多次重试
        
        参数:
            temp_file_path: 临时文件路径
            max_retries: 最大重试次数
            retry_delay: 重试间隔(秒)
            
        返回:
            是否删除成功
        """
        with self._lock:
            if not os.path.exists(temp_file_path):
                # 如果文件已经不存在，从集合中移除并返回成功
                if temp_file_path in self._temp_files:
                    self._temp_files.remove(temp_file_path)
                return True

            success = False
            attempts = 0

            while not success and attempts < max_retries:
                try:
                    os.remove(temp_file_path)
                    # 删除成功，从集合中移除
                    if temp_file_path in self._temp_files:
                        self._temp_files.remove(temp_file_path)
                    self.logger.debug(f"删除临时文件成功: {temp_file_path}")
                    success = True
                except Exception as e:
                    attempts += 1
                    if attempts >= max_retries:
                        self.logger.warning(
                            f"无法删除临时文件 {temp_file_path} (尝试 {attempts}/{max_retries}): {str(e)}"
                        )
                    else:
                        self.logger.debug(
                            f"删除临时文件失败，将在{retry_delay}秒后重试: {temp_file_path}")
                        # 等待一小段时间，让系统释放文件句柄
                        time.sleep(retry_delay)

            return success

    def remove_temp_dir(self,
                        temp_dir_path: str,
                        max_retries: int = 5,
                        retry_delay: float = 0.5) -> bool:
        """
        安全删除临时目录，支持多次重试
        
        参数:
            temp_dir_path: 临时目录路径
            max_retries: 最大重试次数
            retry_delay: 重试间隔(秒)
            
        返回:
            是否删除成功
        """
        with self._lock:
            if not os.path.exists(temp_dir_path):
                # 如果目录已经不存在，从集合中移除并返回成功
                if temp_dir_path in self._temp_dirs:
                    self._temp_dirs.remove(temp_dir_path)
                return True

            success = False
            attempts = 0

            while not success and attempts < max_retries:
                try:
                    shutil.rmtree(temp_dir_path)
                    # 删除成功，从集合中移除
                    if temp_dir_path in self._temp_dirs:
                        self._temp_dirs.remove(temp_dir_path)
                    self.logger.debug(f"删除临时目录成功: {temp_dir_path}")
                    success = True
                except Exception as e:
                    attempts += 1
                    if attempts >= max_retries:
                        self.logger.warning(
                            f"无法删除临时目录 {temp_dir_path} (尝试 {attempts}/{max_retries}): {str(e)}"
                        )
                    else:
                        self.logger.debug(
                            f"删除临时目录失败，将在{retry_delay}秒后重试: {temp_dir_path}")
                        # 等待一小段时间，让系统释放文件句柄
                        time.sleep(retry_delay)

            return success

    def cleanup_all(self):
        """清理所有临时文件和临时目录"""
        with self._lock:
            self.logger.info("开始清理所有临时文件和目录...")

            # 清理临时文件
            temp_files = self._temp_files.copy()
            for temp_file in temp_files:
                try:
                    self.remove_temp_file(temp_file)
                except Exception as e:
                    self.logger.warning(f"清理临时文件时出错: {temp_file} - {str(e)}")

            # 清理临时目录（主目录除外）
            temp_dirs = {
                dir_path
                for dir_path in self._temp_dirs
                if dir_path != self._main_temp_dir
            }
            for temp_dir in temp_dirs:
                try:
                    self.remove_temp_dir(temp_dir)
                except Exception as e:
                    self.logger.warning(f"清理临时目录时出错: {temp_dir} - {str(e)}")

            # 最后清理主临时目录
            if self._main_temp_dir and os.path.exists(self._main_temp_dir):
                try:
                    shutil.rmtree(self._main_temp_dir)
                    self._temp_dirs.discard(self._main_temp_dir)
                    self.logger.info(f"删除主临时目录: {self._main_temp_dir}")
                except Exception as e:
                    self.logger.warning(
                        f"删除主临时目录时出错: {self._main_temp_dir} - {str(e)}")

    @property
    def temp_files_count(self) -> int:
        """获取当前临时文件数量"""
        with self._lock:
            return len(self._temp_files)

    @property
    def temp_dirs_count(self) -> int:
        """获取当前临时目录数量"""
        with self._lock:
            return len(self._temp_dirs)
