#!/bin/bash
if [ "$#" -ne 1 ]; then
        echo "Illegal number of parameters (where are all the kernels?)"
	exit -1
fi

function tune {
	NAME=$1
	./atfc -I -i $NAME >> tune.out 
	mv cost.csv $NAME.cost.csv
	mv meta.csv $NAME.meta.csv
}

# copy all kernels to this directory
cp $1/*.cl .

# tune them one after each other 
export -f tune
ls -l | awk '{print $9}' | grep cl | xargs -n 1 bash -c 'tune "$@"' _

# clean up
mv *.csv $1
mv tune.out $1
rm *.cl 
