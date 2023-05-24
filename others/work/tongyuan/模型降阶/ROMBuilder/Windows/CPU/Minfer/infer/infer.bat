@echo off
@title infer

set BASEPATH=%CD%

IF NOT EXIST "%temp%/middle" (
    cd /d %temp%
    md middle
	cd /d middle
	echo. >build_data.txt
	echo. >infer_data.txt
)

cd /d %BASEPATH%/../out
set PATH=../build/lib;%PATH%

call main.exe ../model/servowing.ms %* %temp%/middle/build_data.txt %temp%/middle/infer_data.txt