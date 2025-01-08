#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOGS_FOLDER="/var/log/shellscript"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]
  then
      echo -e " $2...$R.failure"
  exit 1
  else
      echo -e "$2....$G..success..."
      
      fi
}

# echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

# if [ $USERID -ne 0 ]
# then
#      echo "ERROR: you must have sudo access to execute this script"
#      exit 1
# fi

#  dnf list installed mysql &>>$LOG_FILE_NAME

#   if [ $? -ne 0 ]
#   then # not installed
#     dnf install mysql -y &>>$LOG_FILE_NAME
#     VALIDATE $? "installing mysql"
#    if [ $? -ne 0 ]
#   then
#       echo " installing mysql failure"
#   exit 1
#   else
#       echo "installing mysql success..."
      
#       fi
#   else
#       echo -e " mysql is already  $Y installed"
#    fi
# dnf list installed git &>>$LOG_FILE_NAME
#      if [ $? -ne 0 ]
#      then
#       dnf install git -y &>>$LOG_FILE_NAME
#       VALIDATE $? "installing git"
#       if [ $? -ne 0 ]
#       then
#          echo "installing git failure.."
#          exit 1
#    else
#       echo "installing git successs...."
   
#    fi
   
#    else
#       echo -e " git is already  $Y installed"
      
#   fi
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "ERROR:: You must have sudo access to execute this script"
        exit 1 #other than 0
    fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

CHECK_ROOT

for package in $@
do
    dnf list installed $package &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y ... INSTALLED $N"
    fi
done