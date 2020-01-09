#!/usr/bin/env bash

OPENMP=1
DEBUG=0

# Check wheter the system has GPU or not
which nvidia-smi >> /dev/null 2&>1
if [[ "$?" = "0" ]]; then
    GPU=1
else
    GPU=0
fi

# Check wheter the system has cuDNN or not
locate libcudnn.so --quiet
if [[ "$?" = "0" ]]; then
    CUDNN=1
else
    CUDNN=0
fi

# Check wheter the system has OpenCV or not
pkg-config opencv
if [[ "$?" = "0" ]]; then
    OPENCV=1
else
    OPENCV=0
fi

make clean >> /dev/null 2&>1

echo "=========================================================================="
echo "Compiling options set as: "
echo "GPU=${GPU} CUDNN=${CUDNN} OPENCV=${OPENCV} OPENMP=${OPENMP} DEBUG=${DEBUG}"
echo "=========================================================================="

make GPU=${GPU} CUDNN=${CUDNN} OPENCV=${OPENCV} OPENMP=${OPENMP} DEBUG=${DEBUG} -j
