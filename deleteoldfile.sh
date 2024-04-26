#!/bin/bash

filepath="/home/ec2-user/logs"
files=$(find $filepath -name "*.js" -mtime +4)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ -d $filepath/$files ]    # Checks that directory is exists or not.
then
    rm -rf $files
    echo -e "$G $files are deleted successfully $N"
    if [ ! -d $filepath/$files ]
    then
        echo "$files are deleted successfully"
    fi
else
    echo -e "$R $filepath directory is not found $N"
fi