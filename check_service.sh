#!/bin/bash

read -p "which service you want to check:- " SERVICE
STATUS=service $SERVICE status | grep Active | awk '{print $2}'

if [[ $STATUS == active ]]
then
    echo -e "Service is Active"
else
    echo "Service is not installed"
    
    read -p "Do you want to start this service (yes/no) :- " CHOICE

    if [[ $CHOICE == yes ]]
    then
    apt install $SERVICE -y
        echo -e "Service installed successfully...!!"
    service $SERVICE restart
        echo -e "$SERVICE service is started..!"
    else
        echo -e "Thanks...!!"
    fi
fi
