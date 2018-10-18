#!/bin/bash

usage()
{
echo 'Supported System Action (mode) : sleepmode, suspend, hibernate, shutdown. restart'
echo ' '
echo 'Suppoted System Action in (time) in minutes : numerical' 
echo ' '
echo 'Supported System Action in (Battery) Level : 1 to 100 values'
echo ''
echo 'Example Usage: sleep 60 30  # System "sleeps" after 60 minutes or when below 30 % of battery level, or which ever comes earlier when Keyboard/mouse is inactivite'

}

#usage

mode=$1
time_period=$2
Battery_level=$3
echo "$mode" "$time_period" "$Battery_level"
#1 minute = 1000 Milliseconds
#]sleepmode=sleepmode
#hibernatemode=hibernatemode
#suspendmode=suspendmode
#shutdown=shutdownmode
#restartmode=restartmode
#echo $restartmode $sleepmode

if [[ ! $time_period =~ ^[[:digit:]]+$ ]]; then
 echo Hey $USER, please input only an integer value
 usage

#elif [[ "$mode" != 'sleepmode' ]] || [[ "$mode" != 'hibernatemode' ]] || [[ "$mode" != 'suspendmode' ]] || [[ "$mode" != '$shutdownmode' ]] || [[ "$mode" != '$restartmode' ]]; then 
#echo Hey $USER, please use appropriate mode
 #usage
elif [[ ! $Battery_level =~ ^[[:digit:]]+$ ]]; then
 echo $USER, please input an integer
 usage
else
 case "$1" in
  sleepmode )
   bash inactivitymode.sh $1 $2 
   ;;
  hibernatemode )
   bash inactivitymode.sh $1 $2 
   ;;
  suspendmode )
   bash inactivitymode.sh $1 $2 
   ;;
  shutdownmode )
   bash inactivitymode.sh $1 $2 
   ;;
  restartmode )
   bash inactivitymode.sh $1 $2 
   ;;
  *) echo 'Mode:' "$1" ' - is not a correct option'
     usage
   ;;
 esac
fi
    



