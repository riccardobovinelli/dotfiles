#!/bin/bash

# From: https://forums.linuxmint.com/viewtopic.php?f=90&t=217741
# Credits to user BlackVeils

# Steps:
# 1. Save this script to battery_notify.sh
# 2. Edit the 'alarm' variable to point to your sound file of choice
# 3. Give execution permission: chmod +x battery_notify.sh
# 4. Run the script to test it. If happy, add to your startup applications.

# Notify when below this percentage
warning_level=10

# How often to check battery status, in minutes
check_interval=2

while true; do
  battery_level=$(acpi -b \
    | cut -d, -f2 | cut --characters=2,3,4 \
    | sed 's/%//g')
  charging=$(acpi -b | grep -c "Charging")

  # When battery is low, and not already charging
  if [ $battery_level -lt $warning_level ] &&
     [ $charging -eq 0 ]
  then
    notify-send " Low battery: ${battery_level}% " \
      " Plug into AC power " -t 8000
  fi

  sleep ${check_interval}m
done
