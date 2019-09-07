#!/bin/sh
while true;  do 
	valid="457624" 
	scan=`./RFSniffer` 
		if [ "$scan" = "$valid" ]; then
			d=`date +%d%m%y` 
			t=`date +%T` 
			fswebcam -d /dev/video0 -r 640x480 $t$d.jpg 
			echo "Driveway Alarm $t $d" | mail -s "Driveway Alarm" you@gmail.com 
			echo "Driveway Alarm $t $d" 
			echo "Driveway Alarm $t" >> log$d.txt 
			mpack -s "Driveway Alarm photo" $t$d.jpg you@gmail.com 
						 
		else 
			echo "bad read your code and valid dont match" 
			echo $scan 
		fi 
	sleep 20 		 

done 
exit 0
