#!/bin/sh

while true;  do
	valid="457624"
	scan=`./RFSniffer`
		if [ "$scan" = "$valid" ]; then
			echo "Good Read"
			echo "Your code is " $scan
			./buzzer.sh &
		else
			echo "BAD READ:  your code and the valid don't match"
			echo "Your correct valid code should be " $scan
			fi
	sleep 5
done
exit
