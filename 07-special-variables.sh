#!bin/bash

echo "all variables passed: $@"
echo "number of variables:  $#"
echo "script name: $0"
echo "present working directory: $pwd"
echo "home directory of current user: $home"
echo "which user is running script: $user"
echo "process id of current  script: $$"
sleep 60 &
echo "process id of last command in background : $!"
