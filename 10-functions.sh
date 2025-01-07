#!bin/bash
USERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
  then
      echo " $2....failure"
  exit 1
  else
      echo "$2......success..."
      
      fi
}
if [ $USERID -ne 0 ]
then
     echo "ERROR: you must have sudo access to execute this script"
     exit 1
fi

 dnf  list installed mysql

  if [ $? -ne 0 ]
  then # not installed
    dnf install mysql -y
    VALIDATE $? "installing mysql"
   if [ $? -ne 0 ]
  then
      echo " installing mysql failure"
  exit 1
  else
      echo "installing mysql success..."
      
      fi
  else
      echo " mysql is already installed"
   fi
dnf  list installed git
     if [ $? -ne 0 ]
     then
      dnf install git -y
      VALIDATE $? "installing git"
      if [ $? -ne 0 ]
      then
         echo "installing git failure.."
         exit 1
   else
      echo "installing git successs...."
   
   fi
   
   else
      echo " git is already installed"
      
  fi
