#!/bin/bash
#Gorla Praveen <gorlapraveen@gmail.com>
#This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published bythe Free Software Foundation, either version 3 of the License, or any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.


usage()
{
echo '--------------------------------------------------------------------------------------------'
echo 'Supported System Action (mode) : haltmode, poweroffmode, rebootmode, suspendmode, hibernatemode, hybrid-sleepmode'
echo ' '
echo 'Suppoted System Action in (time) in minutes : numerical' 
echo ' '
echo 'Supported System Action in (Battery) Level : 1 to 100 values'
echo ''
echo 'Example usage: suspendmode 60 30  # System "suspends" after 60 minutes or when below 30 % of battery level, or which ever comes earlier when Keyboard/mouse is inactivite.'
echo '-------------------------------------------------------------------------------------------'

}

#usage

mode=$1
time_period=$2
Battery_level=$3
echo "$mode" "$time_period" "$Battery_level"
#1 minute = 6000 Milliseconds
#]sleepmode=sleepmode
#hibernatemode=hibernatemode
#suspendmode=suspendmode
#shutdown=shutdownmode
#restartmode=restartmode
#echo $restartmode $sleepmode

if [[ ! $time_period =~ ^[[:digit:]]+$ ]]; then
 echo Hey $USER, "$2" is not an Integer value, please input only an integer value
 usage

#elif [[ "$mode" != 'sleepmode' ]] || [[ "$mode" != 'hibernatemode' ]] || [[ "$mode" != 'suspendmode' ]] || [[ "$mode" != '$shutdownmode' ]] || [[ "$mode" != '$restartmode' ]]; then 
#echo Hey $USER, please use appropriate mode
 #usage
elif [[ ! $Battery_level =~ ^[[:digit:]]+$ ]]; then
 echo $USER, "$3" is not an Integer value, please input only an integer value
 usage
else
 case "$1" in
  haltmode )
   echo > inactivity.txt
   echo $1 >inactivity.txt
   echo $2 >>inactivity.txt
   echo $3 >>inactivity.txt
   bash inactivitymode.sh 
   ;;
  poweroffmoode )
   echo > inactivity.txt
   echo $1 >inactivity.txt
   echo $2 >>inactivity.txt
   echo $3 >>inactivity.txt
   bash inactivitymode.sh
   ;;
  rebootmode )
   echo > inactivity.txt
   echo $1 >inactivity.txt
   echo $2 >>inactivity.txt
   echo $3 >>inactivity.txt
   bash inactivitymode.sh
   ;;
  suspendmode )
   echo > inactivity.txt
   echo $1 >inactivity.txt
   echo $2 >>inactivity.txt
   echo $3 >>inactivity.txt
   bash inactivitymode.sh $1 $2 $3
   ;;
  hibernatemode )
   echo > inactivity.txt
   echo $1 >inactivity.txt
   echo $2 >>inactivity.txt
   echo $3 >>inactivity.txt
   bash inactivitymode.sh $1 $2 $3
   ;;
  hybrid-sleepmode )
   echo > inactivity.txt
   echo $1 >inactivity.txt
   echo $2 >>inactivity.txt
   echo $3 >>inactivity.txt
   bash inactivitymode.sh $1 $2 $3
   ;;
  *) echo 'Mode:' "$1" ' - is not a correct option'
     usage
   ;;
 esac
fi
    



