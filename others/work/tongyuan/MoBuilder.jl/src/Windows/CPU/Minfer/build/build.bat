@echo off
@title build

set BUILD_BASEPATH=%CD%

IF NOT EXIST "%temp%/middle" (
    cd /d %temp%
    md middle
	cd /d middle
	echo. >build_data.txt
	echo. >infer_data.txt
)

IF NOT EXIST "%temp%/out" (
	cd /d %temp%
    mkdir out
) else (
	cd /d %temp%
	rd /q/s out
	mkdir out
)

cd /d %temp%/out
cmake -G "CodeBlocks - MinGW Makefiles" %BUILD_BASEPATH%
cmake --build .

set PATH=%BUILD_BASEPATH%/lib;%PATH%

call main.exe %BUILD_BASEPATH%/../convert/model/converted_model.ms %* %temp%/middle/build_data.txt %temp%/middle/infer_data.txt

