#!/bin/bash

NOW=$(date +"%m-%d-%Y")
echo "apps name: $1"
#echo "Current date: $NOW"
echo "Filter by date: $2"

find /raid/wowza-log/ -name "$1*stat*" -exec sed -n "/$2/,$ p" {} \; | grep "destroy" | goaccess --log-format "%^\t%^\t%^\t%d\t%t\t%^\t%h\t%^\t%b\t%^\t%r\t%~" --date-format '%Y-%m-%d' --time-format '%H:%M:%S' -a -o /data/www/reports/$1_$2_$3.html -o /data/www/reports/$1_$2_$3.json -o /data/www/reports/$1_$2_$3.csv

#TEST
# cat /raid/wowza-log/th-live-13/ondemand/ondemand_wowzastreamingengine_stats.log | grep "destroy" | goaccess --log-format "%^\t%^\t%^\t%d\t%t\t%^\t%h\t%^\t%b\t%b\t%^\t%r\t%~" --date-format '%Y-%m-%d' --time-format '%H:%M:%S'