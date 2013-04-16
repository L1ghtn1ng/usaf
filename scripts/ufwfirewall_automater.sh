#!/bin/bash
# If you use any of my code
# Please give credit thank
# you
#
banner()
{
	clear
	echo -e "\e[0;33mAutomater script for Ufw, Designed for Ubuntu\e[0m"
	echo
	echo -e "\e[0;36m[*]Created By Jay Townsend aka L1ghtn1ng[*]\e[0m"
	echo
}

menu() 
{
	banner
	echo -e "\e[1;31m1) Turn Ufw On\e[0m"
	echo -e "\e[1;31m2) Add Rules\e[0m"
	echo -e "\e[1;31m3) Reset Ufw\e[0m"
	echo -e "\e[1;31m4) Delete Rules\e[0m"
	echo -e "\e[1;31m0) Quit\e[0m"
	echo
	echo
	echo -ne "\e[1;33m[*]Select a number from menu, then [enter]:\e[0m "

	read Input

case $Input in
		1)
		ufw_on;;
		2)
		add_rule;;
		3)
		reset_rule;;
		4)
		delete_rules;;
		0)
		break;;
		*)
		error;;
esac
}

ufw_on()
{
	banner
	echo -e "\e[1;33m[*]Turning Ufw On and setting Incoming policy to deny\e[0m"
	echo
	sudo ufw default deny; sudo ufw "enable"
}

add_rule()
{
	banner
	echo -e "\e[1;31m1) Set Incoming Rule\e[0m"
	echo -e "\e[1;31m2) Set Outcoming Rule\e[0m"
	echo -e "\e[1;31m3) Block Malware Websites\e[0m"
	echo
	echo
	echo -e "\e[1;31m99) Return to menu\e[0m"
	echo
	echo -ne "\e[1;33m[*]Select a number from menu, then [enter]:\e[0m "

	read Input

case $Input in
		1)
		in_rule;;
		2)
		out_rule;;
		3)
		malware_ipban;;
		99)
		menu;;
		*)
		error;;
esac

}

reset_rule()
{
	banner
	sudo ufw reset
}

delete_rules()
{
	banner
	sudo ufw status numbered
	echo -ne "\e[1;33m[*]Enter the rule number to delete:\e[0m "
	read Input
	sudo ufw delete $Input
}

in_rule()
{
	banner
	echo -e "\e[1;31m1) Allow HTTP In\e[0m"
	echo -e "\e[1;31m2) Allow HTTPS In\e[0m"
	echo -e "\e[1;31m3) Allow SSH In\e[0m"
	echo -e "\e[1;31m4) Allow FTP In\e[0m"
	echo -e "\e[1;31m5) Block Hackers In from attacking webserver\e[0m"
	echo
	echo -e "\e[1;31m99) Return to menu\e[0m"
	echo
	echo
	echo -ne "\e[1;33m[*]Select a number from menu, then [enter]:\e[0m "
	read Input

case $Input in
		1)
		sudo ufw allow "in" http
		;;
		2)
		sudo ufw allow "in" https
		;;
		3)
		sudo ufw allow "in" ssh
		;;
		4)
		sudo ufw allow "in" ftp
		;;
		5)
		attack_ipban;;
		99)
		menu;;
		*)
		error;;
esac
}

out_rule()
{
	banner
	echo -e "\e[1;31m1) Allow HTTP Out\e[0m"
	echo -e "\e[1;31m2) Allow HTTPS Out\e[0m"
	echo -e "\e[1;31m3) Allow SSH Out\e[0m"
	echo -e "\e[1;31m4) Allow FTP Out\e[0m"
	echo
	echo -e "\e[1;31m99) Return to menu\e[0m"
	echo
	echo
	echo -ne "\e[1;33m[*]Select a number from menu, then [enter]:\e[0m "
	read Input

case $Input in
		1)
		sudo ufw allow out http
		;;
		2)
		sudo ufw allow out https
		;;
		3)
		sudo ufw allow out ssh
		;;
		4)
		sudo ufw allow out ftp
		;;
		99)
		menu;;
		*)
		error;;
esac
}

malware_ipban()
{
banner
echo
echo -e "\e[1;33mEnter Your Local Lan IP Range\e[0m"
echo -e "\e[1;33mFor example if its 192.168.0.0/24 then enter the example\e[0m"
echo -e "\e[1;33mPlease do not forget to add the /24 this is Important\e[0m"
read lanip
cat ipban/malwareipban.txt | while read ipban
do
sudo ufw deny out log from $lanip to $ipban
done
}

attack_ipban()
{
banner
echo
echo -e "\e[1;33mEnter Your Local Lan IP Range\e[0m"
echo -e "\e[1;33mFor example if its 192.168.0.0/24 then enter the example\e[0m"
echo -e "\e[1;33mPlease do not forget to add the /24 this is Important\e[0m"
read lanip
cat ipban/hackeripbanlist.txt | while read ipban
do
sudo ufw deny "in" log from $ipban to $lanip
done
}

custom_rule(){
	banner
	echo

}

error()
{
	echo
	echo -e "\e[1;31mError\e[0m"
	echo -e "\e[1;31mNot valid Input Please Select a number from the menu then follow on screen instructions\e[0m"
	sleep 3
}
	##
	# Program start
	# Loops forever
	##

while : 
do
menu
done