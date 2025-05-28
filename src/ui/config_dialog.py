from PyQt5.QtWidgets import (QDialog, QVBoxLayout, QFormLayout, QTabWidget,
                             QDialogButtonBox, QLineEdit, QComboBox, QSpinBox,
                             QCheckBox, QWidget)
from PyQt5.QtCore import Qt
from src.utils.config_manager import ConfigManager


class ConfigDialog(QDialog):
    """
    配置对话框，用于高级设置，控件自动生成与参数自动绑定。
    - 自动根据ConfigManager的参数元信息生成控件（分路径参数和辅助参数两类，分别放在不同Tab页）。
    - 支持QLineEdit、QComboBox、QSpinBox、QCheckBox等多种控件类型，自动适配参数类型和选项。
    - 加载配置时自动将ConfigManager中的参数值同步到控件。
    - 用户点击"确定"时，将控件的值写回ConfigManager并保存到配置文件。
    - 支持"一键重置为默认值"，并自动刷新主界面参数。
    - 所有控件与参数名一一映射，便于后续扩展和维护。
    """

    def __init__(self, parent=None):
        """
        初始化高级配置对话框。
        - 初始化ConfigManager实例。
        - 设置窗口标题和大小。
        - 自动生成参数控件并分组。
        - 加载ConfigManager中的参数值到控件。
        Args:
            parent: 父窗口（通常为主窗口MainWindow）。
        """
        super().__init__(parent)
        self.config_manager = ConfigManager()
        self.setWindowTitle("高级配置")
        self.setMinimumWidth(500)
        self.setMinimumHeight(400)
        # param_widgets用于控件与参数名的映射，便于批量操作
        self.param_widgets = {}
        self.init_ui()
        self.load_config()

    def init_ui(self):
        """
        初始化用户界面，自动生成控件。
        - 创建TabWidget，分"路径设置"、"功能参数"和"高级设置"三页。
        - 每页自动遍历ConfigManager参数元信息，生成对应控件并添加到表单布局。
        - 支持QLineEdit、QComboBox、QSpinBox、QCheckBox等控件类型。
        - 生成的控件与参数名一一映射，便于后续同步。
        - 添加"确定/取消/重置"按钮，绑定相应事件。
        """
        layout = QVBoxLayout()
        self.setLayout(layout)
        tab_widget = QTabWidget()
        layout.addWidget(tab_widget)

        # --- 路径设置选项卡 ---
        paths_tab = QWidget()
        paths_form = QFormLayout()
        paths_tab.setLayout(paths_form)
        for key in ConfigManager.get_params_by_category("path"):
            meta = ConfigManager.get_param_meta(key)
            widget = self._create_widget_for_param(key, meta)
            self.param_widgets[key] = widget
            paths_form.addRow(meta.get("label", key), widget)
        tab_widget.addTab(paths_tab, "路径设置")

        # --- 功能参数选项卡 ---
        feature_tab = QWidget()
        feature_form = QFormLayout()
        feature_tab.setLayout(feature_form)
        for key in ConfigManager.get_params_by_category("feature"):
            meta = ConfigManager.get_param_meta(key)
            widget = self._create_widget_for_param(key, meta)
            self.param_widgets[key] = widget
            feature_form.addRow(meta.get("label", key), widget)
        tab_widget.addTab(feature_tab, "功能参数")

        # --- 辅助参数选项卡 ---
        assist_tab = QWidget()
        assist_form = QFormLayout()
        assist_tab.setLayout(assist_form)
        for key in ConfigManager.get_params_by_category("assist"):
            meta = ConfigManager.get_param_meta(key)
            widget = self._create_widget_for_param(key, meta)
            self.param_widgets[key] = widget
            assist_form.addRow(meta.get("label", key), widget)
        tab_widget.addTab(assist_tab, "高级设置")

        # 按钮区：确定、取消、重置
        button_box = QDialogButtonBox(QDialogButtonBox.Ok
                                      | QDialogButtonBox.Cancel
                                      | QDialogButtonBox.Reset)
        button_box.accepted.connect(self.accept)
        button_box.rejected.connect(self.reject)
        button_box.button(QDialogButtonBox.Reset).clicked.connect(
            self.reset_to_default)
        layout.addWidget(button_box)

    def _create_widget_for_param(self, key, meta):
        """
        根据参数元信息自动创建合适的控件。
        - QLineEdit：文本输入框，适用于字符串/路径参数。
        - QComboBox：下拉框，适用于有限选项（如log_level）。
        - QSpinBox：数字输入框，适用于整数参数（如字体大小）。
        - QCheckBox：复选框，适用于布尔参数。
        Args:
            key: 参数名。
            meta: 参数元信息字典。
        Returns:
            widget: 生成的控件对象。
        """
        widget_type = meta.get("widget", "QLineEdit")
        if widget_type == "QLineEdit":
            widget = QLineEdit()
        elif widget_type == "QComboBox":
            widget = QComboBox()
            # 针对log_level等特殊参数，自动填充选项
            if key == "log_level":
                widget.addItems(
                    ["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"])
        elif widget_type == "QSpinBox":
            widget = QSpinBox()
            # 根据不同参数设置不同的范围
            if key == "font_size":
                widget.setRange(8, 36)  # 字体大小范围
            elif key == "thread_count":
                widget.setRange(0, 64)  # 线程数范围，0表示自动
            elif key == "player_count":
                widget.setRange(1, 12)  # 玩家数量范围
            else:
                widget.setRange(0, 100)  # 默认范围
        elif widget_type == "QCheckBox":
            widget = QCheckBox(meta.get("label", key))
        else:
            widget = QLineEdit()
        widget.setObjectName(key)
        return widget

    def load_config(self):
        """
        从ConfigManager加载参数值到控件。
        - 遍历所有控件，根据参数类型自动设置控件的值。
        - 保证界面初始状态与配置文件一致。
        """
        for key, widget in self.param_widgets.items():
            value = self.config_manager.get(key)
            meta = ConfigManager.get_param_meta(key)
            widget_type = meta.get("widget", "QLineEdit")
            if widget_type == "QLineEdit":
                widget.setText(str(value) if value is not None else "")
            elif widget_type == "QComboBox":
                idx = widget.findText(str(value))
                if idx >= 0:
                    widget.setCurrentIndex(idx)
            elif widget_type == "QSpinBox":
                widget.setValue(
                    int(value) if value is not None else meta.
                    get("default", 14))
            elif widget_type == "QCheckBox":
                widget.setChecked(bool(value))

    def accept(self):
        """
        确认按钮处理，保存控件值到ConfigManager并写入配置文件。
        - 遍历所有控件，将当前值写入ConfigManager。
        - 调用ConfigManager.save_config()持久化。
        - 调用父类accept()关闭对话框。
        """
        for key, widget in self.param_widgets.items():
            meta = ConfigManager.get_param_meta(key)
            widget_type = meta.get("widget", "QLineEdit")
            if widget_type == "QLineEdit":
                self.config_manager.set(key, widget.text())
            elif widget_type == "QComboBox":
                self.config_manager.set(key, widget.currentText())
            elif widget_type == "QSpinBox":
                self.config_manager.set(key, widget.value())
            elif widget_type == "QCheckBox":
                self.config_manager.set(key, widget.isChecked())
        self.config_manager.save_config()
        super().accept()

    def reset_to_default(self):
        """
        重置所有设置为默认值，并刷新主界面参数控件。
        - 调用ConfigManager.reset_to_default()重置参数。
        - 重新加载参数到控件。
        - 如果父窗口有load_config方法，则调用以刷新主界面。
        """
        self.config_manager.reset_to_default()
        self.load_config()
        # 如果父窗口有load_config方法，则调用以刷新主界面
        parent = self.parent()
        if parent and hasattr(parent, "load_config"):
            parent.load_config()
