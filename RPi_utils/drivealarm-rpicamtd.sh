#!/bin/sh
while true;  do 
	valid="457624" 
	scan=`./RFSniffer` 
		if [ "$scan" = "$valid" ]; then
	d=`date +%d%m%y` 
	t=`date +%T` 
	raspistill -o 1.jpg -w 1024 -h 768 -q 30 
	raspivid -o $d$t.h264 -t 10000 
	convert -pointsize 20 -fill yellow -draw 'text 850,30 "'$t' '$d'"' 1.jpg $d$t.jpg 
	mpack -s "alarm photo" $d$t.jpg you@gmail.com 
	 
	 	else 
			echo "bad read your code and valid dont match" 
			echo $scan 
		fi 
	sleep 20 
done 
exit 0
