#!/bin/bash

./common.sh

check_user

# Installing the mysql-server package.
dnf install mysql-server -y &>> $LOGFILE
VALIDATE $? "Installing MySQL Server"

# Enabling the MySQL Server service.
systemctl enable mysqld &>> $LOGFILE
VALIDATE $? "Enabling mysql service"

# Starting the mysql service
systemctl start mysqld &>> $LOGFILE
VALIDATE $? "Starting the mysql service"

# Setting the password to the root user of mysql server. If the password is already set it will set again. So we need to check its first and 
# then we have to set the password if its not set already.
mysql -h $DBServerIP -uroot -p$mySQLPassword -e "show databases;" &>> $LOGFILE
if [ $? -eq 0 ]
then
    echo -e "MySQL root password is already set. $Y SKIPPING $N"
else
    mysql_secure_installation --set-root-pass $mySQLPassword &>> $LOGFILE
    VALIDATE $? "Setting the password for root user in MySQL server"
fi