#!/bin/bash
DATE=$(date +%d-%m-%Y)
BACKUP_DIR="/data-backup/web"

# To create a new directory into backup directory location.
#mkdir -p $BACKUP_DIR/$DATE

# take each website backup in separate name, use below format.
tar -zcvpf $BACKUP_DIR/fvsgroup-$DATE.tar.gz /data/www/fvsgroup

# Delete files older than 90 days
# find $BACKUP_DIR/* -mtime +90 -exec rm {} \;
