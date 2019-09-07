#!/bin/sh
while true;  do 
	valid="457624" 
	scan=`./RFSniffer` 
		if [ "$scan" = "$valid" ]; then
			d=`date +%d%m%y` 
			t=`date +%T` 

	# start code for usb video grabber
	counter=6
	while [ $counter -gt 1 ] 
	do 

			d=`date +%d%m%y` 
			t=`date +%T` 
			fswebcam -d /dev/video0 -i 0 -r 720x576 $d$t.jpg 
			sleep 1 
			counter=$(( $counter - 1 )) 
			echo $counter 
		 
		done 
	ls -l *.jpg | awk '{if ($5 < 20000) print $9}' | tee -a deletelog | xargs rm 
	rm deletelog
	# end code for USB video grabber

			echo "Drive Alarm $t $d" | mail -s "Drive Alarm" you@gmail.com 
			echo "Drive Alarm $t $d" 
			echo "Drive Alarm $t" >> log$d.txt 
			p=`ls *.jpg -Art | tail -n 1`
			mpack -s "Drive Alarm photo" $p you@gmail.com 
			 
		else 
			echo "bad read your code and valid dont match" 
			echo $scan 
		fi 
	sleep 20 
done 
exit 0
