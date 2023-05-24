#!/bin/bash

PACKAGE_ROOT_PATH=$(cd "$(dirname $0)" || exit; pwd)
export LD_LIBRARY_PATH=${PACKAGE_ROOT_PATH}/lib:${LD_LIBRARY_PATH}
cd ${PACKAGE_ROOT_PATH}/converter
./converter_lite --fmk=MINDIR --modelFile=../model/servowing.mindir --outputFile=../../model/servowing.ms
