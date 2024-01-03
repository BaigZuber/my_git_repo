#!/bin/bash

ALERT=75
USAGE=`df -h | grep rootfs | tr -d % | awk '{ print $5 }'` 

if [[ $USAGE -gt $ALERT ]]
then
    echo -e "disk usage is above threshold.."
else
    echo -e "disk usage is under threshold and fine..!"
fi
