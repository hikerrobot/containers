#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

lloytron="7778920"
cheapas_doorbell="-2086369837"
cd $SCRIPTPATH
while true;  do
	scan=`./RPi_utils/RFSniffer`

	if [ "$scan" = "$lloytron" ]; then
		timenow=`date`
		echo $timenow "Good Read - lloytron"
		curl -s \
		  --form-string "token=aastho4zszvsn1aki7968w7kaj8zdq" \
		  --form-string "user=u7sw6hd7cabawudzqf5347ssq4d2x4" \
		  --form-string "message=somebody's at the door!" \
		  https://api.pushover.net/1/messages.json
	else
		echo "BAD READ:  discovered code = " $scan
	fi
	sleep 5
done
