#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo -e "$R error::.... $2 failed $N"
        exit 1
    else
        echo -e "$G $2 success $N "
    fi
}

ID=$(id -u)
if [ $ID -ne 0 ]
then 
    echo "please run the command with root user"
    exit 1
else    
    echo -e "$Y you are root user $N"
fi

yum install git -y &>> $LOGFILE

VALIDATE $? "installing git"
