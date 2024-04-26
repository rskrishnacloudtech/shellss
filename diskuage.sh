#!/bin/bash

diskudage=$(df -hT | grep xfs)
dishthreshold=6

while IFS= read -r line
do
    usage=$(echo $line | awk -d " " '{print $6F}' | cut -d "%" -f1)
    folder=$(echo $line | awk -d " " '{print $NF}')
    if [ $usage -ge $dishthreshold ]
    then
        echo "$folder is using more than $dishthreshold. Current memory is $usage"
    fi
done <<< $diskudage