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
from src.utils.file_utils import find_excel_files, ensure_directory
from src.ui.config_dialog import ConfigDialog



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
        # 输出目录默认为用户设置的输出目录
        self.output_dir = output_dir
        self.recursive = recursive

        # 核心组件
        self.excel_parser = ExcelParser()
        self.ts_generator = TSGenerator()

    def run(self):
        """运行转换过程"""
        try:
            self.log_message.emit(f"开始在 {self.input_dir} 中搜索Excel文件...")
            # 搜索输入路径下的所有Excel文件，包括xls和xlsx，返回字符串列表
            excel_files = find_excel_files(self.input_dir, self.recursive)

            if not excel_files:
                self.log_message.emit("没有找到Excel文件!")
                self.conversion_done.emit(False, "没有找到Excel文件")
                return

            self.log_message.emit(f"找到 {len(excel_files)} 个Excel文件")
            # 输出目录+output+ts
            self.output_dir = os.path.join(self.output_dir, "output", "ts")
            # 确保目录存在，如果不存在则创建
            if not ensure_directory(self.output_dir):
                # 输出目录创建失败的处理
                self.conversion_done.emit(False, f"无法创建输出目录: {self.output_dir}")
                return

            # 成功处理文件数
            successful_conversions = 0
            # 总文件数
            total_conversions = 0

            for i, file_path in enumerate(excel_files):
                try:
                    self.log_message.emit(f"正在处理: {file_path}")

                    # 获取相对于输入路径的相对路径
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
                        output_file_name = self.ts_generator.generate_ts_file(
                            excel_name, metadata, target_dir
                        )
                        self.log_message.emit(f"成功生成: {output_file_name}")
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
                                output_file_name = self.ts_generator.generate_ts_file(
                                    sheet_excel_name,
                                    metadata,
                                    target_dir,
                                )

                                self.log_message.emit(
                                    f"正在处理{sheet_name}，成功生成: {output_file_name}"
                                )
                                successful_conversions += 1 #转化成功才+1
                            except Exception as sheet_e:
                                self.log_message.emit(
                                    f"处理sheet {sheet_name} 时出错: {str(sheet_e)}"
                                )

                            total_conversions += 1 #不管是否成功都+1

                except Exception as e:
                    self.log_message.emit(f"处理文件 {file_path} 时出错: {str(e)}")

                # 更新进度
                self.progress_updated.emit(i + 1, len(excel_files))

            # 完成
            if successful_conversions == total_conversions:
                self.conversion_done.emit(
                    True, f"成功转换了所有( {total_conversions} 个)工作表"
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
    """
    应用程序主窗口类。
    负责创建和管理用户界面元素，处理用户交互，
    启动后台转换任务，并显示进度和日志信息。
    """

    def __init__(self):
        """
        初始化主窗口。
        - 调用父类构造函数。
        - 初始化配置管理器。
        - 设置窗口标题和最小尺寸。
        - 调用方法初始化UI布局和菜单。
        - 加载之前保存的配置到UI控件。
        """
        super().__init__()

        # 加载配置管理器，用于读写应用程序设置
        self.config_manager = ConfigManager()

        # 设置窗口的基本属性
        self.setWindowTitle("War3ExcelTool")
        self.setMinimumSize(800, 600) # 设置窗口最小尺寸

        # 初始化用户界面元素
        self.init_ui()
        # 创建菜单栏
        self.create_menus()

        # 从配置文件加载上次保存的设置到UI
        self.load_config()

    def init_ui(self):
        """
        初始化主窗口的用户界面布局和控件。
        - 创建中央QWidget作为主窗口内容区域。
        - 设置主垂直布局QVBoxLayout。
        - 创建并配置输入设置区域(QGroupBox)。
        - 创建并配置输出设置区域(QGroupBox)。
        - 创建并配置控制按钮(QPushButton)。
        - 创建并配置进度条(QProgressBar)。
        - 创建并配置日志显示区域(QTextEdit)。
        - 将所有UI组件添加到主布局中。
        - 初始化状态栏。
        """
        # 创建中央部件，所有其他控件都将放置在它上面
        central_widget = QWidget()
        self.setCentralWidget(central_widget)

        # 主布局，垂直排列各个UI区域
        main_layout = QVBoxLayout()
        central_widget.setLayout(main_layout)

        # --- 输入部分 ---
        input_group = QGroupBox("输入设置") # 使用QGroupBox进行分组
        input_layout = QVBoxLayout() # 组内的垂直布局
        input_group.setLayout(input_layout)

        # 输入目录选择行 (标签 + 输入框 + 按钮)
        input_dir_layout = QHBoxLayout() # 水平布局
        input_dir_label = QLabel("输入目录:")
        self.input_dir_edit = QLineEdit() # 输入框
        self.input_dir_edit.setPlaceholderText("选择包含Excel文件的目录") # 提示文字
        input_dir_button = QPushButton("浏览...") # 浏览按钮
        input_dir_button.clicked.connect(self.browse_input_dir) # 连接点击事件

        # 将输入目录控件添加到水平布局
        input_dir_layout.addWidget(input_dir_label)
        input_dir_layout.addWidget(self.input_dir_edit)
        input_dir_layout.addWidget(input_dir_button)

        # 递归处理选项的复选框
        self.recursive_check = QCheckBox("递归处理子目录")

        # 将输入目录行和复选框添加到输入组的布局中
        input_layout.addLayout(input_dir_layout)
        input_layout.addWidget(self.recursive_check)

        # --- 输出部分 ---
        output_group = QGroupBox("输出设置")
        output_layout = QVBoxLayout()
        output_group.setLayout(output_layout)

        # 输出目录选择行 (标签 + 输入框 + 按钮)
        output_dir_layout = QHBoxLayout()
        output_dir_label = QLabel("输出目录:")
        self.output_dir_edit = QLineEdit()
        self.output_dir_edit.setPlaceholderText("选择TypeScript文件的输出目录")
        output_dir_button = QPushButton("浏览...")
        output_dir_button.clicked.connect(self.browse_output_dir)

        # 将输出目录控件添加到水平布局
        output_dir_layout.addWidget(output_dir_label)
        output_dir_layout.addWidget(self.output_dir_edit)
        output_dir_layout.addWidget(output_dir_button)

        # 将输出目录行添加到输出组的布局中
        output_layout.addLayout(output_dir_layout)

        # --- 控制部分 ---
        control_layout = QHBoxLayout() # 水平布局放按钮

        # 开始转换按钮
        self.convert_button = QPushButton("开始转换")
        self.convert_button.clicked.connect(self.start_conversion) # 连接点击事件
        self.convert_button.setMinimumHeight(40) # 设置最小高度
        self.convert_button.setStyleSheet("font-weight: bold;") # 设置样式

        # 将按钮添加到控制布局
        control_layout.addWidget(self.convert_button)

        # --- 进度条部分 ---
        progress_layout = QVBoxLayout() # 垂直布局放标签和进度条
        progress_label = QLabel("进度:")
        self.progress_bar = QProgressBar() # 进度条控件
        self.progress_bar.setTextVisible(True) # 显示百分比文本

        # 将标签和进度条添加到进度布局
        progress_layout.addWidget(progress_label)
        progress_layout.addWidget(self.progress_bar)

        # --- 日志区域 ---
        log_group = QGroupBox("操作日志")
        log_layout = QVBoxLayout()
        log_group.setLayout(log_layout)

        # 日志文本框
        self.log_text = QTextEdit()
        self.log_text.setReadOnly(True) # 设置为只读
        self.log_text.setMinimumHeight(200) # 设置最小高度

        # 将日志文本框添加到日志组布局
        log_layout.addWidget(self.log_text)

        # --- 将所有部分添加到主布局 ---
        main_layout.addWidget(input_group) # 添加输入组
        main_layout.addWidget(output_group) # 添加输出组
        main_layout.addLayout(control_layout) # 添加控制按钮布局
        main_layout.addLayout(progress_layout) # 添加进度条布局
        main_layout.addWidget(log_group) # 添加日志组

        # --- 状态栏 ---
        self.statusBar().showMessage("就绪") # 初始化状态栏消息

    def create_menus(self):
        """
        创建应用程序的菜单栏和菜单项。
        - 创建 "文件" 菜单，包含 "高级设置" 和 "退出" 选项。
        - 创建 "帮助" 菜单，包含 "关于" 选项。
        - 将菜单项的 triggered 信号连接到相应的槽函数。
        """
        # 获取菜单栏
        menu_bar = self.menuBar()

        # --- 文件菜单 ---
        file_menu = menu_bar.addMenu("文件")

        # 高级设置动作
        config_action = QAction("高级设置", self)
        config_action.triggered.connect(self.show_config_dialog) # 连接触发事件
        file_menu.addAction(config_action)

        file_menu.addSeparator() # 添加分隔线

        # 退出动作
        exit_action = QAction("退出", self)
        exit_action.triggered.connect(self.close) # 连接触发事件到窗口关闭
        file_menu.addAction(exit_action)

        # --- 帮助菜单 ---
        help_menu = menu_bar.addMenu("帮助")

        # 关于动作
        about_action = QAction("关于", self)
        about_action.triggered.connect(self.show_about_dialog) # 连接触发事件
        help_menu.addAction(about_action)

    def browse_input_dir(self):
        """
        打开文件对话框让用户选择输入目录。
        - 使用 QFileDialog.getExistingDirectory 获取目录路径。
        - 如果用户选择了目录，则更新输入目录编辑框的文本，并记录日志。
        """
        # 获取当前输入框中的文本作为默认路径
        current_dir = self.input_dir_edit.text()
        # 打开目录选择对话框
        directory = QFileDialog.getExistingDirectory(
            self, "选择输入目录", current_dir # 父窗口, 对话框标题, 默认目录
        )
        # 如果用户选择了目录 (directory 非空)
        if directory:
            self.input_dir_edit.setText(directory) # 更新输入框文本
            self.log_message(f"设置输入目录: {directory}") # 记录日志

    def browse_output_dir(self):
        """
        打开文件对话框让用户选择输出目录。
        - 使用 QFileDialog.getExistingDirectory 获取目录路径。
        - 如果用户选择了目录，则更新输出目录编辑框的文本，并记录日志。
        """
        # 获取当前输出框中的文本作为默认路径
        current_dir = self.output_dir_edit.text()
        # 打开目录选择对话框
        directory = QFileDialog.getExistingDirectory(
            self, "选择输出目录", current_dir # 父窗口, 对话框标题, 默认目录
        )
        # 如果用户选择了目录 (directory 非空)
        if directory:
            self.output_dir_edit.setText(directory) # 更新输出框文本
            self.log_message(f"设置输出目录: {directory}") # 记录日志

    def start_conversion(self):
        """
        启动Excel到TypeScript的转换过程。
        - 获取输入/输出目录和递归选项的值。
        - 对输入进行验证（目录是否为空、是否存在）。
        - 如果验证通过，保存当前UI设置到配置。
        - 禁用“开始转换”按钮，重置进度条。
        - 创建并启动 ConversionWorker 后台线程执行转换。
        - 连接工作线程的信号到主窗口的槽函数以更新UI。
        - 更新状态栏和日志。
        """
        # 获取输入框和复选框的值，并去除首尾空格
        input_dir = self.input_dir_edit.text().strip()
        output_dir = self.output_dir_edit.text().strip()
        recursive = self.recursive_check.isChecked()

        # --- 输入验证 ---
        if not input_dir:
            QMessageBox.warning(self, "错误", "请选择输入目录")
            return # 验证失败，提前返回

        if not os.path.exists(input_dir):
            QMessageBox.warning(self, "错误", f"输入目录不存在: {input_dir}")
            return # 验证失败，提前返回

        if not output_dir:
            QMessageBox.warning(self, "错误", "请选择输出目录")
            return # 验证失败，提前返回

        # --- 准备开始转换 ---
        # 保存当前界面上的设置到配置文件
        self.save_config()

        # 禁用转换按钮，防止重复点击
        self.convert_button.setEnabled(False)
        # 重置进度条
        self.progress_bar.setValue(0)
        self.progress_bar.setMaximum(100) # 先设个默认最大值

        # --- 创建并启动后台工作线程 ---
        self.worker = ConversionWorker(input_dir, output_dir, recursive)
        # 连接信号和槽
        self.worker.progress_updated.connect(self.update_progress) # 更新进度条
        self.worker.conversion_done.connect(self.conversion_finished) # 处理完成事件
        self.worker.log_message.connect(self.log_message) # 记录日志
        # 启动线程
        self.worker.start()

        # 更新UI状态
        self.statusBar().showMessage("转换进行中...")
        self.log_message("开始转换过程...")

    def update_progress(self, current: int, total: int):
        """
        更新进度条和状态栏信息。
        此槽函数由 ConversionWorker 的 progress_updated 信号触发。

        Args:
            current: 当前已处理的文件数。
            total: 总文件数。
        """
        # 设置进度条的最大值和当前值
        self.progress_bar.setMaximum(total)
        self.progress_bar.setValue(current)
        # 更新状态栏显示进度
        self.statusBar().showMessage(f"处理文件 {current}/{total}")

    def conversion_finished(self, success: bool, message: str):
        """
        处理转换完成事件。
        此槽函数由 ConversionWorker 的 conversion_done 信号触发。
        - 重新启用“开始转换”按钮。
        - 根据转换结果（success）显示不同的状态栏消息和消息框。
        - 记录最终的完成或错误消息到日志。

        Args:
            success: 转换是否成功完成（可能部分成功）。
            message: 来自工作线程的最终消息。
        """
        # 重新启用转换按钮
        self.convert_button.setEnabled(True)

        # 根据成功状态显示不同的反馈
        if success:
            self.statusBar().showMessage("转换完成")
            # 显示信息提示框
            QMessageBox.information(self, "完成", message)
        else:
            self.statusBar().showMessage("转换失败")
            # 显示严重错误提示框
            QMessageBox.critical(self, "错误", message)

        # 将最终消息记录到日志
        self.log_message(message)

    def log_message(self, message: str):
        """
        将消息追加到日志文本编辑区域。
        - 使用 append 方法添加新消息，会自动换行。
        - 将滚动条滚动到底部，以显示最新的日志。

        Args:
            message: 要记录的日志消息字符串。
        """
        self.log_text.append(message) # 追加文本
        # 获取垂直滚动条并设置其值为最大值，实现自动滚动到底部
        scrollbar = self.log_text.verticalScrollBar()
        scrollbar.setValue(scrollbar.maximum())

    def show_config_dialog(self):
        """
        显示高级配置对话框。
        - 创建 ConfigDialog 实例。
        - 以模态方式显示对话框 (exec_)。
        - 如果用户点击了 "确定" (返回 QDialog.Accepted)，则记录日志。
        """
        # 创建配置对话框实例，传入配置管理器和父窗口
        dialog = ConfigDialog(self.config_manager, self)
        # 以模态方式显示对话框，会阻塞主窗口直到对话框关闭
        # exec_() 返回对话框的关闭状态 (Accepted 或 Rejected)
        if dialog.exec_() == QDialog.Accepted:
            self.log_message("配置已更新") # 用户点击了确定

    def show_about_dialog(self):
        """
        显示“帮助→关于”信息对话框。
        - 使用 QMessageBox.about 显示包含版本和版权信息的静态文本。
        """
        QMessageBox.about(
            self, # 父窗口
            "关于War3ExcelTool(Excel转ts、lua、ini，ini转excel)", # 对话框标题
            # 对话框内容文本
            "War3ExcelTool v1.0.0\n\n"
            "功能：Excel转ts、lua、ini，ini转excel。\n\n"
            "作者：阿拉丁",
        )

    def load_config(self):
        """
        从配置管理器加载设置并应用到UI控件。
        - 使用 config_manager.get 获取配置值，提供默认值以防配置项不存在。
        - 将获取到的值设置到对应的 QLineEdit 和 QCheckBox 控件。
        """
        # 加载输入目录，如果配置中没有，默认为空字符串
        self.input_dir_edit.setText(self.config_manager.get("input_dir", ""))
        # 加载输出目录，如果配置中没有，默认为空字符串
        self.output_dir_edit.setText(self.config_manager.get("output_dir", ""))
        # 加载递归选项，如果配置中没有，默认为 False
        self.recursive_check.setChecked(self.config_manager.get("recursive", False))

    def save_config(self):
        """
        将当前UI控件中的设置保存到配置管理器。
        - 从 QLineEdit 和 QCheckBox 获取当前值。
        - 使用 config_manager.set 将值存入配置管理器。
        - 调用 config_manager.save_config() 将更改写入配置文件。
        """
        # 保存输入目录
        self.config_manager.set("input_dir", self.input_dir_edit.text())
        # 保存输出目录
        self.config_manager.set("output_dir", self.output_dir_edit.text())
        # 保存递归选项状态
        self.config_manager.set("recursive", self.recursive_check.isChecked())
        # 将内存中的配置更改写入文件
        self.config_manager.save_config()

    def closeEvent(self, event):
        """
        处理窗口关闭事件。
        - 在窗口关闭前调用 save_config 保存当前设置。
        - 调用 event.accept() 允许窗口关闭。

        Args:
            event: QCloseEvent 对象，包含事件信息。
        """
        # 保存当前配置
        self.save_config()
        # 接受关闭事件，允许窗口关闭
        event.accept()
