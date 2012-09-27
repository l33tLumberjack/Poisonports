#!/bin/bash

gnome-terminal --tab-with-profile=counterscan --title="23" --command="./shields.sh 23 3" --tab-with-profile=counterscan --title="25" --command="./shields.sh 25 5" --tab-with-profile=counterscan --title="445" --command="./shields.sh 445 7" --tab-with-profile=counterscan --title="1433" --command="./shields.sh 1433 11" --tab-with-profile=counterscan --title="3306" --command="./shields.sh 3306 13" --tab-with-profile=counterscan --title="8080" --command="./shields.sh 8080 8" --tab-with-profile=counterscan --title="POISON" --command="./counterscan.sh"&

echo "done"


