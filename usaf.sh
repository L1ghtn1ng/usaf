#!/bin/bash
# If you use any of my code
# Please give credit, thank you
#
banner(){
clear
echo -e "\e[1;32m
##     ##     ######        ###       ######## 
##     ##    ##    ##      ## ##      ##       
##     ##    ##           ##   ##     ##       
##     ##     ######     ##     ##    ######   
##     ##          ##    #########    ##       
##     ##    ##    ##    ##     ##    ##       
 #######      ######     ##     ##    ##\e[0m"

echo
echo -e "\e[1;35mWelcome to the Ubuntu System Administration Framework (U.S.A.F)\e[0m"
echo
echo -e "\e[1;32mCreated by Jay Townsend aka L1ghtn1ng\e[0m"
echo
}

menu(){
banner
echo -e "\e[1;31m1) Ufw firewall management\e[0m"
echo -e "\e[1;31m2) Network/System Information\e[0m"
echo
echo -e "\e[1;31m0) Quit\e[0m"
echo
echo -en "\e[1;33m[*]Please select a number from menu, then Enter: \e[0m"
read input

case $input in
	1) scripts/./ufwfirewall_automater.sh;;
	2) scripts/./system_info.sh;;
	0) break;;
	*) error;;

esac
}

error(){
echo
echo -e "\e[1;31mError Not valid input Returning to menu\e[0m"
sleep 4
}

##
# Program start
##

while :
do
menu
done
