from PyQt5.QtWidgets import (
    QDialog, QVBoxLayout, QHBoxLayout,
    QLabel, QProgressBar, QPushButton,
    QTextEdit
)
from PyQt5.QtCore import Qt, pyqtSignal, QTimer

class ProgressDialog(QDialog):
    """显示进度的对话框"""
    
    cancelled = pyqtSignal()
    
    def __init__(self, title: str, parent=None):
        """
        初始化进度对话框
        
        Args:
            title: 对话框标题
            parent: 父窗口
        """
        super().__init__(parent)
        
        self.setWindowTitle(title)
        self.setMinimumSize(500, 300)
        self.setModal(True)
        
        self.init_ui()
    
    def init_ui(self):
        """初始化用户界面"""
        layout = QVBoxLayout()
        self.setLayout(layout)
        
        # 消息标签
        self.message_label = QLabel("处理中...")
        layout.addWidget(self.message_label)
        
        # 进度条
        self.progress_bar = QProgressBar()
        self.progress_bar.setTextVisible(True)
        layout.addWidget(self.progress_bar)
        
        # 详细信息
        self.detail_text = QTextEdit()
        self.detail_text.setReadOnly(True)
        layout.addWidget(self.detail_text)
        
        # 取消按钮
        button_layout = QHBoxLayout()
        self.cancel_button = QPushButton("取消")
        self.cancel_button.clicked.connect(self.cancel)
        button_layout.addStretch()
        button_layout.addWidget(self.cancel_button)
        
        layout.addLayout(button_layout)
    
    def set_range(self, minimum: int, maximum: int):
        """设置进度条范围"""
        self.progress_bar.setRange(minimum, maximum)
    
    def set_value(self, value: int):
        """设置进度条当前值"""
        self.progress_bar.setValue(value)
    
    def set_message(self, message: str):
        """设置消息文本"""
        self.message_label.setText(message)
    
    def add_detail(self, text: str):
        """添加详细信息文本"""
        self.detail_text.append(text)
        # 滚动到底部
        self.detail_text.verticalScrollBar().setValue(
            self.detail_text.verticalScrollBar().maximum()
        )
    
    def cancel(self):
        """取消按钮处理"""
        self.cancel_button.setEnabled(False)
        self.set_message("正在取消...")
        self.cancelled.emit() 