# Ubuntu System Administration Framework (U.S.A.F)

To automate certain aspects in Ubuntu to make your life easier when administering the system


# Downloading

git clone https://github.com/L1ghtn1ng/usaf.git  usaf/ in your home directory


# Dependencies

You will need to install 

* Postfix for sending emails ```sudo apt-get install postfix```
* In Ubuntu security advisories script you will need to change the code with the parts with ```taddr```
  to valid email addresses

Thats all you will need as ```Ubuntu``` comes with the rest of the libraries U.S.A.F uses. The one thing you need to make sure
is that you are running ```Python 3``` U.S.A.F will not work if running on Ubuntu server. You will need to install
Python 3 and the libraries that the scripts require. This is only needed for Ubuntu 12.04


# Python Rewrite

I am currently in a slow processes of porting code over to python3 from Bash. Any help with this to speed 
up the progress would be greatly appreciated. 