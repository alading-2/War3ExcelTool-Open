# -*- mode: python ; coding: utf-8 -*-

from src.utils.project_info import project_info  # 导入项目信息

# Analysis块（核心配置）
a = Analysis(
    # 主入口文件列表
    ['src\main.py'],
    # Python模块搜索路径（可添加自定义路径）
    pathex=[],
    # 需要包含的二进制文件（DLL、共享库等）
    binaries=[],
    # 需要包含的非代码文件（图片、配置文件等）
    datas=[
        ('resource/imbed/**', 'resource/imbed'),
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
    excludes=['setup.py'],
    # 是否禁用归档模式
    noarchive=False,
    # 优化级别（0-2）
    optimize=0,
    # 设置构建缓存目录
    workpath=r'package\build',  # ← 新增这行
)

# 打包Python字节码到ZIP文件
pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

# 注册自定义引导程序
splash = Splash('splash.png',
                binaries=a.binaries,
                datas=a.datas,
                text_pos=None,
                text_size=12,
                minify_script=True)

# 生成可执行文件配置
exe = EXE(
    pyz,
    a.scripts,
    splash,
    splash.binaries,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name=project_info.name,  # 输出文件名（不带扩展名）
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    icon='src\\favicon.ico')
