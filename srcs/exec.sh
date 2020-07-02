# install & update packages
apt-get update -y
apt-get upgrade -y
apt-get install wget -y
apt-get install nginx -y
apt-get install mariadb-server mariadb-client -y
apt-get install php-{mbstring,zip,gd,xml} -y

# nginx setup
# Nginx is to serve the content
service nginx restart

# mysql setup
# MySQL is to store and manage the data
service mysql start
mariadb

# the following is the command in mariadb
#	CREATE DATABASE example_database;
#	GRANT ALL ON example_database.* TO 'example_user'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
#	FLUSH PRIVILEGES;
#	exit

# mariadb -u example_user -p
#	SHOW DATABASES;	

# phpMyAdmin setup
# PHP is to process code and generate dynamic content for web server
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-english.tar.gz
tar xvf phpMyAdmin-4.9.5-english.tar.gz
mv phpMyAdmin-4.9.5-english/ /usr/share/phpmyadmin


# WordPress setup


