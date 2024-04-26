#!/bin/bash

filepath="/home/ec2-user/logs"
files=$(find $filepath -name "*.java" -mtime +4)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ -d $filepath ]    # Checks that directory is exists or not.
then
    if [ ${#files[@]} -gt 0 ]
    then
        rm -rf $files
        echo -e "$G $files are deleted $N"
    else
        echo -e "$R $files are NOT available $N"
    fi

    if [ ${#files[@]} -eq 0 ]
    then
        echo -e "$R $files are deleted successfully $N"
    fi
else
    echo -e "$R $filepath directory is not found $N"
fi