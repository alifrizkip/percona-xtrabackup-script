#!/bin/bash

###Test daily weekly or monthly###
MONTH=`date +%d`
DAYWEEK=`date +%u`

if [ $MONTH -eq 1 ];
        then
        FN='monthly'
elif [ $DAYWEEK -eq 7 ]
        then
        FN='weekly'
elif [ $DAYWEEK -lt 7 ]
        then
        FN='daily'
fi

###VAR VAR VAR###
USER=backup
PASS=backup

DATE=$FN-xtrabackup-`date +"%Y%m%d-%H%M"`
DIR=/root/backup
DST=$DIR/$DATE

###Backup Execution###
cd $DIR

mkdir -p $DST

innobackupex --user=$USER --password=$PASS --no-timestamp $DST

XZ_OPT=-9 tar -Jcvf $DATE.tar.xz $DATE

rm -Rf $DST

###File Rotation###
ls -t | grep daily | sed -e '1,3d' | xargs -d '\n' rm -R > /dev/null 2>&1
ls -t | grep weekly | sed -e '1,3d' | xargs -d '\n' rm -R > /dev/null 2>&1
ls -t | grep monthly | sed -e '1,3d' | xargs -d '\n' rm -R > /dev/null 2>&1
