#!/bin/bash
notify-send " Time:$(date | cut -d ',' -f2) " \
    " Battery:$(acpi | cut -d ',' -f2) " -t 4000
