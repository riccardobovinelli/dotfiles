#!/bin/sh 

pid=$(pidof i3lock)
kill $pid
i3lock -c ff0000
