#!/bin/bash
#echo 'Script is initiated for your Inactive mode'
#echo '========'
#echo "$1" "$2" "$3"
#echo '========'
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

readarray InactivityArray < inactivity.txt
LenInactiveArray=${#InactivityArray[@]}
BatteryOut=${InactivityArray[$LenInactiveArray-1]}
TimeOut=${InactivityArray[$LenInactiveArray-2]}
TimeOutMilli=$((($TimeOut)*6000))
echo "$TimeOutMilli"
ModeOut=${InactivityArray[$LenInactiveArray-3]}

#Countdown timer, which can be used to give advance alaram, prior to  when certan operation is going to happen.
countdown()
(
  IFS=:
  set -- $*
  secs=$(( ${1#0} * 3600 + ${2#0} * 60 + ${3#0} ))
  while [ $secs -gt 0 ]
  do
    sleep 1 &
    printf "\r%02d:%02d:%02d" $((secs/3600)) $(( (secs/60)%60)) $((secs%60))
    secs=$(( $secs - 1 ))
    wait
  done
  echo
)

if [[ $BatteryArrayPerNum -le $BatteryOut ]]; then
 case "$ModeOut" in
  haltmode )
   echo 'Your system will halt in'
   countdown "00:00:30" # 30 sec 
   bash -c "sudo systemctl halt"
   ;;
  poweroffmoode )
   echo 'Your system will poweroff in'
   countdown "00:00:30" # 30 sec;
   bash -c " sudo systemctl poweroff"
   ;;
  rebootmode )
   echo 'Your system will reboot in'
   countdown "00:00:30" # 30 sec
   bash -c "sudo systemctl reboot "
   ;;
  suspendmode )
   echo 'Your system will suspend in'
   countdown "00:00:30" ; # 30 sec
   bash -c "sudo systemctl suspendmode"
   ;;
  hibernatemode )
   echo 'Your system will hybernate in' 
   countdown "00:00:30" ; # 30 sec 
   bash -c "sudo systemctl hibernate"
   ;;
  hybrid-sleepmode )
   echo 'Your system will hybrid-sleepmode in' 
   countdown "00:00:30" ; # 30 sec
   bash -c "sudo systemctl hybrid-sleep"
   ;;
  *) echo 'Mode:' "$ModeOut" ' - is not a correct option'
   ;;
 esac
elif [[ $IdleTimeMillsec -gt $TimeOutMilli ]]; then
 case "$ModeOut" in
  haltmode )
   echo 'Your system will halt in' 
   countdown "00:00:30" # 30 sec 
   bash -c "sudo systemctl halt"
   ;;
  poweroffmoode )
   echo 'Your system will poweroff in' 
   countdown "00:00:30" # 30 sec
   bash -c " sudo systemctl poweroff"
   ;;
  rebootmode )
   echo 'Your system will reboot in' 
   countdown "00:00:30" # 30 sec
   bash -c "sudo systemctl reboot "
   ;;
  suspendmode )
   echo 'Your system will suspend in' 
   countdown "00:00:30" # 30 sec
   bash -c "sudo systemctl suspendmode"
   ;;
  hibernatemode )
   echo 'Your system will hybernate in'
   countdown "00:00:30" # 30 sec
   bash -c "sudo systemctl hibernate"
   ;;
  hybrid-sleepmode )
   echo 'Your system will hybrid-sleepmode in'
   countdown "00:00:30" # 30 sec
   bash -c "sudo systemctl hybrid-sleep"
   ;;
  *) echo 'Mode:' "$ModeOut" ' - is not a correct option'
   ;;
 esac
else
 ./inactivitymode.sh
fi
