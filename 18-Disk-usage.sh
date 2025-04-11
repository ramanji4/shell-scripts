#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5


while IFS= read -r line
do
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    DISK_PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$DISK_PARTITION is more than $DISK_THRESHOLD, Current value: $USAGE. Please check"
    fi
done <<< $DISK_USAGE