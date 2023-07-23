#!/bin/bash

gpu_temp="$(vcgencmd measure_temp | grep -o -E '[[:digit:]].*')"
cpu_temp=$(</sys/class/thermal/thermal_zone0/temp)
text="$(date) @ $(hostname)\n-------------------------------------------\nGPU => $gpu_temp\nCPU => $((cpu_temp/1000))'C\n\n"

echo -e $text
echo -e $text >> temp_logs.txt