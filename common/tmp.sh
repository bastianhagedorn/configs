#!/bin/bash
BENCHMARKS=$(ls)
for bench in $BENCHMARKS ; do
        echo $bench
        pushd $bench > /dev/null
        SIZE=$(ls)
        for i in $SIZE ; do
                pushd $i > /dev/null
                cp ~/development/lift/highLevel/stencil/cgo/ppcg/$bench/$i/$bench.lift .
                popd > /dev/null
        done
        popd > /dev/null
done
