#!/bin/sh

while true;  do
 	valid="457624"
	valid2="789789"
	scan=`./RFSniffer`
	HOUR="$(date +'%H')"


	if [ "$scan" = "$valid" ]; then
		echo "Doorbell pressed, taking photo"
		d=`date +%d%m%y`
		t=`date +%T`
		raspistill -o 1.jpg -w 1024 -h 768 -q 30
		raspivid -o $d$t.h264 -t 10000
		convert -pointsize 20 -fill yellow -draw 'text 850,30 "'$t' '$d'"' 1.jpg $d$t.jpg
		mpack -s "Doorbell pressed" $d$t.jpg you@gmail.com
		rm 1.jpg
	elif [ "$scan" = "$valid2" ]; then
		echo "PIR motion detected, taking photo"
		d=`date +%d%m%y`
		t=`date +%T`
		raspistill -o 1.jpg -w 1024 -h 768 -q 30
		raspivid -o $d$t.h264 -t 10000
		convert -pointsize 20 -fill yellow -draw 'text 850,30 "'$t' '$d'"' 1.jpg $d$t.jpg
		mpack -s "PIR motion detected" $d$t.jpg you@gmail.com
		rm 1.jpg
	else
		echo "BAD READ:  your code and the valid don't match"
		echo "Your correct valid code should be " $scan
	fi
	sleep 5
done
exit 0
