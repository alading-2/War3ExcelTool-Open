import sys
import os
from typing import List, Optional
from PyQt5.QtWidgets import (
    QDialog,
    QApplication,
    QMainWindow,
    QWidget,
    QVBoxLayout,
    QHBoxLayout,
    QPushButton,
    QLabel,
    QLineEdit,
    QFileDialog,
    QCheckBox,
    QProgressBar,
    QTextEdit,
    QMessageBox,
    QGroupBox,
    QAction,
    QMenu,
)
from PyQt5.QtCore import Qt, QThread, pyqtSignal

from src.core.excel_parser import ExcelParser
from src.core.ts_generator import TSGenerator
from src.utils.config_manager import ConfigManager
from src.utils.logger import get_logger
from src.utils.file_utils import find_excel_files, ensure_directory
from src.ui.config_dialog import ConfigDialog

logger = get_logger(__name__)


class ConversionWorker(QThread):
    """处理Excel到TS转换的后台线程类"""

    progress_updated = pyqtSignal(int, int)  # 当前进度, 总数
    conversion_done = pyqtSignal(bool, str)  # 成功/失败, 消息
    log_message = pyqtSignal(str)  # 日志消息

    def __init__(self, input_dir: str, output_dir: str, recursive: bool):
        """
        初始化转换工作线程

        Args:
            input_dir: 输入目录
            output_dir: 输出目录
            recursive: 是否递归处理子目录
        """
        super().__init__()
        self.input_dir = input_dir
        self.output_dir = output_dir
        self.recursive = recursive

        # 核心组件
        self.excel_parser = ExcelParser()
        self.ts_generator = TSGenerator()

    def run(self):
        """运行转换过程"""
        try:
            self.log_message.emit(f"开始在 {self.input_dir} 中搜索Excel文件...")
            # 搜索Excel文件，包括xls和xlsx，返回字符串列表
            excel_files = find_excel_files(self.input_dir, self.recursive)

            if not excel_files:
                self.log_message.emit("没有找到Excel文件!")
                self.conversion_done.emit(False, "没有找到Excel文件")
                return

            self.log_message.emit(f"找到 {len(excel_files)} 个Excel文件")

            # 确保目录存在，如果不存在则创建
            if not ensure_directory(self.output_dir):
                # 输出目录创建失败的处理
                self.conversion_done.emit(False, f"无法创建输出目录: {self.output_dir}")
                return

            # 处理每个Excel文件
            successful_conversions = 0
            total_conversions = 0

            for i, file_path in enumerate(excel_files):
                try:
                    self.log_message.emit(f"正在处理: {file_path}")

                    # 获取相对于输入路径的相对路径，比如输入路径是else\\Test\\excel，里面有文件夹test
                    # 比如file_path=else\\Test\\excel\\test\\test.xlsx
                    # 输入路径self.input_dir=else\\Test\\excel
                    # rel_path=test\\test.xlsx
                    # rel_dir=test
                    # 这样的目的是根据输入路径的子目录路径生成输出目录的子目录结构
                    rel_path = os.path.relpath(file_path, self.input_dir)  # 相对路径
                    rel_dir = os.path.dirname(rel_path)  # 返回文件路径的目录。

                    # 在输出目录中创建相应的子目录结构
                    target_dir = self.output_dir
                    # rel_dir不为空，且不等于.，说明有子目录
                    if rel_dir and rel_dir != ".":
                        target_dir = os.path.join(self.output_dir, rel_dir)
                        ensure_directory(target_dir)  # 确保目录存在，如果不存在则创建

                    # 从文件路径中提取文件名，不包括扩展名
                    excel_name = os.path.splitext(os.path.basename(file_path))[0]

                    # 解析Excel的所有sheet
                    sheets_data = self.excel_parser.parse_excel(file_path)

                    # 如果只有一个sheet，省略sheet名
                    if len(sheets_data) == 1:
                        sheet_name, metadata = sheets_data[0]

                        # 生成TS文件
                        output_file = self.ts_generator.generate_ts_file(
                            excel_name, metadata, target_dir
                        )

                        self.log_message.emit(f"成功生成: {output_file}")
                        successful_conversions += 1
                        total_conversions += 1
                    else:
                        # 有多个sheet，为每个sheet生成独立的TS文件
                        for sheet_name, metadata in sheets_data:
                            # 为了确保sheet名适合作为变量名的一部分，替换掉不允许的字符
                            safe_sheet_name = self._sanitize_sheet_name(sheet_name)

                            # 生成带有sheet名的文件名
                            sheet_excel_name = f"{excel_name}_{safe_sheet_name}"

                            try:
                                # 生成TS文件
                                output_file = self.ts_generator.generate_ts_file(
                                    sheet_excel_name,
                                    metadata,
                                    target_dir,
                                    sheet_name=sheet_name,  # 传递sheet名便于日志记录
                                )

                                self.log_message.emit(
                                    f"成功生成({sheet_name}): {output_file}"
                                )
                                successful_conversions += 1
                            except Exception as sheet_e:
                                self.log_message.emit(
                                    f"处理sheet {sheet_name} 时出错: {str(sheet_e)}"
                                )

                            total_conversions += 1

                except Exception as e:
                    self.log_message.emit(f"处理文件 {file_path} 时出错: {str(e)}")

                # 更新进度
                self.progress_updated.emit(i + 1, len(excel_files))

            # 完成
            if successful_conversions == total_conversions:
                self.conversion_done.emit(
                    True, f"成功转换了所有 {total_conversions} 个工作表"
                )
            else:
                self.conversion_done.emit(
                    True,
                    f"完成转换: {successful_conversions}/{total_conversions} 个工作表成功",
                )

        except Exception as e:
            self.log_message.emit(f"转换过程中出错: {str(e)}")
            self.conversion_done.emit(False, f"转换过程出错: {str(e)}")

    def _sanitize_sheet_name(self, sheet_name: str) -> str:
        """
        清理sheet名称，使其适合作为变量名的一部分

        Args:
            sheet_name: 原始sheet名称

        Returns:
            清理后的sheet名称，只包含字母、数字和下划线
        """
        # 替换空格为下划线
        sanitized = sheet_name.replace(" ", "_")

        # 过滤出合法的标识符字符
        sanitized = "".join(c for c in sanitized if c.isalnum() or c == "_")

        # 确保不以数字开头
        if sanitized and sanitized[0].isdigit():
            sanitized = "s" + sanitized

        # 如果清理后为空，使用默认名称
        if not sanitized:
            sanitized = "sheet"

        return sanitized


class MainWindow(QMainWindow):
    """应用程序主窗口"""

    def __init__(self):
        """初始化主窗口"""
        super().__init__()

        # 加载配置
        self.config_manager = ConfigManager()

        # 设置窗口属性
        self.setWindowTitle("War3Excel工具(Excel转ts、lua、ini，ini转excel)")
        self.setMinimumSize(800, 600)

        # 初始化UI
        self.init_ui()
        self.create_menus()

        # 加载保存的配置
        self.load_config()

    def init_ui(self):
        """初始化用户界面"""
        # 创建中央部件
        central_widget = QWidget()
        self.setCentralWidget(central_widget)

        # 主布局
        main_layout = QVBoxLayout()
        central_widget.setLayout(main_layout)

        # 输入部分
        input_group = QGroupBox("输入设置")
        input_layout = QVBoxLayout()
        input_group.setLayout(input_layout)

        # 输入目录选择
        input_dir_layout = QHBoxLayout()
        input_dir_label = QLabel("输入目录:")
        self.input_dir_edit = QLineEdit()
        self.input_dir_edit.setPlaceholderText("选择包含Excel文件的目录")
        input_dir_button = QPushButton("浏览...")
        input_dir_button.clicked.connect(self.browse_input_dir)

        input_dir_layout.addWidget(input_dir_label)
        input_dir_layout.addWidget(self.input_dir_edit)
        input_dir_layout.addWidget(input_dir_button)

        # 递归处理选项
        self.recursive_check = QCheckBox("递归处理子目录")

        input_layout.addLayout(input_dir_layout)
        input_layout.addWidget(self.recursive_check)

        # 输出部分
        output_group = QGroupBox("输出设置")
        output_layout = QVBoxLayout()
        output_group.setLayout(output_layout)

        # 输出目录选择
        output_dir_layout = QHBoxLayout()
        output_dir_label = QLabel("输出目录:")
        self.output_dir_edit = QLineEdit()
        self.output_dir_edit.setPlaceholderText("选择TypeScript文件的输出目录")
        output_dir_button = QPushButton("浏览...")
        output_dir_button.clicked.connect(self.browse_output_dir)

        output_dir_layout.addWidget(output_dir_label)
        output_dir_layout.addWidget(self.output_dir_edit)
        output_dir_layout.addWidget(output_dir_button)

        output_layout.addLayout(output_dir_layout)

        # 控制部分
        control_layout = QHBoxLayout()

        self.convert_button = QPushButton("开始转换")
        self.convert_button.clicked.connect(self.start_conversion)
        self.convert_button.setMinimumHeight(40)
        self.convert_button.setStyleSheet("font-weight: bold;")

        control_layout.addWidget(self.convert_button)

        # 进度条
        progress_layout = QVBoxLayout()
        progress_label = QLabel("进度:")
        self.progress_bar = QProgressBar()
        self.progress_bar.setTextVisible(True)

        progress_layout.addWidget(progress_label)
        progress_layout.addWidget(self.progress_bar)

        # 日志区域
        log_group = QGroupBox("操作日志")
        log_layout = QVBoxLayout()
        log_group.setLayout(log_layout)

        self.log_text = QTextEdit()
        self.log_text.setReadOnly(True)
        self.log_text.setMinimumHeight(200)

        log_layout.addWidget(self.log_text)

        # 添加各个部分到主布局
        main_layout.addWidget(input_group)
        main_layout.addWidget(output_group)
        main_layout.addLayout(control_layout)
        main_layout.addLayout(progress_layout)
        main_layout.addWidget(log_group)

        # 状态栏
        self.statusBar().showMessage("就绪")

    def create_menus(self):
        """创建菜单"""
        # 文件菜单
        file_menu = self.menuBar().addMenu("文件")

        config_action = QAction("高级设置", self)
        config_action.triggered.connect(self.show_config_dialog)
        file_menu.addAction(config_action)

        file_menu.addSeparator()

        exit_action = QAction("退出", self)
        exit_action.triggered.connect(self.close)
        file_menu.addAction(exit_action)

        # 帮助菜单
        help_menu = self.menuBar().addMenu("帮助")

        about_action = QAction("关于", self)
        about_action.triggered.connect(self.show_about_dialog)
        help_menu.addAction(about_action)

    def browse_input_dir(self):
        """浏览并选择输入目录"""
        directory = QFileDialog.getExistingDirectory(
            self, "选择输入目录", self.input_dir_edit.text()
        )
        if directory:
            self.input_dir_edit.setText(directory)
            self.log_message(f"设置输入目录: {directory}")

    def browse_output_dir(self):
        """浏览并选择输出目录"""
        directory = QFileDialog.getExistingDirectory(
            self, "选择输出目录", self.output_dir_edit.text()
        )
        if directory:
            self.output_dir_edit.setText(directory)
            self.log_message(f"设置输出目录: {directory}")

    def start_conversion(self):
        """开始转换过程"""
        input_dir = self.input_dir_edit.text().strip()
        output_dir = self.output_dir_edit.text().strip()
        recursive = self.recursive_check.isChecked()

        # 验证输入
        if not input_dir:
            QMessageBox.warning(self, "错误", "请选择输入目录")
            return

        if not os.path.exists(input_dir):
            QMessageBox.warning(self, "错误", f"输入目录不存在: {input_dir}")
            return

        if not output_dir:
            QMessageBox.warning(self, "错误", "请选择输出目录")
            return

        # 保存配置
        self.save_config()

        # 禁用控件
        self.convert_button.setEnabled(False)
        self.progress_bar.setValue(0)

        # 创建并启动工作线程
        self.worker = ConversionWorker(input_dir, output_dir, recursive)
        self.worker.progress_updated.connect(self.update_progress)
        self.worker.conversion_done.connect(self.conversion_finished)
        self.worker.log_message.connect(self.log_message)
        self.worker.start()

        self.statusBar().showMessage("转换进行中...")
        self.log_message("开始转换过程...")

    def update_progress(self, current: int, total: int):
        """更新进度条"""
        self.progress_bar.setMaximum(total)
        self.progress_bar.setValue(current)
        self.statusBar().showMessage(f"处理文件 {current}/{total}")

    def conversion_finished(self, success: bool, message: str):
        """转换完成处理"""
        # 重新启用控件
        self.convert_button.setEnabled(True)

        if success:
            self.statusBar().showMessage("转换完成")
            QMessageBox.information(self, "完成", message)
        else:
            self.statusBar().showMessage("转换失败")
            QMessageBox.critical(self, "错误", message)

        self.log_message(message)

    def log_message(self, message: str):
        """添加消息到日志区域"""
        self.log_text.append(message)
        # 滚动到底部
        self.log_text.verticalScrollBar().setValue(
            self.log_text.verticalScrollBar().maximum()
        )

    def show_config_dialog(self):
        """显示配置对话框"""
        dialog = ConfigDialog(self.config_manager, self)
        if dialog.exec_() == QDialog.Accepted:
            self.log_message("配置已更新")

    def show_about_dialog(self):
        """显示关于对话框"""
        QMessageBox.about(
            self,
            "关于War3Excel工具(Excel转ts、lua、ini，ini转excel)",
            "War3Excel工具(Excel转ts、lua、ini，ini转excel) v1.0.0\n\n"
            "一个将Excel表格数据自动转换为TypeScript代码的工具。\n\n"
            "© 2023 Python高级工程师",
        )

    def load_config(self):
        """从配置中加载设置"""
        self.input_dir_edit.setText(self.config_manager.get("input_dir", ""))
        self.output_dir_edit.setText(self.config_manager.get("output_dir", ""))
        self.recursive_check.setChecked(self.config_manager.get("recursive", False))

    def save_config(self):
        """保存当前设置到配置中"""
        self.config_manager.set("input_dir", self.input_dir_edit.text())
        self.config_manager.set("output_dir", self.output_dir_edit.text())
        self.config_manager.set("recursive", self.recursive_check.isChecked())
        self.config_manager.save_config()

    def closeEvent(self, event):
        """窗口关闭事件，保存配置"""
        self.save_config()
        event.accept()
