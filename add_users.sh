#!/bin/bash
#Name   :Yuval Matityahu
#Purpose:Add users to system givven as list parametrs 
#        if username or nickname exist print grandioues msg that username or nickname exist
#        if username or nickname not exist add to system 
#        and print grandioues msg new user add to system 
#        for example if yuvalm insert will print 'yuvalm' already exist
#                    if moshe tal insert will add user moshe with nickname moshe tal
#                    useradd -c 'moshe tal' moshe
#                    and print new user 'moshe' add to system
#Version 1.0
#Date : 18/12/2017



#This funciton check if name givven as parameter exist as username or nickname 
#in /etc/passwd
#if exist print msg that it exist
#if not exsist add the user to system and print msg that the user add

add_users()
{

for name in  $username
do  
name_user=$(cat /etc/passwd |grep $name |cut -d ":" -f1) # first word username in /etc/passwd
nickname_user=$(cat /etc/passwd |grep $name |cut -d ":" -f5) #fifth word nickname in /etc/passwd

if [ !  $name_user -o ! $nickname_user ];then # if not found
num_words=$(echo $name |wc -w)                # is insert nickname of 2 words
if [ $num_words -eq 2 ];then
u_name=$(echo $name |awk {'print $1'})
u_nickname=$name
else
u_name=$name
u_nickname=$name
fi

useradd -c $u_nickname $u_name     # add user to system

# print grandioues msg with BLACK background and GREEN forground

printf "\e[48;5;0m"   #backgroud color BLACK
printf "\e[1;32m"     #forground color GREEN
printf "############################################\n"
printf "User '$u_name' is created successfuily\n"
printf "############################################\n"

printf "\e[0m"      # return to default color


else

# print grandioues msg with BLACK background and RED forground

printf "\e[48;5;0m"   #backgroud color BLACK
printf "\e[1;91m"     #forground color RED
printf "############################################\n"
printf "User '$name_user' is already exist in system\n"
printf "############################################\n"


printf "\e[0m"      # return to default color


fi
done
}


old="$IFS"      # save the default delimeter (blank)
IFS=","         # update that ',' is the delimeter now
read -p "Enter list name of users to be add to system seperate by , : " username
add_users      # call to function that check and add user to system
IFS="$old"     # back to default delimeter
