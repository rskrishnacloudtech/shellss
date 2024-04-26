#!/bin/bash

diskudage=$(df -hT | grep xfs)
dishthreshold=6
message=""

while IFS= read -r line
do
    usage=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 )
    folder=$(echo $line | awk -F " " '{print $NF}')
    if [ $usage -ge $dishthreshold ]
    then
        message+="$folder is using more than $dishthreshold. Current memory is $usage"
    fi
done <<< $diskudage

echo "DIsk usage: $message" | mail -s "Disk Usage alert" toamil@gmail.com