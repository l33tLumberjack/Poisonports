#!/bin/bash

GOOD=$(tput setaf 2)[+]$(tput sgr0)
BAD=$(tput setaf 1)[-]$(tput sgr0)
echo -e "$(tput setaf 2)Poisonports$(tput sgr0) is listening..."
while [ 1 ];
do
	if [ -a IPs.txt ] 
	then
		cp IPs.txt IPs_working.txt
		rm IPs.txt
			while read line
			do	
				echo -e "$GOOD Detected a port scan from $line counterscan initiated!"
				nmap -T4 -A $line -oN ./ScanResults/$line.txt &> /dev/null;
				echo -e "$GOOD Counterscan for $line completed.";
			done <IPs_working.txt
	fi
sleep 10
done
