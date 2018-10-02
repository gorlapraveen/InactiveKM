#!/bin/bash
echo 'Script is initiated for your Inactive mode'
IdleTimeMillsec=$(xprintidle)
echo 'Idle for '"$IdleTimeMillsec"
BatteryStatus=$(acpi)
echo 'Battery Status '"$BatteryStatus"
BatteryArray=($BatteryStatus)
#echo ${BatteryArray[3]}
BatteryArrayPer=$(echo ${BatteryArray[3]})
#echo "$BatteryArrayPer"
BatteryArrayPerLen=${#BatteryArrayPer}
#echo "$BatteryArrayPerLen"
if [ $BatteryArrayPerLen -eq 5 ]; then
 BatteryArrayPerNum=${BatteryArrayPer:0:3}
elif [ $BatteryArrayPerLen -eq 4 ]; then
   BatteryArrayPerNum=${BatteryArrayPer:0:2}
elif [ $BatteryArrayPerLen -eq 3 ]; then
   BatteryArrayPerNum=${BatteryArrayPer:0:1}
elif [ $BatteryArrayPerLen -lt 2 ]; then
   echo "Unknown Battery Percentage"
fi
echo "$BatteryArrayPerNum"

