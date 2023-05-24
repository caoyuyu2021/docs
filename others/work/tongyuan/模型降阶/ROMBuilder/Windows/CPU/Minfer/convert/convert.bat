@echo off
@title convert

set BASEPATH=%CD%

set PATH=%BASEPATH%/lib;%PATH%

cd %BASEPATH%/converter

call converter_lite --fmk=MINDIR --modelFile=../model/servowing.mindir --outputFile=../../model/servowing.ms