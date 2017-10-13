#!/bin/bash
### README ########################################################################
# creates all lift exploration kernels from high-level expressions 
# execute anywhere
###################################################################################

############################ WORKS ONLY FOR SMALL CURRENTLY
mkdir kernels
cd kernels
find ~/development/lift/highLevel/stencil/cgo -name "small" | while read LINE ; do
    echo $LINE
    TMP="$(echo $LINE | sed 's/\/small//g')"
    BENCH="$(basename $TMP)"
    echo $BENCH
    mkdir $BENCH
    cd $BENCH
    generate_kernels_for_folder.py $LINE $BENCH.lift
    cd -
done



