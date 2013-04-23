#!/bin/bash
# If you use any of my code 
# Please give me credit thats all i ask
# Thank you
#
#These are the variables I have set Do Not Change these unless you know what you are doing 
CpuName=`cat /proc/cpuinfo > cpuinfo.txt; cat cpuinfo.txt | sort | uniq -c | grep 'name' | cut -d ':' -f2; rm cpuinfo.txt`
Cpucores=`cat /proc/cpuinfo > cpuinfo.txt; cat cpuinfo.txt | sort | uniq -c | grep 'cores' | cut -d ':' -f2; rm cpuinfo.txt`
RamTotal=`cat /proc/meminfo > meminfo.txt; cat meminfo.txt | grep 'MemTotal' | cut -d ':' -f2; rm meminfo.txt`
RamFree=`cat /proc/meminfo > meminfo.txt; cat meminfo.txt | grep 'MemFree' | cut -d ':' -f2; rm meminfo.txt`
RamSpeed=` sudo dmidecode -t memory | sort | uniq -c | grep Speed | cut -d ':' -f2 | cut -d 'U' -f1`
RamSupported=`sudo dmidecode -t memory | sort | uniq -c | grep 	Maximum" "Capacity | cut -d ':' -f2`
Battery=`acpi -V | grep 'Battery' | cut -d ':' -f2`
Cpuspeed=`sudo dmidecode > cpuspeed.txt; cat cpuspeed.txt | sort | uniq -c | grep Current" "Speed | cut -d ':' -f2; rm cpuspeed.txt`
Cpumax=`sudo dmidecode > cpuspeed.txt; cat cpuspeed.txt | sort | uniq -c | grep Max" "Speed | cut -d ':' -f2; rm cpuspeed.txt`
Cputhreads=`sudo dmidecode > cpuspeed.txt; cat cpuspeed.txt | sort | uniq -c | grep Thread" "Count | cut -d ':' -f2; rm cpuspeed.txt`
CpuCharacteristics=`sudo dmidecode > cpuspeed.txt; cat cpuspeed.txt | sort | grep 64-bit | cut -d ':' -f2; rm cpuspeed.txt`
RamType=`sudo dmidecode > cpuspeed.txt; cat cpuspeed.txt | sort | uniq | grep DDR | cut -d ':' -f2; rm cpuspeed.txt`
Kernelversion=`uname -r | cut -d 'g' -f1 | sed -e  "s/-*$//"`
Computername=`uname -n`
Os=`cat /etc/*release > osinfo.txt; cat osinfo.txt | grep 'DISTRIB_DESCRIPTION' | cut -d '=' -f2 | cut -d '"' -f2; rm osinfo.txt`
codename=`cat /etc/*release > osinfo.txt; cat osinfo.txt | grep 'VERSION' | cut -d '=' -f2 | cut -d ',' -f2 | cut -d '"' -f1; rm osinfo.txt`
cputemp=`acpi -t | cut -d ',' -f2`
User=`whoami`
LoginName=`logname`
IP=`ifconfig | grep 'Bcast' | awk '{print$2}' | cut -d ':' -f2`
Public_ip=`wget -q "http://ipecho.net/plain" -O publicip; cat publicip; rm publicip`
Eth0mac=`ifconfig | grep 'eth0' | awk '{print$5}'`
Wlan0mac=`ifconfig | grep 'wlan0' | awk '{print$5}'`
Apmac=`iwconfig > apmac.txt 2>/dev/null; cat apmac.txt | grep Access" "Point | awk '{print$6}'; rm apmac.txt`
Essid=`iwconfig > essid.txt 2>/dev/null; cat essid.txt | grep 'ESSID' | awk '{print$4}' | cut -d ':' -f2 | cut -d '"' -f2; rm essid.txt`
# End of variables

banner(){
clear
echo -e "\e[1;32m
 #####                                      ###                      
#     # #   #  ####  ##### ###### #    #     #  #    # ######  ####  
#        # #  #        #   #      ##  ##     #  ##   # #      #    # 
 #####    #    ####    #   #####  # ## #     #  # #  # #####  #    # 
      #   #        #   #   #      #    #     #  #  # # #      #    # 
#     #   #   #    #   #   #      #    #     #  #   ## #      #    # 
 #####    #    ####    #   ###### #    #    ### #    # #       ####\e[0m" 
echo
echo 
echo -e "\e[1;34mCreated by Jay Townsend\e[0m"
echo
echo -e "\e[1;33m[*]This script depends on acpi being installed[*]\e[0m"
echo
echo -e "\e[1;33m[*]Retreving Your Information You Have Requested[*]\e[0m"
echo
echo -e "\e[1;32m===================================================\e[0m"
}

hardware_menu(){
clear
echo -e "\e[1;31mCpu Model:\e[0m" $CpuName
echo -e "\e[1;31mCpu Cores:\e[0m" $Cpucores
echo -e "\e[1;31mCpu Threads:\e[0m" $Cputhreads
echo -e "\e[1;31mCpu Temperature:\e[0m" $cputemp
echo -e "\e[1;31mCurrent Cpu Speed:\e[0m" $Cpuspeed
echo -e "\e[1;31mMax Cpu Speed:\e[0m" $Cpumax
echo -e "\e[1;31mCpu Characteristics:\e[0m" $CpuCharacteristics
echo -e "\e[1;31mRam Total:\e[0m" $RamTotal  
echo -e "\e[1;31mRam Free:\e[0m" $RamFree
echo -e "\e[1;31mRam Type:\e[0m" $RamType
echo -e "\e[1;31mRam Speed:\e[0m" $RamSpeed
echo -e "\e[1;31mMax Ram Supported:\e[0m" $RamSupported
echo -e "\e[1;31mKernel Version:\e[0m" $Kernelversion
echo -e "\e[1;31mBattery:\e[0m" $Battery
echo
echo
echo -ne "\e[1;33m[*]Enter 99 to return to menu\e[0m "

read choice

case $choice in
	99)
	menu
	;;
	*)
	error
	;;
esac
}

network_menu(){
clear
echo -e "\e[1;31mName:\e[0m" $LoginName
echo -e "\e[1;31mUser:\e[0m" $User
echo -e "\e[1;31mLocal IP:\e[0m" $IP
echo -e "\e[1;31mExternal IP:\e[0m" $Public_ip
echo -e "\e[1;31mRouter Essid:\e[0m" $Essid
echo -e "\e[1;31mRouter Mac:\e[0m" $Apmac
echo -e "\e[1;31mEth0 Mac:\e[0m" $Eth0mac 
echo -e "\e[1;31mWlan0 Mac:\e[0m" $Wlan0mac 
echo -e "\e[1;31mComputer Name:\e[0m" $Computername
echo -e "\e[1;31mOS Release:\e[0m" $Os
echo -e "\e[1;31mOS Codename:\e[0m" $codename
echo
echo
echo -ne "\e[1;33m[*]Enter 99 to return to menu\e[0m "

read choice

case $choice in
	99)
	menu
	;;
	*)
	error
	;;
esac
}

menu(){
banner
echo
echo
echo -e "\e[1;31m1) Hardware menu\e[0m"
echo -e "\e[1;31m2) Network menu\e[0m"
echo
echo -e "\e[1;31m0) Exit\e[0m"
echo
echo -ne "\e[1;33m[*]Please select a number from menu, then [enter]:\e[0m "

read choice

case $choice in
	1)
	hardware_menu
	;;
	2)
	network_menu
	;;
	0)
	break
	;;
	*)
	error
	;;
esac
}

error(){
echo
echo -e "\e[1;31mError, that is not a valid choice or Input, Returning to menu\e[0m"
sleep 3
}

##
# program start
##

while :
do
menu
done