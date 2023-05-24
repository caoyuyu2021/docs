@echo off
@title build

set BASEPATH=%CD%

IF NOT EXIST "%temp%/middle" (
    cd /d %temp%
    md middle
	cd /d middle
	echo. >build_data.txt
	echo. >infer_data.txt
)

IF NOT EXIST "%BASEPATH%/../out" (
	cd /d ..
    md out
)

cd /d %BASEPATH%/../out
cmake -G "CodeBlocks - MinGW Makefiles" %BASEPATH%
cmake --build .

set PATH=../build/lib;%PATH%

call main.exe ../model/servowing.ms %* %temp%/middle/build_data.txt %temp%/middle/infer_data.txt