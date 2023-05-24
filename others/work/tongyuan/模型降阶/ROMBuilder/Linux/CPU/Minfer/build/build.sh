#!/bin/bash

BASEPATH=$(cd "$(dirname $0)" || exit; pwd)

if [ -d ${BASEPATH}/../out ]; then
    rm -rf ${BASEPATH}/../out
fi

mkdir -p ../out
cd ${BASEPATH}/../out || exit
cmake ${BASEPATH}
make
../out/main ../model/servowing.ms $# $*
