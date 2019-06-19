#!/bin/sh
cal_tail=`cal -h | tail -n 7`
today=$(date "+%e")
echo "${cal_tail/${today}/\033[30;47m${today}\033[0m}"
