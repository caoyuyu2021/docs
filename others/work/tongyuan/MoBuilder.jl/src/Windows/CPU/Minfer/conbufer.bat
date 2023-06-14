@echo off
@title CONVERT_BUILD_INFER

rem convert

:: 设置当前路径，当前为：{HOME}/Minfer
set CONBUFER_BASEPATH=%CD%/src/Windows/CPU/Minfer

:: 用户自定义的模型路径和模型名称
set MODEL_PATH=%3
set MODEL_NAME=%4


:: 清空convert/model文件夹
cd /d %CONBUFER_BASEPATH%/convert
rd /q/s model
mkdir model

:: 将用户模型放到工具箱下
cd %MODEL_PATH%
if not exist Minfer (mkdir Minfer)
cd %MODEL_PATH%/Minfer
if not exist build (mkdir build)
attrib +h build
if not exist infer (mkdir infer)
attrib +h infer
if not exist SystemModelerExtras (mkdir SystemModelerExtras)
cd %MODEL_PATH%
copy "%MODEL_NAME%" "%CONBUFER_BASEPATH%/convert/model" >nul

:: 模型重命名
cd /d %CONBUFER_BASEPATH%/convert/model
ren *.mindir before_model.mindir

:: 模型转换
cd /d %CONBUFER_BASEPATH%/convert
call convert.bat

:: 将模型另存到infer中
cd /d %CONBUFER_BASEPATH%/convert/model
copy "converted_model.ms" "%CONBUFER_BASEPATH%/infer" >nul

:: 输入参数
set input=%1
set output=%2

:: 模型构建
cd /d %CONBUFER_BASEPATH%/build
gcc -w main.c -o build.out
build.out %input% %output% %CONBUFER_BASEPATH%

rem infer

:: 循环遍历MIMO_Net.mo文件修改参数
(for /f "delims=" %%a in (%CONBUFER_BASEPATH%/template/MIMO_Net.mo) do (
:: 将一个值赋给一个变量
set "str=%%a"
setlocal enabledelayedexpansion
:: 旧字符串=新字符串
set "str=!str:INPUTCOLUMN=%input%!"
set "str=!str:OUTPUTCOLUMN=%output%!"
set "str=!str:MODELPATH=%MODEL_PATH%/Minfer!"
echo,!str!
endlocal
))>"%CONBUFER_BASEPATH%/tool/SystemModelerExtras/NeuralNet/Components/MIMO_Net.mo"

:: 循环遍历callC.mo文件修改参数
(for /f "delims=" %%a in (%CONBUFER_BASEPATH%/template/RunMIMO_Net.mo) do (
:: 将一个值赋给一个变量
set "str=%%a"
setlocal enabledelayedexpansion
:: 旧字符串=新字符串
set "str=!str:INPUTCOLUMN=%input%!"
set "str=!str:OUTPUTCOLUMN=%output%!"
echo,!str!
endlocal
))>"%CONBUFER_BASEPATH%/tool/SystemModelerExtras/NeuralNet/Internal/RunMIMO_Net.mo"

:: 创建模板
cd %CONBUFER_BASEPATH%
xcopy /q/y/s "build" "%MODEL_PATH%/Minfer/build" >nul
xcopy /q/y/s "infer" "%MODEL_PATH%/Minfer/infer" >nul
xcopy /q/y/s "tool/SystemModelerExtras" "%MODEL_PATH%/Minfer/SystemModelerExtras" >nul
echo GENERATE TEMPLATE SUCCESS.

::删除中间过程文件
cd %CONBUFER_BASEPATH%/tool/SystemModelerExtras/NeuralNet/Components
if exist MIMO_Net.mo (del /q MIMO_Net.mo)
cd %CONBUFER_BASEPATH%/tool/SystemModelerExtras/NeuralNet/Internal
if exist RunMIMO_Net.mo (del /q RunMIMO_Net.mo)
cd %CONBUFER_BASEPATH%/build
if exist build.out (del /q build.out)
cd %CONBUFER_BASEPATH%/convert/model
if exist before_model.mindir (del /q before_model.mindir)
cd %CONBUFER_BASEPATH%/infer
if exist converted_model.ms (del /q converted_model.ms)

exit
