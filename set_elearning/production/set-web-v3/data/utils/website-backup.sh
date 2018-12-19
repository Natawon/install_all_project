#!/bin/bash
DATE=$(date +%d-%m-%Y)
TIME=$(date +%Hh%Mm)

BACKUP_DIR="/data-backup/web"

# To create a new directory into backup directory location.
#mkdir -p $BACKUP_DIR/$DATE

# take each website backup in separate name, use below format.
#tar -zcvpf $BACKUP_DIR/elearning.set.or.th_$DATE-$TIME.tar.gz /data/www/elearning.set.or.th
#tar -zcvpf $BACKUP_DIR/web1_$DATE-$TIME.tar.gz /data/www/website1

tar -zcvpf $BACKUP_DIR/www_$DATE-$TIME.tar.gz /data/www


# Delete files older than 90 days
# find $BACKUP_DIR/* -mtime +90 -exec rm {} \;

