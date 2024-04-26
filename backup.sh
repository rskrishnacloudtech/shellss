#!/bin/bash

zipfile="/home/ec2-user/logs.zip"
fromfolder="/home/ec2-user/logs/"
tofolder=/home/ec2-user/logs/
sudo zip -r $zipfile $fromfolder | mv $zipfile $tofolder