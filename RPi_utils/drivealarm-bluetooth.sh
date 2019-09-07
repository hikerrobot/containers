#!/bin/sh
while true;  do 
	valid="457624" 
	scan=`./RFSniffer` 
		if [ "$scan" = "$valid" ]; then 

			x=`hcitool scan --flush`
			y=${x#*Scanning *...}
			d=`date +%d%m%y`
			t=`date +%T`


		echo $d,$t,$y | tr " " "\n"
		echo "-------------------"
		echo $d,$t$y | tr " " "," >> aa$d.txt
		y=''
	else 
			echo "bad read your code and valid dont match" 
			echo $scan 
	fi 
	sleep 20 
done
exit 0
