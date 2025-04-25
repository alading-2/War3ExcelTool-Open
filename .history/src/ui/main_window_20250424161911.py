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
    QGridLayout,  # 添加 QGridLayout
)
from PyQt5.QtCore import Qt, QThread, pyqtSignal
from PyQt5.QtGui import QTextCursor  # 添加 QTextCursor 导入
import functools

# from src.core.excel_parser import ExcelParser # 不再在此处直接使用
# from src.core.ts_generator import TSGenerator # 不再在此处直接使用
from src.core.processor import process_files  # Import the core processor
from src.utils.config_manager import ConfigManager  # 导入新的配置管理类
from src.ui.config_dialog import ConfigDialog
from src.utils.project_info import ProjectInfo  # 导入项目信息


class ConversionWorker(QThread):
    """处理文件转换的后台线程类"""

    progress_updated = pyqtSignal(int, int, str)  # 当前进度, 总数, 当前文件
    conversion_done = pyqtSignal(bool, str)  # 成功/失败, 消息
    log_message = pyqtSignal(str)  # 日志消息

    def __init__(self):
        """
        初始化转换工作线程

        Args:
            config: 包含所有转换配置的字典
        """
        super().__init__()
        # 不再需要像 input_dir, output_dir 等单独的属性
        # 核心组件现在在 process_files 中使用

    def run(self):
        """运行转换过程，调用核心处理函数"""
        try:
            self.log_message.emit("开始文件转换...")
            # 调用核心处理逻辑，该函数负责实际的文件处理
            # 注意：process_files 理想情况下应处理日志记录和进度报告
            # 目前，我们将依赖其返回值和此处的基日志记录。
            results = process_files()

            # --- 处理转换结果 ---
            # 从返回的字典中提取处理统计信息
            processed_count = results.get("processed", 0)  # 成功处理的文件数
            skipped_count = results.get("skipped", 0)  # 跳过的文件数
            error_count = results.get("errors", 0)  # 发生错误的文件数
            total_attempted = processed_count + skipped_count + error_count  # 尝试处理的总数

            # 发送最终进度更新信号 (简化处理，视为100%完成)
            # 使用 "完成" 作为当前文件名占位符
            self.progress_updated.emit(total_attempted, total_attempted,
                                       "完成")  # 简化处理

            # --- 记录详细日志 ---
            # 遍历结果中的详细信息列表
            for detail in results.get("details", []):
                file = detail.get("file", "未知文件")
                status = detail.get("status", "未知状态")
                reason = detail.get("reason", "")
                # 根据状态记录不同类型的日志消息
                if status == "错误":
                    self.log_message.emit(f"错误: 处理 {file} 失败 - {reason}")
                elif status == "skipped":
                    self.log_message.emit(f"跳过: {file} - {reason}")
                else:  # 已处理 (成功处理的消息应由 process_files 内部记录)
                    self.log_message.emit(
                        f"成功: 处理 {file}")  # process_files 应记录成功信息

            # --- 发送最终状态信号 ---
            # 根据是否有错误发送不同的完成信号和消息
            if error_count > 0:
                message = f"转换完成，但有 {error_count} 个错误。查看日志获取详情。"
                self.conversion_done.emit(True, message)  # 发送失败信号
            else:
                message = f"转换成功完成。处理: {processed_count}, 跳过: {skipped_count}."
                self.conversion_done.emit(True, message)  # 发送成功信号

        except Exception as e:
            # 捕获转换过程中未预料的异常
            self.log_message.emit(f"转换过程中发生严重错误: {str(e)}")
            # 记录完整的错误堆栈信息，便于调试
            import traceback
            self.log_message.emit(traceback.format_exc())
            # 发送失败信号，包含错误信息
            self.conversion_done.emit(False, f"转换过程出错: {str(e)}")

    # _sanitize_sheet_name 现在可能在特定的生成器中需要，而不是在这里。


class MainWindow(QMainWindow):
    """
    应用程序主窗口类。
    负责创建和管理用户界面元素，处理用户交互，
    启动后台转换任务，并显示进度和日志信息。
    同时负责与ConfigManager进行参数同步，
    保证界面控件与配置文件、核心逻辑参数一致。
    """

    def __init__(self):
        """
        初始化主窗口。
        - 初始化ConfigManager，负责参数的加载与保存。
        - 设置窗口标题和最小尺寸。
        - 初始化UI布局和菜单。
        - 从配置文件加载上次保存的参数到UI控件。
        """
        super().__init__()

        # 加载配置管理器，用于读写应用程序设置
        self.config_manager = ConfigManager()

        # 设置窗口的基本属性
        self.setWindowTitle(ProjectInfo.name)
        self.setMinimumSize(800, 600)  # 设置窗口最小尺寸

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
        - 绑定控件事件，实现参数变更时与ConfigManager同步。
        """
        # 创建中央部件，所有其他控件都将放置在它上面
        central_widget = QWidget()
        self.setCentralWidget(central_widget)

        # 主布局，垂直排列各个UI区域
        main_layout = QVBoxLayout()
        central_widget.setLayout(main_layout)

        # --- 输入部分 ---
        input_group = QGroupBox("输入设置")
        input_layout = QVBoxLayout()
        input_group.setLayout(input_layout)

        # 输入目录选择行 (标签 + 输入框 + 按钮)
        input_dir_layout = QHBoxLayout()
        input_dir_label = QLabel("输入目录:")
        self.input_dir_edit = QLineEdit()
        self.input_dir_edit.setPlaceholderText("选择包含Excel文件的目录")
        input_dir_button = QPushButton("浏览...")
        input_dir_button.clicked.connect(self.browse_input_dir)
        input_dir_layout.addWidget(input_dir_label)
        input_dir_layout.addWidget(self.input_dir_edit)
        input_dir_layout.addWidget(input_dir_button)
        input_layout.addLayout(input_dir_layout)

        # --- 输出部分 ---
        output_group = QGroupBox("输出设置")
        output_layout = QVBoxLayout()
        output_group.setLayout(output_layout)
        output_dir_layout = QHBoxLayout()
        output_dir_label = QLabel("基础输出目录:")
        self.output_dir_edit = QLineEdit()
        self.output_dir_edit.setPlaceholderText("选择所有转换结果的基础输出目录")
        output_dir_button = QPushButton("浏览...")
        output_dir_button.clicked.connect(self.browse_output_dir)
        output_dir_layout.addWidget(output_dir_label)
        output_dir_layout.addWidget(self.output_dir_edit)
        output_dir_layout.addWidget(output_dir_button)
        output_layout.addLayout(output_dir_layout)

        # --- 转换选项 ---
        options_group = QGroupBox("转换选项")
        options_layout = QGridLayout()
        options_group.setLayout(options_layout)
        # 自动生成功能参数QCheckBox
        self.feature_checkboxes = {}
        feature_keys = ConfigManager.get_params_by_category("feature")
        for idx, key in enumerate(feature_keys):
            meta = ConfigManager.get_param_meta(key)
            checkbox = QCheckBox(meta.get("label", key))
            self.feature_checkboxes[key] = checkbox
            row, col = divmod(idx, 2)
            options_layout.addWidget(checkbox, row, col)
            # 绑定stateChanged信号，点击即保存
            checkbox.stateChanged.connect(
                functools.partial(self.on_feature_checkbox_changed, key))

        # --- 控制部分 ---
        control_layout = QHBoxLayout()
        self.convert_button = QPushButton("开始转换")
        self.convert_button.clicked.connect(self.start_conversion)
        self.convert_button.setMinimumHeight(40)
        self.convert_button.setStyleSheet("font-weight: bold;")
        control_layout.addWidget(self.convert_button)

        # --- 进度条部分 ---
        progress_layout = QVBoxLayout()
        progress_label = QLabel("进度:")
        self.progress_bar = QProgressBar()
        self.progress_bar.setTextVisible(True)
        progress_layout.addWidget(progress_label)
        progress_layout.addWidget(self.progress_bar)

        # --- 日志区域 ---
        log_group = QGroupBox("操作日志")
        log_layout = QVBoxLayout()
        log_group.setLayout(log_layout)
        self.log_text = QTextEdit()
        self.log_text.setReadOnly(True)
        self.log_text.setMinimumHeight(200)
        self.log_text.setStyleSheet("background-color: white; color: #333333;")
        log_layout.addWidget(self.log_text)

        # --- 将所有部分添加到主布局 ---
        main_layout.addWidget(input_group)
        main_layout.addWidget(output_group)
        main_layout.addWidget(options_group)
        main_layout.addLayout(control_layout)
        main_layout.addLayout(progress_layout)
        main_layout.addWidget(log_group)
        self.statusBar().showMessage("就绪")

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
        config_action.triggered.connect(self.show_config_dialog)  # 连接触发事件
        file_menu.addAction(config_action)

        file_menu.addSeparator()  # 添加分隔线

        # 退出动作
        exit_action = QAction("退出", self)
        exit_action.triggered.connect(self.close)  # 连接触发事件到窗口关闭
        file_menu.addAction(exit_action)

        # --- 帮助菜单 ---
        help_menu = menu_bar.addMenu("帮助")

        # 关于动作
        about_action = QAction("关于", self)
        about_action.triggered.connect(self.show_about_dialog)  # 连接触发事件
        help_menu.addAction(about_action)

    def browse_input_dir(self):
        """
        响应"浏览输入目录"按钮，弹出目录选择对话框。
        - 用户选择目录后，设置到输入目录控件，并同步到ConfigManager。
        """
        # 获取当前输入框中的文本作为默认路径
        current_dir = self.input_dir_edit.text()
        # 打开目录选择对话框
        directory = QFileDialog.getExistingDirectory(
            self,
            "选择输入目录",
            current_dir  # 父窗口, 对话框标题, 默认目录
        )
        # 如果用户选择了目录 (directory 非空)
        if directory:
            self.input_dir_edit.setText(directory)  # 更新输入框文本
            self.log_message(f"设置输入目录: {directory}")  # 记录日志
            self.config_manager.set("input_path", directory)

    def browse_output_dir(self):
        """
        响应"浏览输出目录"按钮，弹出目录选择对话框。
        - 用户选择目录后，设置到输出目录控件，并同步到ConfigManager。
        """
        # 获取当前输出框中的文本作为默认路径
        current_dir = self.output_dir_edit.text()
        # 打开目录选择对话框
        directory = QFileDialog.getExistingDirectory(
            self,
            "选择输出目录",
            current_dir  # 父窗口, 对话框标题, 默认目录
        )
        # 如果用户选择了目录 (directory 非空)
        if directory:
            self.output_dir_edit.setText(directory)  # 更新输出框文本
            self.log_message(f"设置输出目录: {directory}")  # 记录日志
            self.config_manager.set("output_path", directory)

    def start_conversion(self):
        """
        启动转换过程。
        - 从UI控件和配置管理器收集所有必要的配置信息。
        - 对输入进行验证（目录是否为空、是否存在、类型是否正确）。
        - 如果验证通过，保存当前UI设置到配置文件。
        - 禁用"开始转换"按钮，重置进度条和日志区域。
        - 创建并启动 ConversionWorker 后台线程执行转换。
        - 连接工作线程的信号到主窗口的槽函数以更新UI。
        - 更新状态栏和日志。
        """
        # --- 收集配置 ---
        # 从UI元素和配置管理器收集所有转换所需的参数
        config = {
            # --- 核心路径 ---
            "input_path": os.path.normpath(self.input_dir_edit.text().strip()),
            "output_path":
            os.path.normpath(self.output_dir_edit.text().strip()),
            # --- 转换选项 ---
            # 递归参数直接从ConfigManager读取
            "recursive": self.config_manager.get("recursive", True),
        }
        # 自动收集所有功能参数
        for key, checkbox in self.feature_checkboxes.items():
            config[key] = checkbox.isChecked()
        # 其他高级设置参数
        config["log_level"] = self.config_manager.get("log_level", "INFO")

        # --- 输入验证 ---
        # 1. 必须指定基础输出目录
        if not config["output_path"]:
            QMessageBox.warning(self, "缺少信息", "请指定基础输出目录")
            return

        # 检查是否选择了至少一种转换类型
        excel_to_x = config.get("convert_to_ts") or config.get(
            "convert_to_lua") or config.get("convert_to_ini")
        ini_to_excel = config.get("convert_ini_to_excel")
        if not excel_to_x and not ini_to_excel:
            QMessageBox.warning(self, "缺少选择", "请至少选择一种转换类型")
            return

        # 2. 如果进行 Excel -> * 转换，必须指定有效的输入目录
        if excel_to_x:
            if not config["input_path"]:
                QMessageBox.warning(self, "缺少信息", "请为 Excel->* 转换指定输入目录")
                return
            if not os.path.isdir(config["input_path"]):
                QMessageBox.warning(
                    self, "输入错误", f"Excel 输入路径不是有效目录: {config['input_path']}")
                return

        # --- 准备转换 ---
        # 在开始转换前保存当前UI设置到配置文件
        self.save_config()

        # 禁用开始按钮，防止重复点击
        self.convert_button.setEnabled(False)
        # 清空日志区域
        self.log_text.clear()
        # 重置进度条：设置当前值为0，最大值设为0（稍后由worker更新），设置初始格式
        self.progress_bar.setValue(0)
        self.progress_bar.setMaximum(0)
        self.progress_bar.setFormat("准备中... (%p%)")
        # 更新状态栏信息
        self.statusBar().showMessage("正在准备转换...")
        # 在日志区记录开始信息
        self.log_message("开始转换过程...")

        # --- 启动后台线程 ---
        self.worker = ConversionWorker()
        self.worker.log_message.connect(self.log_message)
        self.worker.progress_updated.connect(self.update_progress)
        self.worker.conversion_done.connect(self.conversion_finished)
        self.worker.start()

    def update_progress(self,
                        current: int,
                        total: int,
                        current_file: str = ""):
        """
        更新进度条和状态栏。
        此槽函数由 ConversionWorker 的 progress_updated 信号触发。

        Args:
            current: 当前处理的文件计数。
            total: 需要处理的总文件数。
            current_file: (可选) 当前正在处理的文件名。
        """
        # 只有在总数大于0时才更新进度条，避免除零错误和无效状态
        if total > 0:
            # 设置进度条的最大值和当前值
            self.progress_bar.setMaximum(total)
            self.progress_bar.setValue(current)
            # 更新进度条文本格式，如果提供了当前文件名，则显示
            if current_file:
                # 使用 os.path.basename 获取文件名，避免显示完整路径
                self.progress_bar.setFormat(
                    f"%v/%m (%p%) - {os.path.basename(current_file)}")
            else:
                # 默认格式，只显示数值和百分比
                self.progress_bar.setFormat("%v/%m (%p%)")
            # 同时更新状态栏信息，提供更详细的进度反馈
            status_msg = f"处理文件 {current}/{total}"
            if current_file:
                status_msg += f" - {os.path.basename(current_file)}"
            self.statusBar().showMessage(status_msg)
        else:
            # 处理 total 为 0 的情况 (例如，初始化时或没有找到文件)
            # 设置一个默认最大值，并将值设为0，显示准备状态
            self.progress_bar.setMaximum(100)  # 使用100作为默认最大值
            self.progress_bar.setValue(0)
            self.progress_bar.setFormat("准备中... (%p%)" if current ==
                                        0 else "%v/%m (%p%)")
            self.statusBar().showMessage("准备中...")

    def conversion_finished(self, success: bool, message: str):
        """
        处理转换完成事件。
        此槽函数由 ConversionWorker 的 conversion_done 信号触发。
        - 重新启用"开始转换"按钮。
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
        - 根据消息类型使用不同颜色。
        - 使用 appendHtml 方法添加带格式的消息。
        - 将滚动条滚动到底部，以显示最新的日志。

        Args:
            message: 要记录的日志消息字符串。
        """
        # 根据消息前缀设置颜色
        if message.startswith("成功:"):
            colored_message = f'<font color="#2e8b57">{message}</font>'  # 深绿色
        elif message.startswith("错误:"):
            colored_message = f'<font color="#cc0000">{message}</font>'  # 深红色
        elif message.startswith("跳过:"):
            colored_message = f'<font color="#ff8c00">{message}</font>'  # 深橙色
        elif message.startswith("警告:"):
            colored_message = f'<font color="#ff8c00">{message}</font>'  # 深橙色
        else:
            colored_message = f'<font color="#333333">{message}</font>'  # 深灰色

        # 移动光标到文本末尾
        self.log_text.moveCursor(QTextCursor.End)
        # 插入带格式的文本和换行符
        self.log_text.insertHtml(colored_message + "<br>")
        # 获取垂直滚动条并设置其值为最大值，实现自动滚动到底部
        scrollbar = self.log_text.verticalScrollBar()
        scrollbar.setValue(scrollbar.maximum())

    def show_config_dialog(self):
        """
        打开高级设置对话框（ConfigDialog），用于管理辅助参数。
        - 打开前先将ConfigManager中的参数同步到ConfigDialog。
        - 关闭后将ConfigDialog中的参数同步回ConfigManager，并保存。
        """
        dialog = ConfigDialog(self)
        if dialog.exec_() == QDialog.Accepted:
            self.log_message("配置已更新")
            self.load_config()  # 配置更新后刷新主界面参数控件

    def show_about_dialog(self):
        """
        显示"帮助→关于"信息对话框。
        - 使用 QMessageBox.about 显示包含版本和版权信息的静态文本。
        """
        # QMessageBox.about方法只接受3个参数(parent, caption, text)
        QMessageBox.about(
            self,  # 父窗口
            f"关于{ProjectInfo.name}",  # 对话框标题
            f"{ProjectInfo.name} {ProjectInfo.version}\n\n"
            f"作者：{ProjectInfo.author}\n"
            f"描述：{ProjectInfo.description}\n\n")

    def load_config(self):
        """
        从ConfigManager加载参数配置，并同步到界面控件。
        - 读取ConfigManager中的参数值，设置到对应的输入/输出目录等控件。
        - 保证界面初始状态与配置文件一致。
        - 若有自动生成的参数控件，也应在此处同步初始值。
        """
        config = self.config_manager.get_all()
        self.input_dir_edit.setText(config.get("input_path", ""))
        self.output_dir_edit.setText(config.get("output_path", ""))
        # 自动加载功能参数QCheckBox
        for key, checkbox in self.feature_checkboxes.items():
            checkbox.setChecked(
                config.get(
                    key,
                    ConfigManager.get_param_meta(key).get("default", False)))

    def save_config(self):
        """
        将界面控件的参数值写回ConfigManager，并保存到配置文件。
        - 读取输入/输出目录等控件的当前值，写入ConfigManager。
        - 若有自动生成的参数控件，也应同步其当前值。
        - 调用ConfigManager.save_config()将所有参数持久化。
        """
        self.config_manager.set("input_path", self.input_dir_edit.text())
        self.config_manager.set("output_path", self.output_dir_edit.text())
        # 自动保存功能参数QCheckBox
        for key, checkbox in self.feature_checkboxes.items():
            self.config_manager.set(key, checkbox.isChecked())
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

    def on_feature_checkbox_changed(self, key, state):
        """
        功能参数QCheckBox点击时立即保存到ConfigManager和config.cfg
        """
        value = self.feature_checkboxes[key].isChecked()
        self.config_manager.set(key, value)
        self.config_manager.save_config()
