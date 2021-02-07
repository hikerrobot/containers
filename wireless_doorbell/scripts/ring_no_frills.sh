while true;  do
	scan=`/app/433Utils/RPi_utils/RFSniffer`

	timenow=`date`
	if [ "$scan" = "$DOORBELL_CODE" ]; then
		echo $timenow " - Good Read :-)"
	else
		echo $timenow " - BAD READ:  discovered code = " $scan
	fi
	sleep 2
done
