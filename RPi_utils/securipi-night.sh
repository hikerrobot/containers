#!/bin/sh
echo "4" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio4/direction

while true;  do
 	trap 'echo "4" > /sys/class/gpio/unexport' 0
	stat=`cat /sys/class/gpio/gpio4/value`
	HOUR="$(date +'%H')"


while [ $stat = "1" -a $HOUR -ge 22 -o $stat = "1" -a $HOUR -lt 07 ]
	do
	d=`date +%d%m%y`
	t=`date +%T`
	raspistill -vf -hf -ex night -o big$d$t.jpg
	raspistill -vf -hf -ex night -o 1.jpg -w 1024 -h 768 -q 30
	raspivid -vf -hf -ex night -o $d$t.h264 -t 50000
	convert -pointsize 20 -fill yellow -draw 'text 850,30 "'$t' '$d'"' 1.jpg $d$t.jpg
	mpack -s "PiNoIR alarm photo" /home/pi/$d$t.jpg you@gmail.com
	stat='0'
	rm 1.jpg
	done
done
exit 0
