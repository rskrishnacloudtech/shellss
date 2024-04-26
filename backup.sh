#!/bin/bash

timstamp=$(date +%F-%H-%M-%S)
zipfile="backup-$timstamp.zip"
#fromfolder="/home/ec2-user/logs/"
#tofolder=/home/ec2-user/logs/
#zip -r $zipfile $fromfolder | mv $zipfile $tofolder

#zip fromdir/backup-date.zip fromdir/zipfoder | mv fromdir/backup-date.zip todir/
zip $zipfile ~/fromdir/zipfoder | mv $zipfile ~/todir/
#zip zipfile.zip ~/fromdir/zipfoder | mv zipfile.zip ~/todir/