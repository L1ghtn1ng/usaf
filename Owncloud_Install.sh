#!/bin/bash
echo "
      _________________________________________________________
     |                                                         |
     | Please wait....Installing Owncloud & Its dependentcies  |
     |_________________________________________________________|"




sudo apt-get install -y apache2 php5 php5-json php-xml-parser php5-gd php5-sqlite
#
#
cd Downloads
#
#
wget http://download.owncloud.org/releases/owncloud-4.5.7.tar.bz2
#
#
tar -jxvf owncloud-4.5.7.tar.bz2
#
#
cp -r owncloud /var/www/owncloud
#
cd
#
cd /var/www/owncloud
#
#
mkdir data 
#
#
sudo chown -R www-data:www-data /var/www/owncloud/data
#
#
sudo chown -R www-data:www-data /var/www/owncloud/config
#
#
cd
#
#
echo "
 _____________________________________________________________________________
| It is recommended that you enable .htaccess files as OwnCloud uses them to  |
| enhance security and allows you to use webfinger                            |   
| To enable .htaccess files you need to ensure that ‘AllowOverride’ is set to |
| ‘All’ in the ‘Directory /var/www/’ section of your virtual hostfile.        |
| This is usually in /etc/apache2/sites-enabled/000-default this file will    |
| open automatically so you can change the section that needs to be edited    |
|_____________________________________________________________________________|" 
#
#
sudo gedit /etc/apache2/sites-enabled/000-default
#
#
sudo a2enmod rewrite
#
#
sudo a2enmod headers
#
#
sudo service apache2 restart
#
#
firefox http://localhost/owncloud
#
#
echo "
      ______________________________________________________________
     |                                                              |
     |   Terminal will close automatically in 10 secounds           |
     |   Thank you for using this script by Jay Cyb3rtr0n Townsend  |
     |______________________________________________________________|"

#
while sleep 10; do "exit"; done	
