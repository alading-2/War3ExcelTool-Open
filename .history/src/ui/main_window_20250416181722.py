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

# from src.core.excel_parser import ExcelParser # No longer directly used here
# from src.core.ts_generator import TSGenerator # No longer directly used here
from src.core.processor import process_files # Import the core processor
from src.utils.config_manager import ConfigManager
from src.utils.file_utils import find_excel_files, ensure_directory
from src.ui.config_dialog import ConfigDialog



class ConversionWorker(QThread):
    """处理文件转换的后台线程类"""

    progress_updated = pyqtSignal(int, int, str)  # 当前进度, 总数, 当前文件
    conversion_done = pyqtSignal(bool, str)  # 成功/失败, 消息
    log_message = pyqtSignal(str)  # 日志消息

    def __init__(self, config: dict):
        """
        初始化转换工作线程

        Args:
            config: 包含所有转换配置的字典
        """
        super().__init__()
        self.config = config
        # No longer need individual attributes like input_dir, output_dir etc.
        # Core components are now used within process_files

    def run(self):
        """运行转换过程，调用核心处理函数"""
        try:
            self.log_message.emit("开始文件转换...")
            # 调用核心处理逻辑
            # Note: process_files should ideally handle logging and progress reporting
            # For now, we'll rely on its return value and basic logging here.
            results = process_files(self.config)

            # Simplified progress reporting for now
            # A more granular progress update would require process_files to yield status
            processed_count = results.get("processed", 0)
            skipped_count = results.get("skipped", 0)
            error_count = results.get("errors", 0)
            total_attempted = processed_count + skipped_count + error_count

            # Emit final progress update (consider it 100% done)
            # Use a placeholder for current_file on final update
            self.progress_updated.emit(total_attempted, total_attempted, "完成") # Simplified

            # Log details from results
            for detail in results.get("details", []):
                file = detail.get("file", "未知文件")
                status = detail.get("status", "未知状态")
                reason = detail.get("reason", "")
                if status == "error":
                    self.log_message.emit(f"错误: 处理 {file} 失败 - {reason}")
                elif status == "skipped":
                     self.log_message.emit(f"跳过: {file} - {reason}")
                # else: # Processed
                #     self.log_message.emit(f"成功: 处理 {file}") # process_files should log success

            # Emit final status signal
            if error_count > 0:
                message = f"转换完成，但有 {error_count} 个错误。查看日志获取详情。"
                self.conversion_done.emit(False, message)
            else:
                message = f"转换成功完成。处理: {processed_count}, 跳过: {skipped_count}."
                self.conversion_done.emit(True, message)

        except Exception as e:
            self.log_message.emit(f"转换过程中发生严重错误: {str(e)}")
            # Log the traceback if possible
            import traceback
            self.log_message.emit(traceback.format_exc())
            self.conversion_done.emit(False, f"转换过程出错: {str(e)}")

    # _sanitize_sheet_name might be needed within specific generators now, not here.


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

        # 将输入目录行添加到输入组的布局中
        input_layout.addLayout(input_dir_layout)
        # input_layout.addWidget(self.recursive_check) # Recursive check moved to options

        # --- INI 输入部分 (Initially Hidden) ---
        self.ini_input_group = QGroupBox("INI 输入 (仅用于 Ini -> Excel)")
        ini_input_layout = QHBoxLayout()
        self.ini_input_group.setLayout(ini_input_layout)

        ini_input_label = QLabel("INI 输入目录/文件:")
        self.ini_input_edit = QLineEdit()
        self.ini_input_edit.setPlaceholderText("选择包含INI文件的目录或单个文件")
        ini_input_button = QPushButton("浏览...")
        ini_input_button.clicked.connect(self.browse_ini_input)

        ini_input_layout.addWidget(ini_input_label)
        ini_input_layout.addWidget(self.ini_input_edit)
        ini_input_layout.addWidget(ini_input_button)
        self.ini_input_group.setVisible(False) # Initially hidden

        # --- 输出部分 ---
        output_group = QGroupBox("输出设置")
        output_layout = QVBoxLayout()
        output_group.setLayout(output_layout)

        # 输出目录选择行 (标签 + 输入框 + 按钮)
        output_dir_layout = QHBoxLayout()
        output_dir_label = QLabel("基础输出目录:") # Changed label
        self.output_dir_edit = QLineEdit()
        self.output_dir_edit.setPlaceholderText("选择所有转换结果的基础输出目录") # Changed placeholder
        output_dir_button = QPushButton("浏览...")
        output_dir_button.clicked.connect(self.browse_output_dir)

        # 将输出目录控件添加到水平布局
        output_dir_layout.addWidget(output_dir_label)
        output_dir_layout.addWidget(self.output_dir_edit)
        output_dir_layout.addWidget(output_dir_button)

        # 将输出目录行添加到输出组的布局中
        output_layout.addLayout(output_dir_layout)

        # --- 转换选项 --- 
        options_group = QGroupBox("转换选项")
        options_layout = QVBoxLayout()
        options_group.setLayout(options_layout)

        self.convert_to_ts_check = QCheckBox("Excel -> TypeScript")
        self.convert_to_lua_check = QCheckBox("Excel -> Lua")
        self.convert_to_ini_check = QCheckBox("Excel -> Ini")
        self.convert_ini_to_excel_check = QCheckBox("Ini -> Excel")
        self.recursive_check = QCheckBox("递归处理输入目录") # Moved here

        options_layout.addWidget(self.convert_to_ts_check)
        options_layout.addWidget(self.convert_to_lua_check)
        options_layout.addWidget(self.convert_to_ini_check)
        options_layout.addWidget(self.convert_ini_to_excel_check)
        options_layout.addWidget(self.recursive_check)

        # Connect Ini->Excel checkbox to show/hide INI input group
        self.convert_ini_to_excel_check.stateChanged.connect(self.toggle_ini_input_visibility)

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
        main_layout.addWidget(self.ini_input_group) # Add INI input group
        main_layout.addWidget(output_group) # 添加输出组
        main_layout.addWidget(options_group) # Add options group
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
        启动转换过程。
        - 获取输入/输出目录和递归选项的值。
        - 对输入进行验证（目录是否为空、是否存在）。
        - 如果验证通过，保存当前UI设置到配置。
        - 禁用“开始转换”按钮，重置进度条。
        - 创建并启动 ConversionWorker 后台线程执行转换。
        - 连接工作线程的信号到主窗口的槽函数以更新UI。
        - 更新状态栏和日志。
        """
        # Gather all configuration from UI elements and config manager
        config = {
            "input_path": self.input_dir_edit.text().strip(),
            "output_path": self.output_dir_edit.text().strip(),
            "ini_input_path": self.ini_input_edit.text().strip(),
            "recursive": self.recursive_check.isChecked(),
            "convert_to_ts": self.convert_to_ts_check.isChecked(),
            "convert_to_lua": self.convert_to_lua_check.isChecked(),
            "convert_to_ini": self.convert_to_ini_check.isChecked(),
            "convert_ini_to_excel": self.convert_ini_to_excel_check.isChecked(),
            # Add other relevant config from ConfigManager
            "log_level": self.config_manager.get("log_level", "INFO"),
            "ts_template_path": self.config_manager.get("ts_template_path", ""),
            "lua_template_path": self.config_manager.get("lua_template_path", ""),
            "ini_section_style": self.config_manager.get("ini_section_style", "SheetName"),
            "ini_comment_style": self.config_manager.get("ini_comment_style", "Both"),
            "excel_header_row": self.config_manager.get("excel_header_row", 1),
            "excel_data_start_row": self.config_manager.get("excel_data_start_row", 2),
            "excel_comment_column": self.config_manager.get("excel_comment_column", "A"),
            "excel_key_column": self.config_manager.get("excel_key_column", "B"),
            "excel_value_column": self.config_manager.get("excel_value_column", "C"),
        }

        # --- Validation ---
        if not config["output_path"]:
            QMessageBox.warning(self, "缺少信息", "请指定基础输出目录")
            return

        excel_to_x = config["convert_to_ts"] or config["convert_to_lua"] or config["convert_to_ini"]
        ini_to_excel = config["convert_ini_to_excel"]

        if not excel_to_x and not ini_to_excel:
             QMessageBox.warning(self, "缺少选择", "请至少选择一种转换类型")
             return

        if excel_to_x:
            if not config["input_path"]:
                QMessageBox.warning(self, "缺少信息", "请为 Excel->* 转换指定输入目录")
                return
            if not os.path.isdir(config["input_path"]): # Check if it's a directory
                 QMessageBox.warning(self, "输入错误", f"Excel 输入路径不是有效目录: {config['input_path']}")
                 return

        if ini_to_excel:
            if not config["ini_input_path"]:
                 QMessageBox.warning(self, "缺少信息", "请为 Ini->Excel 转换指定INI输入路径")
                 return
            if not os.path.exists(config["ini_input_path"]): # Check if path exists (can be file or dir)
                 QMessageBox.warning(self, "输入错误", f"INI 输入路径不存在: {config['ini_input_path']}")
                 return

        # --- Prepare for conversion ---
        # Save current UI settings to config file
        self.save_config() # Save before starting

        # Disable button, clear log, reset progress
        self.convert_button.setEnabled(False) # Corrected button name
        self.log_text.clear() # Corrected log widget name
        self.progress_bar.setValue(0)
        self.progress_bar.setMaximum(0) # Set max to 0 initially, worker will update
        self.progress_bar.setFormat("准备中... (%p%)")
        self.statusBar().showMessage("正在准备转换...")
        self.log_message("开始转换过程...") # Log start message

        # --- Create and start background worker thread ---
        self.worker = ConversionWorker(config) # Pass the config dict
        self.worker.log_message.connect(self.log_message)
        self.worker.progress_updated.connect(self.update_progress)
        self.worker.conversion_done.connect(self.conversion_finished)
        self.worker.start()

    def update_progress(self, current: int, total: int, current_file: str = ""): # Added current_file
        """
        更新进度条

        Args:
            current: 当前处理的文件数
            total: 总文件数
            current_file: 当前正在处理的文件名 (可选)
        """
        if total > 0:
            self.progress_bar.setMaximum(total)
            self.progress_bar.setValue(current)
            # Update format to show current file if provided
            if current_file:
                 # Use basename to keep it short
                 self.progress_bar.setFormat(f"%v/%m (%p%) - {os.path.basename(current_file)}")
            else:
                 self.progress_bar.setFormat("%v/%m (%p%)")
            # Update status bar as well
            status_msg = f"处理文件 {current}/{total}"
            if current_file:
                status_msg += f" - {os.path.basename(current_file)}"
            self.statusBar().showMessage(status_msg)
        else:
            # Handle case where total might be 0 initially or during preparation
            self.progress_bar.setMaximum(100) # Default max if total is 0
            self.progress_bar.setValue(0)
            self.progress_bar.setFormat("准备中... (%p%)" if current == 0 else "%v/%m (%p%)")
            self.statusBar().showMessage("准备中...")

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
        # 加载输入目录
        self.input_dir_edit.setText(self.config_manager.get("input_dir", ""))
        # 加载输出目录
        self.output_dir_edit.setText(self.config_manager.get("output_dir", ""))
        # 加载INI输入路径
        self.ini_input_edit.setText(self.config_manager.get("ini_input_path", ""))
        # 加载递归选项
        self.recursive_check.setChecked(self.config_manager.get("recursive", False))
        # 加载转换选项
        self.convert_to_ts_check.setChecked(self.config_manager.get("convert_to_ts", True))
        self.convert_to_lua_check.setChecked(self.config_manager.get("convert_to_lua", False))
        self.convert_to_ini_check.setChecked(self.config_manager.get("convert_to_ini", False))
        self.convert_ini_to_excel_check.setChecked(self.config_manager.get("convert_ini_to_excel", False))

        # 根据加载的配置更新INI输入组的可见性
        self.toggle_ini_input_visibility()
        # 更新最近文件菜单 (假设此方法已添加)
        # self.update_recent_files_menu()

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
        # 保存INI输入路径
        self.config_manager.set("ini_input_path", self.ini_input_edit.text())
        # 保存递归选项状态
        self.config_manager.set("recursive", self.recursive_check.isChecked())
        # 保存转换选项
        self.config_manager.set("convert_to_ts", self.convert_to_ts_check.isChecked())
        self.config_manager.set("convert_to_lua", self.convert_to_lua_check.isChecked())
        self.config_manager.set("convert_to_ini", self.convert_to_ini_check.isChecked())
        self.config_manager.set("convert_ini_to_excel", self.convert_ini_to_excel_check.isChecked())

        # 将当前输入路径添加到最近文件列表 (假设此方法已添加)
        excel_input = self.input_dir_edit.text()
        ini_input = self.ini_input_edit.text()
        # if excel_input:
        #     self.config_manager.add_recent_file(excel_input)
        # if ini_input:
        #     self.config_manager.add_recent_file(ini_input)

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
