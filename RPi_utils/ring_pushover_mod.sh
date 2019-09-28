#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

lloytron="7778920"
cheapas="-2086369837"
cd $SCRIPTPATH
while true;  do
	scan=`./RFSniffer`

	if [ "$scan" = "$lloytron" ]; then
		timenow=`date`
		echo $timenow "Good Read - lloytron"
	else
		echo "BAD READ:  discovered code = " $scan
	fi
	sleep 5
done
