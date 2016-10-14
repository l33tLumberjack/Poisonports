# Poisonports

v2.0 -- 10/13/2016

Beau Bullock

Shane Bradfield
				 				
## Description

Poisonports is a set of self defense scripts to be used in Capture The Flag (CTF) events where the competitors are allowed to attack each other. This is a very basic version of the project and has many areas for improvement. Basically, Poisonports sets up listeners on multiple ports. Then, when a port has been connected to, like when an attacker is running a portscan, the script captures their IP address and adds a rule to iptables to drop all further packets from that IP. A counterscan is then initiated against the attacking IP so you can continue to go about your flag capturing and check back later on Poisonports to see that it has captured service information about your opponents.

### poisonports.sh 
Opens a terminal with multiple tabs.  Each tab is a seperate shields.sh instance for different ports with the main tab running counterscan.sh. You can modify the listening ports by changing the config file to contain on each line the port you want to emulate and then a timeout in seconds that is used by shields.sh in order to prevent iptables breaking.

### shields.sh 
Creates a netcat listener on a variable port. Once a connection has been made to the specified port the IP is checked against iptables to see if it has been added already. If not shields.sh adds the IP to IPs.txt to be used later in the counterscan and an iptables rule is added to drop all connections from the connecting IP.

### counterscan.sh 
A script that checks the file IPs.txt every 10 seconds to see if it has been created. If so it copies the file to IPs_working.txt and deletes IPs.txt. For each IP address in IPs_working.txt an nmap scan is launched and the results are put in a text file located in the ScanResults inside of the directory where Poisonports is located.


## Requirements

gnome-terminal

nmap

nc

## How-to
To run poisonports make sure all three files (poisonports.sh, shields.sh, and counterscan.sh) are all in the same folder.
./poisonports.sh

## TODO
- [ ] Prevent firewalling our own IP

- [ ] Add option for specifying listening ports

- [ ] Add option to choose type of scan (intense, fast, OS detect, etc.)

- [ ] Add option to whitelist IPs

- [ ] Print port information gathered from scans to POISON tab 

- [ ] Add option to flood IP with packets

## Known issues
Occasionally the same IP will be added to IPs.txt causing it to be scanned twice.


