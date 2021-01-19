#!/bin/bash
i=1
let active=0
while [ $i -eq 1 ]
do
    a=$(lsusb | grep -i huion)
    echo $a
    if [ -z $a ]
    then
        active=0
        echo "device disconnected"
        sleep 5
    else
        if (( $active == 0 )); 
        then
            xsetwacom --set "HUION Huion Tablet Pad pad" Button 1 "key +ctrl +z -z -ctrl"
            xsetwacom --set "HUION Huion Tablet Pad pad" Button 2 "key +shift +ctrl +e"
            xsetwacom --set "HUION Huion Tablet Pad pad" Button 3 "key +shift +ctrl +p"
            xsetwacom --set "HUION Huion Tablet Pad pad" Button 8 "key +ctrl +"
            xsetwacom --set "HUION Huion Tablet Pad pad" Button 9 "key +ctrl -"
            xsetwacom --set "HUION Huion Tablet Pad pad" Button 10 "key +ctrl +d"
            xsetwacom --set "HUION Huion Tablet Pad pad" Button 11 "key +ctrl +y"
            xsetwacom --set "HUION Huion Tablet Pad pad" Button 12 "key +shift +ctrl +a"
            #xsetwacom --set "HUION Huion Tablet stylus" button 2 "key +ctrl +z"
            xsetwacom --set "HUION Huion Tablet stylus" button 3 "pan"
            xsetwacom --set "HUION Huion Tablet stylus" "PanScrollThreshold" 450
            active=1
            #echo "value of active: $active"
            echo "button set"
            sleep 5
        else
            echo "Device still connected"
            sleep 5
        fi
    fi
done
