#!/bin/bash

clear;
while [ 1 ] ;
	echo "$(tput setaf 2)Poisonport$(tput sgr0) is listening on $1 for haxxxorz......";
	#netcat sessions	
	do IP=`nc -vlp $1 2>&1 1> /dev/null | grep from | cut -d[ -f 3 | cut -d] -f 1`;
	echo "Detected portscan from IP ${IP}!!!!! Shields up!";
	#sleep to prevent simultaneous iptable drops	
	sleep $2
	
	if iptables -L INPUT -v -n | grep $IP
	then
		echo "IP in list: $IP"
	else
		echo "IP Added to list: $IP"
	#dropping IP address from iptables
	iptables -A INPUT -p tcp -s ${IP} -j DROP ;
	iptables -A INPUT -p icmp -s ${IP} -j DROP ;
		echo $IP >> IPs.txt
	fi

done

