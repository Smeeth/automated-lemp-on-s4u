## automated-lemp-on-s4u

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/29cb3d491a9e4fa3b6a252d32743079d)](https://www.codacy.com/app/Smeeth/automated-lemp-on-s4u?utm_source=github.com&utm_medium=referral&utm_content=Smeeth/automated-lemp-on-s4u&utm_campaign=badger)

My first try to get an automated installation for a LEMP-Stack on a dedicated server provided by server4you.de

This script will install fully automated the following packages preconfigured on your fresh Ubuntu 14.04 LTS installation on your dedicated server:

1. nginx
1. mysql
1. php5

Then it will apply some changes for sequrity reasons to `nginx.conf` in `/etc/nginx/` in order to make configration of vhosts easier later on. 


### How to apply
Just copy, paste and execute the following

	cd /tmp
	wget https://github.com/Smeeth/automated-lemp-on-s4u/raw/master/install.sh
	chmod +x install.sh
	./install.sh




### Credits and Thanks
The following guides helped me to figure out these things I made in this script:

* https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html
* https://github.com/dclardy64/ISPConfig-3-Debian-Installer
