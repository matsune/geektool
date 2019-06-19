#!/bin/sh
uptime | awk '{print "UPTIME   : " $3 " " $4 " " $5 " " }'

TOP=$(top -l 1)

function print_percent_bar {
  local SYMBOL="◾︎"
  n=`echo $1 / 1 | bc`
  n=`echo $n / 10 | bc`
  i=0
  while [ $i -lt $n ]
  do
    echo "\033[1;36m$SYMBOL\033[0m\c"
    i=$((i + 1))
  done
  n=$((10 - n))
  i=0
  while [ $i -lt $n ]
  do
    echo "\033[1;37m$SYMBOL\033[0m\c"
    i=$((i + 1))
  done
}

cpu=`echo "$TOP" | awk '/CPU usage/ {print $3}' | sed s/%//`
echo "CPU Usage: \c"
print_percent_bar $cpu
echo " $cpu%"


usedMem=`echo "$TOP" | awk '/PhysMem/ {print $2}' | sed s/G//`
freeMem=`echo "$TOP" | awk '/PhysMem/ {print $6}' | sed s/G// `
totalMem=`expr $usedMem + $freeMem`
usedPer=`echo "$usedMem $totalMem" | awk '{print $1 / $2 * 100}'`
echo "Mem Usage: \c"
print_percent_bar $usedPer
echo " $usedPer%"

