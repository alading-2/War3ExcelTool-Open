# -*- mode: python ; coding: utf-8 -*-

# Analysis块（核心配置）
a = Analysis(
    # 主入口文件列表
    ['src\\main.py'],
    # Python模块搜索路径（可添加自定义路径）
    pathex=[],
    # 需要包含的二进制文件（DLL、共享库等）
    binaries=[],
    # 需要包含的非代码文件（图片、配置文件等）
    datas=["README.md",],
    # 需要额外导入的模块列表。显式声明的隐藏导入（PyInstaller无法自动检测的依赖）
    hiddenimports=[],
    # 自定义钩子文件路径
    hookspath=[],
    # 钩子配置参数
    hooksconfig={},
    # 运行时钩子（在程序启动前执行的代码）
    runtime_hooks=[],
    # 需要排除的模块
    excludes=[],
    # 是否禁用归档模式
    noarchive=False,
    # 优化级别（0-2）
    optimize=0,
)

# 打包Python字节码到ZIP文件
pyz = PYZ(a.pure)  # a.pure表示所有纯Python模块

# 生成可执行文件配置
exe = EXE(
    pyz,          # 打包后的字节码
    a.scripts,    # 入口脚本
    a.binaries,   # 二进制依赖
    a.datas,      # 数据文件
    [],           # 空列表（旧版兼容）
    name='War3Excel工具(Excel转ts、lua、ini，ini转excel)',          # 输出文件名（不带扩展名）
    debug=False,               # 是否包含调试信息
    bootloader_ignore_signals=False,  # 是否忽略系统信号
    strip=False,               # 是否去除符号表（减小体积）
    upx=True,                  # 是否使用UPX压缩（需安装UPX）
    upx_exclude=[],            # 排除UPX压缩的文件
    runtime_tmpdir=None,       # 运行时临时目录
    console=False,             # 是否显示控制台窗口
    disable_windowed_traceback=False,  # 禁用窗口化异常追踪
    argv_emulation=False,      # 启用参数模拟（macOS专用）
    target_arch=None,          # 目标架构（x86/x64）
    codesign_identity=None,    # macOS代码签名标识
    entitlements_file=None,    # macOS权限配置文件
)