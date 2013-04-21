#!/bin/bash
# If you use any of my code
# Please give credit thank
# you
#
banner(){
clear
echo -e "\e[0;33m[*]Automater script for Ufw, Designed for Ubuntu[*]\e[0m"
echo
echo -e "\e[0;36m[*]Created By Jay Townsend aka L1ghtn1ng[*]\e[0m"
echo
}

menu(){
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

ufw_on(){
banner
echo -e "\e[1;33m[*]Turning Ufw On and setting Incoming policy to deny\e[0m"
echo
sudo ufw default deny; sudo ufw "enable"
}

add_rule(){
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

reset_rule(){
banner
sudo ufw reset
}

delete_rules(){
banner
sudo ufw status numbered
echo -ne "\e[1;33m[*]Enter the rule number to delete:\e[0m "
read Input
sudo ufw delete $Input
}

in_rule(){
banner
echo -e "\e[1;31m1) Allow Http In\e[0m"
echo -e "\e[1;31m2) Allow Https In\e[0m"
echo -e "\e[1;31m3) Allow SSH In\e[0m"
echo -e "\e[1;31m4) Allow Ftp In\e[0m"
echo -e "\e[1;31m5) Allow Pop3 In\e[0m"
echo -e "\e[1;31m6) Allow Imap In\e[0m"
echo -e "\e[1;31m7) Allow Samba In\e[0m"
echo -e "\e[1;31m8) Allow Smtp In\e[0m"
echo -e "\e[1;31m9) Block Hackers In from attacking webserver\e[0m"
echo -e "\e[1;31m10) Custom In Rule\e[0m"
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
		sudo ufw allow "in" pop3
		;;
		6)
		sudo ufw allow "in" imap
		;;
		7)
		sudo ufw allow "in" samba
		;;
		8)
		sudo ufw allow "in" smtp
		;;
		9) attack_ipban;;
		10) custom_rule;;
		99) menu;;
		*) error;;
esac
}

out_rule(){
banner
echo -e "\e[1;31m1) Allow Http Out\e[0m"
echo -e "\e[1;31m2) Allow Https Out\e[0m"
echo -e "\e[1;31m3) Allow SSH Out\e[0m"
echo -e "\e[1;31m4) Allow Ftp Out\e[0m"
echo -e "\e[1;31m5) Allow Pop3 Out\e[0m"
echo -e "\e[1;31m6) Allow Imap Out\e[0m"
echo -e "\e[1;31m7) Allow Samba Out\e[0m"
echo -e "\e[1;31m8) Allow Smtp Out\e[0m"
echo -e "\e[1;31m9) Custom Out Rule\e[0m"
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
		5)
		sudo ufw allow out pop3
		;;
		6)
		sudo ufw allow out imap
		;;
		7)
		sudo ufw allow out samba
		;;
		8)
		sudo ufw allow out smtp
		;;
		9) custom_rule;;
		99) menu;;
		*) error;;
esac
}

malware_ipban(){
banner
get_malware_ips
echo
echo -e "\e[1;33m[*]Enter Your Local Lan IP Range\e[0m"
echo -e "\e[1;33m[*]For example if its 192.168.0.0/24 then enter the example\e[0m"
echo -e "\e[1;33m[*]Please do not forget to add the /24 this is Important\e[0m"
read lanip
cat ipban/malwareipban.txt | while read ipban
do
sudo ufw deny out log from $lanip to $ipban
done
rm ipban/malwareipban.txt
}

get_malware_ips(){
cd ipban
wget -q http://malc0de.com/bl/IP_Blacklist.txt
sed -e '/^$/d' IP_Blacklist.txt > Blacklist2.txt
sed -e '/^\//d' Blacklist2.txt > malwareipban.txt
rm IP_Blacklist.txt
rm Blacklist2.txt
cd ..
}

attack_ipban(){
banner
get_banlist
echo
echo -e "\e[1;33m[*]Enter your local Lan IP range\e[0m"
echo -e "\e[1;33m[*]For example if its 192.168.0.0/24 then enter the example\e[0m"
echo -e "\e[1;33m[*]Please do not forget to add the /24 this is Important\e[0m"
read lanip

cat ipban/hackeripbanlist.txt | while read ipban
do
sudo ufw deny "in" log from $ipban to $lanip
done
rm ipban/hackeripbanlist.txt
}

get_banlist(){
cd ipban
wget -q https://www.trustedsec.com/banlist.txt
sed -e "/#/d" banlist.txt > hackeripbanlist.txt
rm banlist.txt
cd ..
}

custom_rule(){
banner
echo
echo -e "\e[1;33m[*]No need to start your rule with sudo ufw\e[0m"
echo -e "\e[1;33m[*]As this has been done for you\e[0m"
echo -e "\e[1;33m[*]Enter your custom rule\e[0m "

read custom

sudo ufw $custom

}

error(){
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