#!/bin/sh

lloytron="7778920"
cheapas="-2086369837"
while true;  do
	scan=`./RFSniffer`
	echo $scan
		if [ "$scan" = "$lloytron" ]; then
			echo "Good Read - lloytron"
			echo "Your code is " $scan
			./buzzer.sh &
			curl -s \
			  --form-string "token=aastho4zszvsn1aki7968w7kaj8zdq" \
			  --form-string "user=u7sw6hd7cabawudzqf5347ssq4d2x4" \
			  --form-string "message=somebody's at the door!" \
			  https://api.pushover.net/1/messages.json
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
curl -s \
  --form-string "token=aastho4zszvsn1aki7968w7kaj8zdq" \
  --form-string "user=u7sw6hd7cabawudzqf5347ssq4d2x4" \
  --form-string "message=rexy is at the door" \
  https://api.pushover.net/1/messages.json
