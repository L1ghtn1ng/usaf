#!/bin/bash
#
# If you use any of my code 
# Please give me credit thats all I ask
# Thank you
#
#These are the variables I have set Do Not Change these unless you know what you are doing
motherboard=`sudo dmidecode -s system-manufacturer`
Biosversion=`sudo dmidecode -s bios-version`
motherboardmodel=`sudo dmidecode -s baseboard-product-name`
CpuName=`lscpu | grep name | cut -d ':' -f2`
Cpucores=`lscpu | grep 'socket' | cut -d ':' -f2`
RamTotal=`cat /proc/meminfo | grep 'MemTotal' | cut -d ':' -f2`
RamFree=`cat /proc/meminfo | grep 'MemFree' | cut -d ':' -f2`
RamSpeed=`sudo dmidecode -t memory | sort | uniq -c | grep Speed | cut -d ':' -f2 | uniq`
RamSupported=`sudo dmidecode -t memory | sort | uniq -c | grep 	Maximum" "Capacity | cut -d ':' -f2`
Battery=`acpi -V | grep 'Battery' | cut -d ':' -f2`
Cpuspeed=`sudo dmidecode | sort | uniq -c | grep Current" "Speed | cut -d ':' -f2`
Cpumax=`lscpu | grep max | cut -d ':' -f2 | cut -d '.' -f1`
Cputhreads=`sudo dmidecode | sort | uniq -c | grep Thread" "Count | cut -d ':' -f2`
CpuCharacteristics=`lscpu | egrep 64-bit | cut -d ',' -f2`
RamType=`sudo dmidecode | sort | uniq | grep DDR | cut -d ':' -f2`
GPU=`cat /var/log/Xorg.0.log | egrep '(NVIDIA GPU|INTEL GPU|AMD GPU)' | uniq -u | cut -d '(' -f3 | cut -d ':' -f2 | awk '{print$3,$4,$5,$6}'`
Kernelversion=`uname -r | cut -d 'g' -f1 | sed -e  "s/-*$//"`
Computername=`uname -n`
Os=`lsb_release -a | grep Release | cut -d ':' -f2`
codename=`cat /etc/*release | grep 'VERSION' | cut -d "=" -f2 | awk '{print$2, $3}' | cut -d "(" -f2 | cut -d ")" -f1`
cputemp=`acpi -t | cut -d ',' -f2`
ScreenSize=`cat /var/log/Xorg.0.log | grep Virtual" "screen | sort | uniq -u | cut -d ':' -f2 | awk '{print$7,$8,$9}'`
User=`whoami`
LoginName=`logname`
IP=`ip a | egrep '(eth0|eno1)' | egrep inet | awk '{print$2}'`
Public_ip=`wget -q "http://ipecho.net/plain" -O publicip; cat publicip; rm publicip`
Ethernet_controller=`lspci -Q | grep 'Ethernet controller' | cut -d ':' -f3 | cut -d '(' -f1`
Ethernetmac=`ifconfig | egrep '(eth0|eno1)' | awk '{print$5}'`
Network_controller=`lspci -Q | grep 'Network controller' | cut -d ':' -f3 | cut -d '(' -f1`
Wlan0mac=`ifconfig | grep 'wlan0' | awk '{print$5}'`
Wlanspeed=`iwconfig wlan0 | grep -i 'Bit Rate' | cut -d '=' -f2 | cut -d 'T' -f1`
Apmac=`iwconfig  2>/dev/null | grep Access" "Point | awk '{print$6}'`
Essid=`iwconfig 2>/dev/null | grep 'ESSID' | awk '{print$4}' | cut -d ':' -f2 | cut -d '"' -f2`
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
echo -e "\e[1;31mMotherboard Manufacturer:\e[0m" $motherboard
echo -e "\e[1;31mBios Version:\e[0m" $Biosversion
echo -e "\e[1;31mMotherboard Model:\e[0m" $motherboardmodel
echo -e "\e[1;31mCpu Model:\e[0m" $CpuName
echo -e "\e[1;31mCpu Cores:\e[0m" $Cpucores
echo -e "\e[1;31mCpu Threads:\e[0m" $Cputhreads
echo -e "\e[1;31mCurrent Cpu Speed:\e[0m" $Cpuspeed
echo -e "\e[1;31mMax Cpu Speed MHz:\e[0m" $Cpumax
echo -e "\e[1;31mCpu Characteristics:\e[0m" $CpuCharacteristics
echo -e "\e[1;31mCpu Temperature:\e[0m" $cputemp
echo -e "\e[1;31mRam Total:\e[0m" $RamTotal  
echo -e "\e[1;31mRam Free:\e[0m" $RamFree
echo -e "\e[1;31mRam Type:\e[0m" $RamType
echo -e "\e[1;31mRam Speed:\e[0m" $RamSpeed
echo -e "\e[1;31mMax Ram Supported:\e[0m" $RamSupported
echo -e "\e[1;31mScreen Resolution:\e[0m" $ScreenSize
echo -e "\e[1;31mGraphics Card:\e[0m" $GPU
echo -e "\e[1;31mEthernet Controller:\e[0m" $Ethernet_controller
echo -e "\e[1;31mWireless Controller:\e[0m" $Network_controller
echo -e "\e[1;31mKernel Version:\e[0m" $Kernelversion
echo -e "\e[1;31mBattery:\e[0m" $Battery
echo
echo
echo -ne "\e[1;33m[*]Enter 99 to return to menu\e[0m: "

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

system_menu(){
clear
echo -e "\e[1;31mName:\e[0m" $LoginName
echo -e "\e[1;31mUser:\e[0m" $User
echo -e "\e[1;31mLocal IP:\e[0m" $IP
echo -e "\e[1;31mExternal IP:\e[0m" $Public_ip
echo -e "\e[1;31mRouter Essid:\e[0m" $Essid
echo -e "\e[1;31mRouter Mac:\e[0m" $Apmac
echo -e "\e[1;31mEthernet Mac:\e[0m" $Ethernetmac 
echo -e "\e[1;31mWlan0 Mac:\e[0m" $Wlan0mac
echo -e "\e[1;31mWireless Speed:\e[0m" $Wlanspeed 
echo -e "\e[1;31mComputer Name:\e[0m" $Computername
echo -e "\e[1;31mOS Release:\e[0m" $Os
echo -e "\e[1;31mOS Codename:\e[0m" $codename
echo
echo
echo -ne "\e[1;33m[*]Enter 99 to return to menu\e[0m: "

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
echo -e "\e[1;31m2) System menu\e[0m"
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
	system_menu
	;;
	0)
    exit 0
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
