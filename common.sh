#!/bin/bash

# Get the current logged in user.
USER=$(whoami)

# Get the user id of the logged in user.
USERID=$(id -u)

# Create a log file name format.
TIMESTAMP=$(date +%F-%H-%M-%S)
FILENAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$FILENAME.log
echo "Please enter the DB password.. "          # ExpenseApp@1 is the password. 
read -s mySQLPassword
#mySQLPassword=ExpenseApp@1
DBServerIP=172.31.18.209

# Creating a color codes.
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

# Function created to perform a validation on the result of the command execution.
source ./mysql.sh
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R FAILED $N"
        exit 1
    else
        echo -e "$2 is $G SUCCESS $N"
    fi
}

# Checking that uer is sudo user or not.
check_user(){
    if [ $USERID -ne 0 ]
    then
        echo -e "This current user $B '$USER' $N is not a sudo user. Please get the sudo access first or login with sudo user before installing packages."
        exit 1
    else
        echo -e "This current user $B '$USER' $N has the sudo access. You can proceed to install the packages."
    fi
}