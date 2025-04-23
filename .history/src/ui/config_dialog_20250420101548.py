from PyQt5.QtWidgets import (
    QDialog, QVBoxLayout, QHBoxLayout, QFormLayout,
    QLabel, QLineEdit, QComboBox, QSpinBox,
    QPushButton, QDialogButtonBox, QTabWidget, QGroupBox,
    QGridLayout, QCheckBox, QWidget
)
from PyQt5.QtCore import Qt

from src.utils.json_config import JsonConfigManager

class ConfigDialog(QDialog):
    """配置对话框，用于高级设置"""

    def __init__(self, config_manager: JsonConfigManager, parent=None):
        """
        初始化配置对话框
        
        Args:
            config_manager: 配置管理器实例
            parent: 父窗口
        """
        super().__init__(parent)
        
        self.config_manager = config_manager
        
        self.setWindowTitle("高级配置")
        self.setMinimumWidth(500)
        self.setMinimumHeight(400)
        
        self.init_ui()
        self.load_config()
    
    def init_ui(self):
        """初始化用户界面"""
        layout = QVBoxLayout()
        self.setLayout(layout)
        
        # 创建选项卡控件
        tab_widget = QTabWidget()
        layout.addWidget(tab_widget)
        
        # --- 常规设置选项卡 ---
        general_tab = QWidget()
        general_layout = QVBoxLayout()
        general_tab.setLayout(general_layout)
        
        # 常规设置表单
        general_form = QFormLayout()
        
        # 批处理大小
        self.batch_size_spin = QSpinBox()
        self.batch_size_spin.setMinimum(1)
        self.batch_size_spin.setMaximum(100)
        general_form.addRow("批处理大小:", self.batch_size_spin)
        
        # 日志级别
        self.log_level_combo = QComboBox()
        self.log_level_combo.addItems(["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"])
        general_form.addRow("日志级别:", self.log_level_combo)
        
        # 添加表单到布局
        general_layout.addLayout(general_form)
        
        # --- 添加所有选项卡 ---
        tab_widget.addTab(general_tab, "常规设置")
        
        # 按钮
        button_box = QDialogButtonBox(
            QDialogButtonBox.Ok | QDialogButtonBox.Cancel | QDialogButtonBox.Reset
        )
        button_box.accepted.connect(self.accept)
        button_box.rejected.connect(self.reject)
        button_box.button(QDialogButtonBox.Reset).clicked.connect(self.reset_to_default)
        
        layout.addWidget(button_box)
    
    def load_config(self):
        """从配置中加载设置"""
        # 常规设置
        self.batch_size_spin.setValue(self.config_manager.get("batch_size", 10))
        
        log_level = self.config_manager.get("log_level", "INFO")
        index = self.log_level_combo.findText(log_level)
        if index >= 0:
            self.log_level_combo.setCurrentIndex(index)
    
    def accept(self):
        """确认按钮处理"""
        # 保存常规设置
        self.config_manager.set("batch_size", self.batch_size_spin.value())
        self.config_manager.set("log_level", self.log_level_combo.currentText())
        
        # 保存所有配置到文件
        self.config_manager.save_config()
        
        super().accept()
    
    def reset_to_default(self):
        """重置所有设置为默认值"""
        self.config_manager.reset_to_default()
        self.load_config() 