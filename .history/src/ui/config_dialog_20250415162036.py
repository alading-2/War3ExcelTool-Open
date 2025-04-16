from PyQt5.QtWidgets import (
    QDialog, QVBoxLayout, QHBoxLayout, QFormLayout,
    QLabel, QLineEdit, QComboBox, QSpinBox,
    QPushButton, QDialogButtonBox
)
from PyQt5.QtCore import Qt

from src.utils.config_manager import ConfigManager

class ConfigDialog(QDialog):
    """配置对话框，用于高级设置"""

    def __init__(self, config_manager: ConfigManager, parent=None):
        """
        初始化配置对话框
        
        Args:
            config_manager: 配置管理器实例
            parent: 父窗口
        """
        super().__init__(parent)
        
        self.config_manager = config_manager
        
        self.setWindowTitle("高级配置")
        self.setMinimumWidth(400)
        
        self.init_ui()
        self.load_config()
    
    def init_ui(self):
        """初始化用户界面"""
        layout = QVBoxLayout()
        self.setLayout(layout)
        
        # 表单布局
        form_layout = QFormLayout()
        
        # 批处理大小
        self.batch_size_spin = QSpinBox()
        self.batch_size_spin.setMinimum(1)
        self.batch_size_spin.setMaximum(100)
        form_layout.addRow("批处理大小:", self.batch_size_spin)
        
        # 日志级别
        self.log_level_combo = QComboBox()
        self.log_level_combo.addItems(["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"])
        form_layout.addRow("日志级别:", self.log_level_combo)
        
        layout.addLayout(form_layout)
        
        # 按钮
        button_box = QDialogButtonBox(
            QDialogButtonBox.Ok | QDialogButtonBox.Cancel
        )
        button_box.accepted.connect(self.accept)
        button_box.rejected.connect(self.reject)
        
        layout.addWidget(button_box)
    
    def load_config(self):
        """从配置中加载设置"""
        self.batch_size_spin.setValue(self.config_manager.get("batch_size", 10))
        
        log_level = self.config_manager.get("log_level", "INFO")
        index = self.log_level_combo.findText(log_level)
        if index >= 0:
            self.log_level_combo.setCurrentIndex(index)
    
    def accept(self):
        """确认按钮处理"""
        # 保存配置
        self.config_manager.set("batch_size", self.batch_size_spin.value())
        self.config_manager.set("log_level", self.log_level_combo.currentText())
        self.config_manager.save_config(
            
        )
        
        super().accept() 