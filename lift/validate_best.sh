#!/bin/bash

#### IMPORTANT ###############################
# depends on analyze_tuning.sh to run before #
##############################################
if [ "$#" -ne 1 ]; then
	echo "Illegal number of parameters (provide input size to create exec_X.csv)"
	echo "Used to infer input sizes used"
	exit -1
fi

KERNEL="$(cat summary.txt | awk '{print $1}' | tail -n 1)"
HEADER="$(cat ${KERNEL}.cost.csv | head -n 1 | sed 's/;/ /g')"
CONFIG="$(cat summary.txt | tail -n 1 | awk '{print $4}' | tr -d '()' | sed 's/;/ /g')"

# create exec csv for generic-harness
# structure: < useless, gs0, gs1, gs2, ls0, ls1, ls2, kernelfileWithoutDotCl, 0, 0 >
# first element was used to pass input size -- not used anylonger
# last two specify how many local buffers and somethings else -- not used in this case
echo $HEADER
echo $CONFIG
SIZE=$1
echo "<0,$1,>"

