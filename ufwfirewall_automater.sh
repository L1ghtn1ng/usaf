#!/bin/bash
#
#
#
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
	echo -e "\e[1;31m3) Reset Rules\e[0m"
	echo -e "\e[1;31m0) Quit\e[0m"
	echo
	echo
	echo -ne "\e[1;33m[*]Select a number from menu, then [enter]:\e[0m "

	read Input

case $Input in
		1)
		ufw_on
		;;
		2)
		add_rule
		;;
		3)
		reset_rule
		;;
		0)
		break
		;;
		*)
		error
		;;
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
			in_rule
			;;
			2)
			out_rule
			;;
			3)
			malware_ipban
			;;
			99)
			menu
			;;
			*)
			error
			;;
	esac

}

reset_rule()
{
	echo
}

in_rule()
{
	echo -e "\e[1;33m Enter Your Incoming Rule\e[0m"
	read Input
}

out_rule()
{

echo
}

malware_ipban()
{
echo
echo -e "\e[1;33mEnter Your Local Lan IP Range\e[0m"
echo -e "\e[1;33mFor example if its 192.168.0.0/24 then enter the example\e[0m"
echo -e "\e[1;33mPlease do not forget to add the /24 this is Important\e[0m"
read lanip
cat malwareipban.txt | while read ipban
do
sudo ufw deny out log from $lanip to $ipban
done
}

error()
{
	echo
	echo -e "\e[1;31mError, Please Select a number from menu\e[0m"
	sleep 3
}
	##
	#Program start
	##

while : 
do
menu
done
