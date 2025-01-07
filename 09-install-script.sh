#!bin/bash
USERID=$(id -u)

if [$USERID ne 0]
then
     echo "ERROR: you must have sudo access to execute this script"

else

if [$USERID eq 0]
then 
    echo "you can continue"
    fi