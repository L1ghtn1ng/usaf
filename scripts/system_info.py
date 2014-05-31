#!/usr/bin/python3

import os
import platform
import sys
import time
import pwd
import urllib 
import urllib.parse
import urllib.request

# Variables

yellow = '\033[93m'
end_colour = '\033[0m'
purple = '\033[95m'
red = '\033[91m'
green = '\033[92m'
blue = '\033[94m'
public_ip = urllib.request.urlopen('http://ipecho.net/plain')
name = pwd.getpwuid(os.getuid())[0]
user = pwd.getpwuid(os.getuid())[0]
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

def main():
     while 1:
          menu()


def hardware_menu():
    print("Cpu Model:")
    print("Cpu Cores: {cores}".format(cores=os.cpu_count()))
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

    menu_choice = int(input("\nEnter 99 to return to menu: ")
    # fix this if statment syntax error
    if menu_choice == "99":
        menu()

    else:
        error()



def system_menu():
    os.system("clear")
    banner()
    print("Name: {0}".format(name))
    print("User: {0}".format(user))
    print("Local IP: {0}")
    print("External IP: {0}".format("external"))
    print("Router Essid:")
    print("Router Mac:")
    print("Eth0 Mac:")
    print("Wlan0 Mac:")
    print("Wireless Speed:")
    print("Computer Name: {0}".format(hostname))
    print("OS Release:")
    print("OS Codename:")

    menu_choice = int(input("\nEnter 99 to return to menu: ")
    # fix this if statment syntax error
    if menu_choice == "99":
       menu()

    else:
        error()

# main menu of program
def menu():
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

def error():
    print(red + ("\n[!] Invalid Option, Please try again"))
    time.sleep(4)

# run program
if __name__ == '__main__':
     main()

 
