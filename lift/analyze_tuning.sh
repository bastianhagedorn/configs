#!/bin/bash
### README ########################################################################
# This script is supposed to be executed in the folder containing the cost files  #
# of tuned kernels (<hash>.cl.cost.csv)                                           #
#                                                                                 #
# prints kernels and best config in descending order (best is lowest)             #
###################################################################################

### CREATE SUMMARY ################################################################################
function process_file {
	FILE=$1
	LENGTH="$(cat $FILE | wc -l)"
	# throw away csv which only contain header -> invalid runs
	if [ $LENGTH -gt 1 ]
	then
		POSITION="$(cat $FILE | grep cost | sed -e 's/;/ /g' | wc -w)"
		echo -n $FILE | sed -e 's/.cost.csv//g'
		echo -n " -> "
		BEST="$(cat $FILE | \
			sort -n -r --field-separator=';' -k $POSITION | \
			tail -n 2 | head -1)"
		echo -n $BEST | sed -e 's/;/ /g' | awk -v pos=$POSITION '{printf $pos,"\t"}'
		echo -n ' ('
		echo -n $BEST
		echo -e ")"
	fi
}

export -f process_file

ls -l | awk '{print $9}' | grep cost.csv | xargs -n 1 bash -c 'process_file "$@"' _ | sort -n -k 3 -r > summary.txt
cat summary.txt
echo

### CREATE BEST KERNEL ############################################################################
KERNEL="$(cat summary.txt | awk '{print $1}' | tail -n 1)"
HEADER="$(cat ${KERNEL}.cost.csv | head -n 1)"
CONFIG="$(cat summary.txt | tail -n 1 | awk '{print $4}' | tr -d '()' | sed 's/;/ /g')"

cp $KERNEL best.cl
# remove atf directives
sed -i '/atf::/d' best.cl
sed -i '/\\/d' best.cl
sed -i '/^$/d' best.cl

echo $HEADER | sed 's/\_/\\\_/g' | tr ";" "\n" | head -n -1 > header
echo $CONFIG | tr " " "\n" | head -n -1 > config

# replace all tuning parameters with the best found values
paste header config | while read n k; do sed -i "s/$n/$k/g" best.cl; done 

# remove auxiliary files
rm header
rm config

### CREATE VIOLIN PLOT ############################################################################
function create_csv {
	FILE=$1
	LENGTH="$(cat $FILE | wc -l)"
	# throw away csv which only contain header -> invalid runs
	if [ $LENGTH -gt 1 ]
	then
		POSITION="$(cat $FILE | grep cost | sed -e 's/;/ /g' | wc -w)"
        cat $FILE | tail -n+2 | sed -e 's/;/ /g' | awk -v pos=$POSITION '{print $pos}' >> time.csv
    fi
}

export -f create_csv

echo 'time' > time.csv
ls -l | awk '{print $9}' | grep cost.csv | xargs -n 1 bash -c 'create_csv "$@"' _ 

# get reference runtime
DEFAULT_REF=0
TUNED_REF=0
LIFT_REPRODUCED=0
TUNED_CONFIGS=-1
REQUIRED_CONFIGS=-1
LIFT_CONFIGS="$(cat time.csv | head -n -1 | wc -l)"
LIFT_KERNELS="$(find . -name "*.cost.csv" | wc -l)"
DEFAULT_REF_DIR=../defaultRef
TUNED_REF_DIR=../tunedRef
REPRODUCED_DIR=best
REF_FILE=ref.runtime
WITH_TIME=costWithTime.csv

function show_time () {
    num=$1
    min=0
    hour=0
    day=0
    if((num>59));then
        ((sec=num%60))
        ((num=num/60))
        if((num>59));then
            ((min=num%60))
            ((num=num/60))
            if((num>23));then
                ((hour=num%24))
                ((day=num/24))
            else
                ((hour=num))
            fi
        else
            ((min=num))
        fi
    else
        ((sec=num))
    fi
    #echo "$day"d "$hour"h "$min"m "$sec"s
    echo "$hour"h "$min"m "$sec"s
}

DURATION='N/A'
if [ -f "$WITH_TIME" ];
then
        START=$(cat $WITH_TIME | head -2 | tail -1 | sed 's/;/ /g' | awk '{print $1}')
        END=$(cat $WITH_TIME | tail -1 | sed 's/;/ /g' | awk '{print $1}')
        DURATION_IN_S=$(($END - $START))
        DURATION=$(show_time $DURATION_IN_S | sed 's/ /-/g' ) 
fi

if [ -d "$DEFAULT_REF_DIR" ]; 
then
    # pick median of 10 runs
    DEFAULT_REF="$(cat $DEFAULT_REF_DIR/$REF_FILE | sort -n | sed '5q;d')"
fi
if [ -d "$REPRODUCED_DIR" ]; 
then
    # pick median of 100 runs
    LIFT_REPRODUCED="$(cat $REPRODUCED_DIR/lift.runtime | sort -n | sed '50q;d')"
fi
if [ -d "$TUNED_REF_DIR" ]; 
then
    # pick median of 100 runs
    TUNED_REF="$(cat $TUNED_REF_DIR/$REF_FILE | sort -n | sed '50q;d')"
    TUNED_CONFIGS="$(cat $TUNED_REF_DIR/meta.csv | tail -1 | sed 's/;/ /g' | awk '{print $1}')"
    REQUIRED_CONFIGS="$(cat $TUNED_REF_DIR/meta.csv | tail -1 | sed 's/;/ /g' | awk '{print $4}')"
fi

FOLDER="$(basename $PWD | sed 's/Cl//g')"
BASE="$(basename $PWD)"
ARCHPATH="$(echo $PWD | sed "s/$BASE//g")"
ARCH="$(basename $ARCHPATH)"
VERSIONPATH="$(echo $ARCHPATH | sed "s/$ARCH//g")"
VERSION="$(basename $VERSIONPATH)"

# draw violin 
Rscript /home/bastian/tools/scripts/lift/violin.r -f time.csv -r $DEFAULT_REF -t $TUNED_REF --tunedConfigs $TUNED_CONFIGS --requiredToFind $REQUIRED_CONFIGS -o $FOLDER-$ARCH-$VERSION.pdf --liftConfigs $LIFT_CONFIGS --liftKernels $LIFT_KERNELS --liftReproduced $LIFT_REPRODUCED --duration $DURATION
