#!/bin/sh

lloytron="7778920"
cheapas="-2086369837"
while true;  do
	scan=`./RFSniffer`
		if [ "$scan" = "$lloytron" ]; then
			echo "Good Read - lloytron"
			echo "Your code is " $scan
			./buzzer.sh &
		elif [ "$scan" = "$cheapas" ]; then
			echo "Good Read - cheapas"
			echo "Your code is " $scan
			./buzzer.sh &
		else
			echo "BAD READ:  your code and the valid don't match"
			echo "Your correct valid code should be " $scan
			fi
	sleep 5
done
exit
