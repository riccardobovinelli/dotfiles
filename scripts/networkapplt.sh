#!/bin/bash

pid=$(pidof nm-applet)
if [ -z "$pid" ]
then
	nm-applet
else
	kill $(pidof nm-applet)
fi
