#!/bin/bash


#loop forever
echo -e "The $(tput setaf 2)poisonports$(tput sgr0) are listening..."
while [ 1 ];
do
	#if file exists
	if [ -a IPs.txt ] 
	then
		#copy for working script
		cp IPs.txt IPs_working.txt
		rm IPs.txt
			#loop each line
			while read line
			do	
				echo -e "Detected a port scan from $(tput setaf 1)$line$(tput sgr0)! Shields are up and counterscan initiated!"
				#portscan
				nmap -T4 -A $line -oN /root/Desktop/$line.txt &> /dev/null;
				echo -e "Counterscan for $(tput setaf 1)$line$(tput sgr0) completed.";
			done <IPs_working.txt
	fi
#sleep for a bit...
sleep 10
done


