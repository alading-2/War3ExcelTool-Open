# -*- mode: python ; coding: utf-8 -*-

# 不要在spec文件中直接导入项目模块，因为PyInstaller执行spec时可能找不到src模块
# 改为直接使用字符串常量
PROJECT_NAME = "War3ExcelTool"

# Analysis块（核心配置）
a = Analysis(
    # 主入口文件列表
    ["src/main.py"],
    # Python模块搜索路径（可添加自定义路径）
    pathex=[],
    # 需要包含的二进制文件（DLL、共享库等）
    binaries=[],
    # 需要包含的非代码文件（图片、配置文件等）
    datas=[
        # 确保所有资源文件都被包含，并放在正确的位置
        ("resource/imbed/**", "resource/imbed"),
        ("resource/resource/**",
         "resource"),  # 简化路径，将resource/resource内容直接放到resource下
    ],
    # 需要额外导入的模块列表。显式声明的隐藏导入（PyInstaller无法自动检测的依赖）
    hiddenimports=[],
    # 自定义钩子文件路径
    hookspath=[],
    # 钩子配置参数
    hooksconfig={},
    # 运行时钩子（在程序启动前执行的代码）
    runtime_hooks=[],
    # 需要排除的模块
    excludes=["setup.py"],
    # 是否禁用归档模式
    noarchive=False,
    # 优化级别（0-2）
    optimize=0,
    # 设置构建缓存目录
    workpath="package/build",  # ← 修改为正斜杠
)

# 打包Python字节码到ZIP文件
pyz = PYZ(a.pure)  # a.pure表示所有纯Python模块

splash = Splash(
    "resource/imbed/载入画面.png",
    binaries=a.binaries,
    datas=a.datas,
    text_pos=(30, 230),
    text_size=12,
    minify_script=True,
    # always_on_top=True,
)
# 生成可执行文件配置
exe = EXE(
    pyz,  # 打包后的字节码
    a.scripts,  # 入口脚本
    a.binaries,  # 二进制依赖
    a.datas,  # 数据文件
    splash,
    splash.binaries,
    [],  # 空列表（旧版兼容）
    name=PROJECT_NAME,  # 输出文件名（不带扩展名）
    # workpath=r'package\build',
    # distpath=r'package\War3ExcelTool', # 设置输出目录和名称
    debug=False,  # 是否包含调试信息
    bootloader_ignore_signals=False,  # 是否忽略系统信号
    strip=False,  # 是否去除符号表（减小体积）
    upx=True,  # 是否使用UPX压缩（需安装UPX）
    upx_exclude=[],  # 排除UPX压缩的文件
    runtime_tmpdir=None,  # 运行时临时目录
    console=False,  # 是否显示控制台窗口
    disable_windowed_traceback=False,  # 禁用窗口化异常追踪
    argv_emulation=False,  # 启用参数模拟（macOS专用）
    target_arch=None,  # 目标架构（x86/x64）
    codesign_identity=None,  # macOS代码签名标识
    entitlements_file=None,  # macOS权限配置文件
    icon="resource/imbed/文件图标.ico",  # 可执行文件的图标路径
)
