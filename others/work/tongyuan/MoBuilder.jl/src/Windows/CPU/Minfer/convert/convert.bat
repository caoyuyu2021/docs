@echo off
@title convert

set CONVERT_BASEPATH=%CD%

set PATH=%CONVERT_BASEPATH%/lib;%PATH%

cd %CONVERT_BASEPATH%/converter

call converter_lite --fmk=MINDIR --modelFile=../model/before_model.mindir --outputFile=../model/converted_model.ms