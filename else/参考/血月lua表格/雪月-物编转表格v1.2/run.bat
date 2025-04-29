@echo off

fltmc 1>nul 2>nul&& goto :st

set parameters=
:parameter
@if not "%~1"=="" ( set parameters=%parameters% %~1& shift /1& goto :parameter)
set parameters="%parameters:~1%"

mshta vbscript:createobject("shell.application").shellexecute("%~s0",%parameters%,"","runas",1)(window.close)&exit


:st

cd /d "%~dp0"

@chcp 65001
set "ver=1.2"
@Title 雪月Obj2Excel v%ver% by:雪月灬雪歌
@cls

@rem **********************************
@rem ** by 雪月灬雪歌                 **
@rem **********************************

set "curDir=%~dp0"
set "curDir=%curDir:~0,-1%"

@rem ==========================================================================
@rem ||              w2l路径在 w2l_path.txt文件 里改，不是在这改               ||
@rem ==========================================================================
    set /p w2l=<w2l_path.txt
@rem ==========================================================================
@rem ======！！！           如需使用CLI模式 请配置以下参数         ！！！==========
@rem ==========================================================================

        @rem "地图完整路径:支持Lni地图 例如：F:\F-drive\Project\雪月\MoeHero-master\.w3x"
        set "w3x=F:\F-drive\Desk\XG_lua优化.w3x"

        @rem "至于w2l保存时的混淆优化等，请在w2l目录下的config.ini里配置"

@rem ==========================================================================


@rem 优先使用自定义w2l路径

if exist "%w2l%\w3x2lni.exe" (
   goto :skip_search_w2l
)


call :getw2lpath_cd return
set "w2l=%return%"

if not exist "%w2l%\w3x2lni.exe" (

    echo 找不到W2L !!!
    echo.
    echo    方法1:
    echo 请右击此文件 选择 编辑
    echo 修改文件中 W2L 的路径
    echo.
    echo    方法2:
    echo 将此文件夹复制到W2L目录下
    echo.
    echo 注意: 需要w2l版本至少 2.7.2 ,否则使用过程中需要自己填路径，无法使用拖拽功能

    pause
    exit

)


:skip_search_w2l

cd /d "%curDir%"

echo 当前使用的W3x2Lni:  %w2l%
@echo.

set "lua=%w2l%\bin\w3x2lni-lua"

@echo "--控制台将会展示日志--"

set "mode=%1"

set "entry=gui"
set "arg="

if /i "%mode%" == "-cli" (
    set "entry=cli"
    set "arg=-w3x %w3x%"

    @echo.
    
) else (

    @echo "关闭GUI界面后，控制台将会清理临时目录"
    @echo "所以，请勿先关闭控制台"
    @echo.
)

@echo 当前模式: %entry%
@echo.

cd /d "%curDir%"

"%lua%" -l "main\env" "main\%entry%.lua" %arg% -ver %ver%
:: "%curDir%\env.lua"
if /i "%mode%" == "-cli" (
if /i "%save%" == "lni" (
    @echo.

    @echo 注意: 当前的模式为lni,合并后的lni文件夹在以下临时目录中,请手动复制到你需要的地方
    @echo  --^>  %curDir%\temp

    @echo.
    @echo ^<按任意键进入清理临时目录环节...^> 
    @echo.

    @pause>nul

    @echo ^<再次确认任意键以防错按...^> 
    pause>nul

))

@echo "正在清理临时目录"
@echo   %curDir%\temp
@echo.

rd /s /q "%curDir%\temp"

@echo "清理完毕！"

@echo.
@echo.

exit


::================

:getw2lpath

set "temp=%1"
set "char="
set /a pos=0

:nextloop

    set /a pos-=1

    set "char=%temp:~-1,1%"
    set "temp=%temp:~0,-1%"

    
    
    if "%char%" == "\" (

        set "%~2=%temp%"
        set "return=%temp%"

        goto:eof
    )
    
    
goto :nextloop

:getw2lpath_cd
cd /d "%curDir%"
cd /d ..\

if exist "%cd%\w3x2lni.exe" (
   set "%1=%cd%"
)
cd /d "%curDir%"

goto:eof


::=============