#!/usr/bin/python3

import os
import platform
import sys
import pwd
import urllib
import urllib.parse
import urllib.request
import fcntl
import struct
import subprocess
from time import sleep

# Global Variables

yellow = '\033[93m'
end_colour = '\033[0m'
purple = '\033[95m'
red = '\033[91m'
green = '\033[92m'
blue = '\033[94m'
public_ip = urllib.request.urlopen('http://ipecho.net/plain')
external = public_ip.read()
hostname = platform.node()
# banner for program

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

def hardware_menu():
    print("Cpu Model: {0}".format(get_processor_name()))
    print("Cpu Cores: {0}".format(os.cpu_count()))
    print("Cpu Threads:")
    print("Cpu Temperature:")
    print("Current Cpu Speed:")
    print("Max Cpu Speed:")
    print("Cpu Characteristics:")
    print("Ram Total:")
    print("Ram Free:")
    print("Ram Type:")
    print("Ram Speed:")
    print("Max Ram Supported:")
    print("Ethernet Controller:")
    print("Network Controller:")
    print("Kernel Version:")
    print("Battery:")

    menu_choice = int(input("\nEnter 99 to return to menu: "))

    if menu_choice == "99":
        main_menu()

    else:
        error()


def get_processor_name():

    if platform.system() == "Linux":
        command = "cat /proc/cpuinfo | sort | uniq -c"
        all_info = subprocess.getoutput(command).strip()
        for line in all_info.split("\n"):
            if "model name" in line:
                cpuname = (str(line.split(':')[1].strip()))
                print(cpuname)

def cpu_temp():
    pass

def wlan_mac():
    pass

def lan_mac():
    pass

def system_menu():

    name = pwd.getpwuid(os.getuid())[0]
    user = pwd.getpwuid(os.getuid())[0]

    try:
     os.system("clear")
     banner()
     print("Name: {0}".format(name))
     print("User: {0}".format(user))
     print("Local IP: {0}")
     print("External IP: {0}".format(str(external))
     print("Router Essid: {0}")
     print("Router Mac: {0}")
     print("Eth0 Mac: {0}".format(lan_mac()))
     print("Wlan0 Mac: {0}".format(wlan_mac()))
     print("Wireless Speed: {0}")
     print("Computer Name: {0}".format(hostname))
     print("OS Release: {0}")
     print("OS Codename: {0}")

     menu_choice = int(input("\nEnter 99 to return to menu: "))

     if menu_choice == "99":
        main_menu()

     else:
         error()

    except ValueError:
          print(error())

# main menu of program
def main_menu():

   try:
    banner()
    creator()
    print(red + ("""
1.) Hardware Infomation
2.) Network Infomation
3.) Quit""") + end_colour)
    menu_choice = int(input("\n[*]Enter Option: "))

    if  menu_choice == 1:
         hardware_menu()
    elif  menu_choice == 2:
           system_menu()
    elif  menu_choice == 3:
           sys.exit(0)
    else:
        error()

   except ValueError:
            print(error())

def error():
    print(red + ("\n[!] Invalid Option, Please try again") + end_colour)
    sleep(2.0)

# run program

def main():
     while 1:
          main_menu()

if __name__ == '__main__':
	main()
