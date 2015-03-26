#!/bin/bash

# automated-lemp-on-s4u
# Eibo Richter
# http://github.com/Smeeth/automated-lemp-on-s4u
# published under GNU GENERAL PUBLIC LICENSE


#Check root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script. Try again as root!"
    exit 1

	else


	#Disable and deinstall apache2 and apparmor, if installed
	/etc/init.d/apparmor stop
	update-rc.d -f apparmor remove
	apt-get -y remove apparmor apparmor-utils --purge

	/etc/init.d/apache2 stop
	update-rc.d -f apache2 remove
	apt-get -y remove apache2 --purge


	#Install MySQL
	echo "mysql-server-5.6 mysql-server/root_password password $mysql_pass" | debconf-set-selections
	echo "mysql-server-5.6 mysql-server/root_password_again password $mysql_pass" | debconf-set-selections

	apt-get -y install mysql-client mysql-server
	apt-get -y install php5-cli php5-mysql php5-mcrypt mcrypt
    
	#Allow MySQL to listen on all interfaces
	cp /etc/mysql/my.cnf /etc/mysql/my.cnf.backup
	sed -i 's/bind-address/#bind-address' /etc/mysql/my.cnf

	service mysql restart


fi