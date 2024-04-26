#!/bin/bash

filepath="/home/ec2-user/logs"
files=$(find $filepath -name "*.java" -mtime +4)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ -d $filepath ]    # Checks that directory is exists or not.
then
    if [ -d $filepath/$files ]
    then
        rm -rf $files
        echo -e "$G $files are deleted successfully $N"
    else
        echo -e "$R $files are NOT available $N"
    fi

    if [ ! -d $filepath/$files ]
    then
        echo "$files are deleted successfully"
    fi
else
    echo -e "$R $filepath directory is not found $N"
fi