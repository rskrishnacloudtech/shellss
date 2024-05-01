#!/bin/bash

timstamp=$(date +%F-%H-%M-%S)
zipfile="backup-$timstamp.zip"
fromfolder="/home/ec2-user/logs/"
tofolder=/home/ec2-user/logs/
#zip -r $zipfile $fromfolder | mv $zipfile $tofolder

#zip fromdir/backup-date.zip fromdir/zipfoder | mv fromdir/backup-date.zip todir/
zip $tofolder/$zipfile $fromfolder/zipfoder
#zip zipfile.zip ~/fromdir/zipfoder | mv zipfile.zip ~/todir/