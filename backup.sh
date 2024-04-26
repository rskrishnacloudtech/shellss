#!/bin/bash

timstamp=$(date +%F-%H-%M-%S)
zipfile=/home/ec2-user/backup-$timstamp.zip
#fromfolder="/home/ec2-user/logs/"
#tofolder=/home/ec2-user/logs/
#zip -r $zipfile $fromfolder | mv $zipfile $tofolder

zip zipfile fromdir/zipfoder | mv zipfile todir/