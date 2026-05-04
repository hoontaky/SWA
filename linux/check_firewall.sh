#!/bin/bash

#IP List
ips=("192.168.0.1" "192.168.0.2" "192.168.0.3" "192.168.0.4")

i=0
len=${#ips[@]}

while [ $i -lt $len ]; do
	ip=${ips[$i]}
	
	echo "check ip :: " $ip
	
	nc -w 1 -i 1 -v $ip 22
	
	((i++))
done

exit 1