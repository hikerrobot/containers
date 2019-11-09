#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

cd $SCRIPTPATH
while true;  do
	scan=`./RPi_utils/RFSniffer`

	if [ "$scan" = "$DOORBELL_CODE" ]; then
		timenow=`date`
		echo $timenow " - Good Read :-)"
		curl -s \
		  --form-string "token=$PUSHOVER_TOKEN" \
		  --form-string "user=$PUSHOVER_UID" \
		  --form-string "message=$PUSHOVER_MSG" \
		  https://api.pushover.net/1/messages.json
	else
		echo $timenow " - BAD READ:  discovered code = " $scan
	fi
	sleep 5
done
