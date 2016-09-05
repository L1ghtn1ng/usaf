# Ubuntu System Administration Framework (U.S.A.F)

To automate certain aspects in Ubuntu to make your life easier when administering the system

# License

Please read the LICENSE file

# Downloading

git clone https://github.com/L1ghtn1ng/usaf.git  usaf/ in your home directory


# Dependencies

You will need to install 

* Postfix for sending emails ```sudo apt-get install postfix```

* In Ubuntu security advisories script you will need to change the code with the parts with ```taddr```
  to valid email addresses. Once you have done this create a crontab to run the script every 48 hours 
  as you will get 50 emails every time the script runs. It has to be run as root also because it logs
  to ```/var/log/security_advisories.log```
* Python3 packages that need to be installed ```sudo apt-get install python3-requests python3-feedparser```
Also can be installed using pip3 by installing ```python3-pip``` package

Thats all you will need as ```Ubuntu``` comes with the rest of the libraries U.S.A.F uses. The one thing you need to make sure
is that you are running ```Python 3``` U.S.A.F will not work if running on Ubuntu server that does not have ```Python 3 ```installed

# Python Rewrite

I am currently in a slow processes of porting code over to python3 from Bash. Any help with this to speed 
up the progress would be greatly appreciated. 
