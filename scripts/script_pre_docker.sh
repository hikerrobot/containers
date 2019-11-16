#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

doorbell_code="your code here"
cd $SCRIPTPATH
while true;  do
	# TODO modify the path as appropriate
	scan=`./RFSniffer`

	timenow=`date`
	if [ "$scan" = "$doorbell_code" ]; then
		echo $timenow "Good Read :-)"
	else
		echo $timenow "BAD READ:  discovered code = " $scan
	fi
	sleep 5
done
