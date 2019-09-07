
#!/bin/sh

echo "18" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio18/direction

counter=1
delay=1
	while [ $counter -le 10 ];
	do
		echo "1" > /sys/class/gpio/gpio18/value
		sleep 0.$delay
		echo "0" > /sys/class/gpio/gpio18/value
		sleep 0.$delay
		counter=$(( counter+1 ))
		delay=$(( delay+1 ))
	done

echo "18" > /sys/class/gpio/unexport
