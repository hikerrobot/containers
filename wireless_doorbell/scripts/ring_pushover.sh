while true;  do
	scan=`/app/433Utils/RPi_utils/RFSniffer`

	timenow=`date`
	if [ "$scan" = "$DOORBELL_CODE" ]; then
		echo $timenow " - Good Read :-)"
		curl -s \
		  --form-string "token=$PUSHOVER_TOKEN" \
		  --form-string "user=$PUSHOVER_UID" \
		  --form-string "message=$PUSHOVER_MSG" \
		  https://api.pushover.net/1/messages.json
	else
		echo $timenow " - BAD READ:  discovered code = " $scan
	fi
	sleep 2
done
