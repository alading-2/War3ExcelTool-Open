from PyQt5.QtWidgets import (
    QDialog, QVBoxLayout, QHBoxLayout, QFormLayout,
    QLabel, QLineEdit, QComboBox, QSpinBox,
    QPushButton, QDialogButtonBox, QTabWidget, QGroupBox,
    QGridLayout, QCheckBox
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
        
        # --- Excel设置选项卡 ---
        excel_tab = QWidget()
        excel_layout = QVBoxLayout()
        excel_tab.setLayout(excel_layout)
        
        # Excel表单
        excel_form = QFormLayout()
        
        # Excel设置 - 标题行号
        self.excel_header_row_spin = QSpinBox()
        self.excel_header_row_spin.setMinimum(1)
        self.excel_header_row_spin.setMaximum(10)
        excel_form.addRow("Excel标题行号:", self.excel_header_row_spin)
        
        # Excel设置 - 数据起始行号
        self.excel_data_start_row_spin = QSpinBox()
        self.excel_data_start_row_spin.setMinimum(2)
        self.excel_data_start_row_spin.setMaximum(20)
        excel_form.addRow("Excel数据起始行号:", self.excel_data_start_row_spin)
        
        # Excel设置 - 列设置
        self.excel_comment_column_edit = QLineEdit()
        excel_form.addRow("Excel注释列:", self.excel_comment_column_edit)
        
        self.excel_key_column_edit = QLineEdit()
        excel_form.addRow("Excel键列:", self.excel_key_column_edit)
        
        self.excel_value_column_edit = QLineEdit()
        excel_form.addRow("Excel值列:", self.excel_value_column_edit)
        
        # 添加表单到布局
        excel_layout.addLayout(excel_form)
        
        # --- 模板设置选项卡 ---
        template_tab = QWidget()
        template_layout = QVBoxLayout()
        template_tab.setLayout(template_layout)
        
        # 模板表单
        template_form = QFormLayout()
        
        # TypeScript模板路径
        self.ts_template_path_edit = QLineEdit()
        template_form.addRow("TypeScript模板路径:", self.ts_template_path_edit)
        
        # Lua模板路径
        self.lua_template_path_edit = QLineEdit()
        template_form.addRow("Lua模板路径:", self.lua_template_path_edit)
        
        # INI设置选项
        self.ini_section_style_combo = QComboBox()
        self.ini_section_style_combo.addItems(["SheetName", "FileName", "Custom"])
        template_form.addRow("INI文件Section生成方式:", self.ini_section_style_combo)
        
        self.ini_comment_style_combo = QComboBox()
        self.ini_comment_style_combo.addItems(["Both", "Semicolon", "Hash", "None"])
        template_form.addRow("INI文件注释风格:", self.ini_comment_style_combo)
        
        # 添加表单到布局
        template_layout.addLayout(template_form)
        
        # --- 添加所有选项卡 ---
        tab_widget.addTab(general_tab, "常规设置")
        tab_widget.addTab(excel_tab, "Excel设置")
        tab_widget.addTab(template_tab, "模板设置")
        
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
        
        # Excel设置
        self.excel_header_row_spin.setValue(self.config_manager.get("excel_header_row", 1))
        self.excel_data_start_row_spin.setValue(self.config_manager.get("excel_data_start_row", 2))
        self.excel_comment_column_edit.setText(self.config_manager.get("excel_comment_column", "A"))
        self.excel_key_column_edit.setText(self.config_manager.get("excel_key_column", "B"))
        self.excel_value_column_edit.setText(self.config_manager.get("excel_value_column", "C"))
        
        # 模板设置
        self.ts_template_path_edit.setText(self.config_manager.get("ts_template_path", ""))
        self.lua_template_path_edit.setText(self.config_manager.get("lua_template_path", ""))
        
        # INI设置
        ini_section_style = self.config_manager.get("ini_section_style", "SheetName")
        index = self.ini_section_style_combo.findText(ini_section_style)
        if index >= 0:
            self.ini_section_style_combo.setCurrentIndex(index)
        
        ini_comment_style = self.config_manager.get("ini_comment_style", "Both")
        index = self.ini_comment_style_combo.findText(ini_comment_style)
        if index >= 0:
            self.ini_comment_style_combo.setCurrentIndex(index)
    
    def accept(self):
        """确认按钮处理"""
        # 保存常规设置
        self.config_manager.set("batch_size", self.batch_size_spin.value())
        self.config_manager.set("log_level", self.log_level_combo.currentText())
        
        # 保存Excel设置
        self.config_manager.set("excel_header_row", self.excel_header_row_spin.value())
        self.config_manager.set("excel_data_start_row", self.excel_data_start_row_spin.value())
        self.config_manager.set("excel_comment_column", self.excel_comment_column_edit.text())
        self.config_manager.set("excel_key_column", self.excel_key_column_edit.text())
        self.config_manager.set("excel_value_column", self.excel_value_column_edit.text())
        
        # 保存模板设置
        self.config_manager.set("ts_template_path", self.ts_template_path_edit.text())
        self.config_manager.set("lua_template_path", self.lua_template_path_edit.text())
        
        # 保存INI设置
        self.config_manager.set("ini_section_style", self.ini_section_style_combo.currentText())
        self.config_manager.set("ini_comment_style", self.ini_comment_style_combo.currentText())
        
        # 保存所有配置到文件
        self.config_manager.save_config()
        
        super().accept()
    
    def reset_to_default(self):
        """重置所有设置为默认值"""
        self.config_manager.reset_to_default()
        self.load_config() 