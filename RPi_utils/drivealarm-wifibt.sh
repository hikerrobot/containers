#!/bin/sh

while true;  do 
	valid="457624" 
	scan=`./RFSniffer` 
		if [ "$scan" = "$valid" ]; then 

			x=`hcitool scan --flush` 
			y=${x#*Scanning *...} 
			tshark -i mon0 subtype probereq -n -a duration:60 > cap.log 
			egrep -o "[a-z0-9]{2}:[a-z0-9]{2}:[a-z0-9]{2}:[a-z0-9]{2}:[a-z0-9]{2}:[a-z0-9]{2}" cap.log > cap2.txt 
			sed '/ff:ff:ff:ff:ff:ff/d' cap2.txt > cap3.txt 
			sort -u -o cap4.txt cap3.txt 
			z=`cat cap4.txt` 
			d=`date +%d%m%y` 
			t=`date +%T` 


		echo $d,$t,$y,$z | tr " " "\n" 
		echo "-------------------" 
		echo $d,$t,$y,$z | tr " " "," >> aa$d.txt 
		echo -e "Subject: Driveway Alert\r\n\r\n ALERT $t,$y,$z" |msmtp -from=default -t you@youremailaddress.com 

		y='' 
		z='' 
		stat='0' 
	else 
			echo "bad read your code and valid dont match" 
			echo $scan 
		fi 
	sleep 20 
done 
exit 0
