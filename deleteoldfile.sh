#!/bin/bash

filepath="/home/ec2-user/logs"
files=$(find $filepath -name "*.log" -mtime +4)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ -d $filepath ]    # Checks that directory is exists or not.
then
    rm -rf $files
    echo -e "$G $files are deleted successfully $N"
else
    echo -e "$R $Files are not deleted $N"
fi