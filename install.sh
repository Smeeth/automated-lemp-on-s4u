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


	# Disable and deinstall apache2 and apparmor, if installed
	service apparmor stop
	update-rc.d -f apparmor remove
	apt-get -y remove apparmor apparmor-utils --purge

	service apache2 stop
	update-rc.d -f apache2 remove
	apt-get -y remove apache2 --purge


	# Install MySQL
	echo "mysql-server-5.6 mysql-server/root_password password $mysql_pass" | debconf-set-selections
	echo "mysql-server-5.6 mysql-server/root_password_again password $mysql_pass" | debconf-set-selections

	apt-get -y install mysql-client mysql-server
	apt-get -y install php5-cli php5-mysql php5-mcrypt mcrypt
    
	# MySQL: listen on all interfaces
	cp /etc/mysql/my.cnf /etc/mysql/my.cnf.backup
	sed -i 's/bind-address/#bind-address' /etc/mysql/my.cnf

	service mysql restart


	# Install NTP
	apt-get -y install ntp ntpdate

	#Install NginX, PHP5, phpMyAdmin, FCGI, suExec, Pear, And mcrypt
	echo 'phpmyadmin      phpmyadmin/reconfigure-webserver        multiselect' | debconf-set-selections
	echo 'phpmyadmin      phpmyadmin/dbconfig-install     boolean false' | debconf-set-selections

	apt-get -y install nginx

	service nginx start

	apt-get -y install php5-fpm php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl
	
	#PHP Configuration Stuff Goes Here
	service php5-fpm restart
	
	apt-get -y install fcgiwrap
	apt-get -y install phpmyadmin

	service php5-fpm restart
	service nginx restart

fi