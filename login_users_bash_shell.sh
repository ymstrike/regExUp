#!/bin/bash
#Name   :Yuval Matityahu
#Purpose:Show the users that login with bash shell as a default
#        by scanning /etc/passwd the last fiels
#Version 1.0
#Date : 18/12/2017



#This funcitscan and list all users that have bash shell as a default 
#in /etc/passwd

scan_users_bash_shell()
{

printf "\n"
printf "List of Users with login bash shell as a default:\n"
printf "=================================================\n"
for name in  $(cat /etc/passwd |cut -d ":" -f1,7) # first word username in /etc/passwd
do

shell_bash=$(echo $name |cut -d ":" -f2)
if [ $shell_bash = "/bin/bash" ];then
printf "$name\n"
fi
done
}

scan_users_bash_shell     # call to function

