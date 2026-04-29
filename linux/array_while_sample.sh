#!/bin/bash

#Array
arrays=("A" "B" "C" "D")

i=0
len=${#arrays[@]}

while [ $i -lt $len ]; do
	array=${arrays[$i]}
	
	echo "array:: [$array]"
	
	((i++))
done

exit 1