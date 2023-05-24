#!/bin/bash

export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_PRELOAD=/home/tongyuan/MWORKS.Syslab-2023/.julia/miniforge3/lib/libpython3.7m.so

../out/main ../model/servowing.mindir $# $*
