#!/usr/bin/python3
# -*- coding: utf-8 -*-
#Copyright (c) 2014, Jay Townsend
#All rights reserved.
#
#Redistribution and use in source and binary forms, with or without
#modification, are permitted provided that the following conditions are met:
#
#* Redistributions of source code must retain the above copyright notice, this
#  list of conditions and the following disclaimer.
#* Redistributions in binary form must reproduce the above copyright notice,
#  this list of conditions and the following disclaimer in the documentation
#  and/or other materials provided with the distribution.
#* Neither the name of the {organization} nor the names of its
#  contributors may be used to endorse or promote products derived from
#  this software without specific prior written permission.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
#FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


import os
import platform
import sys
import pwd
from urllib.request import urlopen
import subprocess
from time import sleep


# Colour Variables

yellow = '\033[93m'
end_colour = '\033[0m'
purple = '\033[95m'
red = '\033[91m'
green = '\033[92m'
blue = '\033[94m'


def banner():
    os.system("clear")
    print((green + ("""
 #####                                      ###
#     # #   #  ####  ##### ###### #    #     #  #    # ######  ####
#        # #  #        #   #      ##  ##     #  ##   # #      #    #
 #####    #    ####    #   #####  # ## #     #  # #  # #####  #    #
      #   #        #   #   #      #    #     #  #  # # #      #    #
#     #   #   #    #   #   #      #    #     #  #   ## #      #    #
 #####    #    ####    #   ###### #    #    ### #    # #       #### """) + end_colour))


def creator():
    print(yellow + ("\nCreated by Jay Townsend (L1ghtn1ng)") + end_colour)


def get_processor_name():
    command = "cat /proc/cpuinfo | sort | uniq -c"
    all_info = subprocess.getoutput(command).strip()
    for line in all_info.split("\n"):
        if "model name" in line:
            cpuname = (str(line.split(':')[1].strip()))
            return cpuname


def cpu_temp():
    temp = os.system("acpi -t | cut -d ',' -f2").strip("\n")    
    return temp


def cpu_threads():
    pass


def wlan_mac():
    command = "ifconfig | grep wlan0"
    all_info = subprocess.getoutput(command).strip()
    for line in all_info.split("\n"):
        if "HWaddr" in line:
            wlan = (str(line.split()[4].strip()))
            return wlan


def lan_mac():
    command = "ifconfig"
    all_info = subprocess.getoutput(command).strip()
    for line in all_info.split("\n"):
        if "HWaddr" in line:
            eth = (str(line.split()[4].strip()))
            return eth


def os_release():
    command = "cat /etc/*release"
    all_info = subprocess.getoutput(command).strip()
    for line in all_info.split("\n"):
            if "DISTRIB_DESCRIPTION" in line:
                os_version = (str(line.split('=')[1].strip('"')))
                return os_version


def os_code_name():
    command = "cat /etc/*release"
    all_info = subprocess.getoutput(command).strip()
    for line in all_info.split("\n"):
        if "VERSION" in line:
            os_version = (str(line.split(',')[1].strip('"')))
            return os_version


def wireless_speed():
    command = "iwconfig"
    all_info = subprocess.getoutput(command).strip()
    for line in all_info.split("\n"):
        if "Bit Rate" in line:
            speed = (str(line.split('=')[1].strip('Tx-Power')))
            return speed


def ip():
    command = "ifconfig"
    all_info = subprocess.getoutput(command).strip()
    for line in all_info.split("\n"):
        if "Bcast" in line:
            ip = (str(line.split(':')[1].strip('Bcast')))
            return ip


def essid():
    command = "iwconfig"
    all_info = subprocess.getoutput(command).strip()
    for line in all_info.split("\n"):
        if "ESSID" in line:
            ap_name = (str(line.split(':')[1].strip('" "')))
            return ap_name


def ap_mac():
    command = "iwconfig"
    all_info = subprocess.getoutput(command).strip()
    for line in all_info.split("\n"):
        if "Access Point" in line:
            router_mac = (str(line.split()[5].strip()))
            return router_mac


def hardware_menu():
    try:
        os.system('clear')
        banner()
        print("Cpu Model: {0}".format(get_processor_name()))
        print("Cpu Cores: {0}".format(os.cpu_count()))
        print("Cpu Threads: {0}".format(cpu_threads()))
        print("Cpu Temperature: {0}".format(cpu_temp()))
        print("Current Cpu Speed: {0}")
        print("Max Cpu Speed: {0}")
        print("Cpu Characteristics: {0}")
        print("Ram Total: {0}")
        print("Ram Free: {0}")
        print("Ram Type: {0}")
        print("Ram Speed: {0}")
        print("Max Ram Supported: {0}")
        print("Ethernet Controller: {0}")
        print("Network Controller: {0}")
        print("Kernel Version: {0}")
        print("Battery: {0}")

        menu_choice = int(input(yellow + "\n[*]Enter 99 to return to menu or Ctrl+C: " + end_colour))

        if menu_choice == 99:
            main_menu()

        else:
            error()

    except (ValueError):
            print(error())


def network_menu():
    name = pwd.getpwuid(os.getuid())[0]
    user = pwd.getpwuid(os.getuid())[0]
    hostname = platform.node()
    public_ip = urlopen('http://ipecho.net/plain')
    external = public_ip.read()

    try:
        os.system("clear")
        banner()
        print("Name: {0}".format(name))
        print("User: {0}".format(user))
        print("Local IP: {0}".format(ip()))
        print("External IP: {0}".format(str(external, "Utf-8")))
        print("Router Essid: {0}".format(str(essid())))
        print("Router Mac: {0}".format(ap_mac()))
        print("Eth0 Mac: {0}".format(lan_mac()))
        print("Wlan0 Mac: {0}".format(wlan_mac()))
        print("Wireless Speed: {0}".format(wireless_speed()))
        print("Computer Name: {0}".format(hostname))
        print("OS Release: {0}".format(os_release()))
        print("OS Codename: {0}".format(os_code_name()))

        menu_choice = int(input(yellow + "\n[*]Enter 99 to return to menu or Ctrl+C: " + end_colour))

        if menu_choice == 99:
            main_menu()

        else:
            error()

    except(ValueError):
            print(error())
    except(KeyboardInterrupt):
            print("\n Quiting....")
            sleep(2.0)
            sys.exit(0)


def main_menu():

    try:
        banner()
        creator()
        print(red + ("""
1.) Hardware Infomation
2.) Network Infomation
3.) Quit""") + end_colour)
        menu_choice = int(input(yellow + "\n[*]Enter Option: " + end_colour))

        if menu_choice == 1:
            hardware_menu()
        elif menu_choice == 2:
            network_menu()
        elif menu_choice == 3:
            sys.exit(0)

        else:
            error()

    except(ValueError):
        print(error())


def error():
    print(red + ("\n[!] Invalid Option, Please try again") + end_colour)
    sleep(2.0)


def main():
    if os.getuid() != 0:
        print("\nPlease run as Root")
        sleep(2)
        sys.exit()
    try:
        while 1:
            main_menu()

    except(KeyboardInterrupt):
            print("\n Ctrl+C detected, Quitting....")
            sleep(2.0)


if __name__ == '__main__':
    main()
