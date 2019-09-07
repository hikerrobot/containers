#!/bin/sh

while true;  do 
	valid="457624" 
	scan=`./RFSniffer` 
		if [ "$scan" = "$valid" ]; then
			d=`date +%d%m%y` 
			t=`date +%T` 
			raspistill -o $t$d.jpg -w 1024 -h 768 -q 30 -hf 
			echo "Driveway alarm $t $d" | mail -s "Driveway alarm" you@gmail.com 
			echo "Driveway alarm $t $d" 
			echo "Driveway alarm $t" >> log$d.txt 
			raspivid -o $t$d.h264 -t 10000 
			mpack -s "door open photo" $t$d.jpg you@gmail.com 
			 
		else 
			echo "bad read your code and valid dont match" 
			echo $scan 
		fi 
	sleep 20 
done 
exit 0
