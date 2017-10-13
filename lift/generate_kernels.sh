#!/bin/bash

### README #########################################################
# Invokes all lifts rewriting stages for generic kernels
#
# REQUIRES: high-level expressions to end with .lift
# EXPECTS: high-level expression and config
####################################################################
if [ "$#" -ne 2 ]; then
        echo "Illegal number of parameters (path to high-level expression + path to config.json)"
	exit -1
fi

EXPRESSION="$(basename $1 | sed 's/.lift//g')"
FOLDER="$(basename $2 | sed 's/.json//g')"
mkdir $FOLDER
cd $FOLDER
HighLevelRewrite --file $2 $1
MemoryMappingRewrite --file $2 $EXPRESSION
GenericKernelPrinter --file $2 $EXPRESSION
cp $2 .
cd ..
