# install & update packages
apt-get update -y
apt-get upgrade -y
apt-get install wget -y
apt-get install nginx -y
apt-apt install mariadb-server mariadb-client -y

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

# phpMyAdmin setup
# PHP is to process code and generate dynamic content for web server

#	SHOW DATABASES;	
