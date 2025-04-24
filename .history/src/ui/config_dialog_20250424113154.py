from PyQt5.QtWidgets import (QDialog, QVBoxLayout, QFormLayout, QTabWidget,
                             QDialogButtonBox, QLineEdit, QComboBox, QSpinBox,
                             QCheckBox, QWidget)
from PyQt5.QtCore import Qt
from src.utils.config_manager import ConfigManager


class ConfigDialog(QDialog):
    """
    配置对话框，用于高级设置，控件自动生成与参数自动绑定
    """

    def __init__(self, parent=None):
        super().__init__(parent)
        self.config_manager = ConfigManager()
        self.setWindowTitle("高级配置")
        self.setMinimumWidth(500)
        self.setMinimumHeight(400)
        # 用于控件与参数名的映射
        self.param_widgets = {}
        self.init_ui()
        self.load_config()

    def init_ui(self):
        """
        初始化用户界面，自动生成控件
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

        # 按钮
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
        根据参数元信息自动创建控件
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
            widget.setRange(8, 36)  # 字体大小范围
        elif widget_type == "QCheckBox":
            widget = QCheckBox(meta.get("label", key))
        else:
            widget = QLineEdit()
        widget.setObjectName(key)
        return widget

    def load_config(self):
        """
        从配置加载参数到控件
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
        确认按钮处理，保存控件值到配置
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
        重置所有设置为默认值，并刷新主界面参数控件
        """
        self.config_manager.reset_to_default()
        self.load_config()
        # 如果父窗口有load_config方法，则调用以刷新主界面
        parent = self.parent()
        if parent and hasattr(parent, "load_config"):
            parent.load_config()
