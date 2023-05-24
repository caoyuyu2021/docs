#!/bin/bash

if [ -d ../out ]; then
    rm -rf ../out
fi

mkdir ../out
cd ../out || exit

if [ -f "Makefile" ]; then
  make clean
fi

cmake ../build \
    -DMINDSPORE_PATH="`python -m pip show mindspore-gpu | grep Location | awk '{print $2"/mindspore"}' | xargs realpath`"
make

export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_PRELOAD=/home/tongyuan/MWORKS.Syslab-2023/.julia/miniforge3/lib/libpython3.7m.so

../out/main ../model/servowing.mindir $# $*
