#!/bin/bash

zcat -f /usr/local/WowzaStreamingEngine/logs/_defaultVHost_/anuwat/*stats* | grep "destroy" | goaccess --log-format "%^\t%^\t%^\t%d\t%t\t%^\t%h\t%^\t%b\t%b\t%^\t%r\t%~" --date-format '%Y-%m-%d' --time-format '%H:%M:%S' -a -o /data/www/reports/anuwat_gjqpgoz.html
zcat -f /usr/local/WowzaStreamingEngine/logs/_defaultVHost_/pactrims2016/*stats* | grep "destroy" | goaccess --log-format "%^\t%^\t%^\t%d\t%t\t%^\t%h\t%^\t%b\t%b\t%^\t%r\t%~" --date-format '%Y-%m-%d' --time-format '%H:%M:%S' -a -o /data/www/reports/pactrims2016_all_yuhjq67llpz.html
zcat -f `find /usr/local/WowzaStreamingEngine/logs/_defaultVHost_/pactrims2016/ -name "*stats*" -mtime -35` | grep "destroy" | goaccess --log-format "%^\t%^\t%^\t%d\t%t\t%^\t%h\t%^\t%b\t%b\t%^\t%r\t%~" --date-format '%Y-%m-%d' --time-format '%H:%M:%S' -a -o /data/www/reports/pactrims2016_yuhjq67llpz.html
