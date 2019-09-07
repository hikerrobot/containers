
#!/bin/sh

echo "18" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio18/direction

counter=1
	while [ $counter -le 10 ];
	do
		echo "1" > /sys/class/gpio/gpio18/value
		sleep .2
		echo "0" > /sys/class/gpio/gpio18/value
		sleep .2
		counter=$(( counter+1 ))
	done

echo "18" > /sys/class/gpio/unexport
