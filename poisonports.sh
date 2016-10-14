#!/bin/bash
if [ $# -eq 0 ]
then 
	echo "No config file supplied using default config file"
	cat config | while read in;
	do  
		gnome-terminal --tab -e "./shields.sh $in";
	done
else
	cat $1 | while read in;
	do
		gnome-terminal --tab -e "./shields.sh $in";
	done
fi
./counterscan.sh &
