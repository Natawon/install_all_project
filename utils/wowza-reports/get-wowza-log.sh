#!/bin/bash

sshpass -p 'vrthebest' rsync -ahe -zz --compress-level=9 -v --progress --stats --delete --include='*/' --include='*stats*' --exclude='*' -e "ssh -p 22" root@th-live-11.open-cdn.com:/usr/local/WowzaStreamingEngine/logs/_defaultVHost_/ /raid/wowza-log/th-live-11
#sshpass -p 'vrthebest' rsync -ahe -zz --compress-level=9 -v --progress --stats --delete --include='*/' --include='*stats*' --exclude='*' -e "ssh -p 22" root@th-live-13.open-cdn.com:/usr/local/WowzaStreamingEngine/logs/_defaultVHost_/ /raid/wowza-log/th-live-13
#sshpass -p 'vrthebest' rsync -ahe -v --progress --stats --delete --include='*/' --include='*stats*' --exclude='*' -e "ssh -p 22" root@sg-live-11.open-cdn.com:/usr/local/WowzaStreamingEngine/logs/_defaultVHost_/ /raid/wowza-log/sg-live-11
