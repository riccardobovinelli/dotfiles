#!/bin/bash

bright=$(xrandr --verbose --current | grep eDP-1 -A5 | tail -n1)
bright="${bright##* }"
Left=${bright%%"."*} 
Right=${bright#*"."}
if [ $1 == 1 ]
then
	if [ $Left != 1 ]
	then
		bright=$(( $Right + 10 ))
		bright=0.$bright
		if [ $bright == 0.100 ]
		then
			bright=1
		fi
	fi
else
	if [ $Left == 1 ]
	then
		bright=0.9
	else
		if [ $Right != 0 ]
		then
			bright=$(( $Right - 10 ))
			bright=0.$bright
		fi
	fi
fi

xrandr --output eDP-1 --brightness $bright

echo Brightness: $bright
