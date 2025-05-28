@echo off
setlocal EnableDelayedExpansion
echo War3ExcelTool依赖安装工具
echo ============================

:: 检查是否存在python命令
where python >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo 错误：未检测到Python环境！
    echo 请先安装Python：
    echo https://www.python.org/downloads/
    echo.
    echo 按任意键退出...
    pause > nul
    exit /b 1
)

:: 检查pip是否可用
python -m pip --version >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo 错误：未检测到pip！
    echo 请确保pip已安装并可用。
    echo.
    echo 按任意键退出...
    pause > nul
    exit /b 1
)

:: 运行pip安装脚本
echo 正在检查并安装缺失的库...
python install_pip_deps.py

echo.
echo 按任意键退出...
pause > nul 