#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

doorbell_code="7778920"
cd $SCRIPTPATH
while true;  do
	scan=`./RFSniffer`

	if [ "$scan" = "$doorbell_code" ]; then
		timenow=`date`
		echo $timenow "Good Read - $doorbell_code"
	else
		echo "BAD READ:  discovered code = " $scan
	fi
	sleep 5
done
