#!/bin/bash
if ! [ "$PWD" = "/home/bastian/repos/atf/pvs-pjs-ss17/atfc/build" ]
then
        echo "you are not in atf/atfc/build"
        exit -1
else 
        cd .. && rm -r build && mkdir build && cd build && ~/tools/cmake-3.9.3/bin/cmake .. && make && cd .. && cd build
fi
