#!/bin/bash

filepath="/home/ec2-user/logs"
files=($(find $filepath -name "*.html" -mtime +4))
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ -d $filepath ]    # Checks that directory is exists or not.
then
    echo -e "$G $filepath directory exists $N"
else
    echo -e "$R $filepath director is not available $N"
    exit 1
fi

while IFS= read -r line
do
    echo "Deleting files: $line"
    rm -rf $line
done <<< $files