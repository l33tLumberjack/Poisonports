#!/bin/bash

if [ $# -eq 0 ]
then 
	echo "No arguments supplied"
	echo "2 arguments required a port to listen on and a sleep in seconds to add rules to iptables"
	echo "Usage: $0 PORT SECONDS"
	exit 1
fi

GOOD=$(tput setaf 2)[+]$(tput sgr0)
BAD=$(tput setaf 1)[-]$(tput sgr0)
clear;
echo "$(tput setaf 2)Poisonports$(tput sgr0) is listening on $1";
while [ 1 ];
	#Netcat sessions	
	do IP=`nc -vlp $1 2>&1 1> /dev/null | grep from | cut -d[ -f 3 | cut -d] -f 1`;
	echo "$BAD Connection from IP ${IP} detected on port $1";
	
	#Sleep to prevent simultaneous iptable drops	
	sleep $2
	if iptables -L INPUT -v -n | grep $IP
	then
		echo "$GOOD IP in list: $IP"
	else
		echo "$GOOD IP Added to list: $IP"
	
	#Dropping IP address into iptables
	echo "$GOOD Added Drop rule for $IP"
	iptables -A INPUT -p all -s ${IP} -j DROP ;
	echo $IP >> IPs.txt
	fi
done
