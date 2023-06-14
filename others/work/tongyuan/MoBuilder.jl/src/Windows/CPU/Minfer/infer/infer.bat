@echo off
@title infer

set INFER_BASEPATH=%CD%

IF NOT EXIST "%temp%/middle" (
    cd /d %temp%
    md middle
	cd /d middle
	echo. >build_data.txt
	echo. >infer_data.txt
)

cd /d %temp%/out
set PATH=%INFER_BASEPATH%/../build/lib;%PATH%

call main.exe %INFER_BASEPATH%/converted_model.ms %* %temp%/middle/build_data.txt %temp%/middle/infer_data.txt