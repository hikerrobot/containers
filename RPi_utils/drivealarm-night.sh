#!/bin/sh

while true;  do
 	valid="457624"
	scan=`./RFSniffer`
	HOUR="$(date +'%H')"


	if [ "$scan" = "$valid" -a $HOUR -ge 21 -o "$scan" = "$valid" -a $HOUR -lt 07 ]; then
		echo "taking a Night-time photo"
		d=`date +%d%m%y`
		t=`date +%T`
		raspistill -ex night -o 1.jpg -w 1024 -h 768 -q 30
		raspivid -ex night -o $d$t.h264 -t 50000
		convert -pointsize 20 -fill yellow -draw 'text 850,30 "'$t' '$d'"' 1.jpg $d$t.jpg
		mpack -s "Night-time alarm photo" $d$t.jpg you@gmail.com
		rm 1.jpg
	elif [ "$scan" = "$valid" ]; then
		echo "taking a Daytime photo"
		d=`date +%d%m%y`
		t=`date +%T`
		raspistill -o 1.jpg -w 1024 -h 768 -q 30
		raspivid -o $d$t.h264 -t 10000
		convert -pointsize 20 -fill yellow -draw 'text 850,30 "'$t' '$d'"' 1.jpg $d$t.jpg
		mpack -s "Daytime alarm photo" $d$t.jpg you@gmail.com
		rm 1.jpg
	else
		echo "BAD READ:  your code and the valid don't match"
		echo "Your correct valid code should be " $scan
	fi
	sleep 5
done
exit 0
