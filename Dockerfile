FROM debian:buster

# install & update packages
RUN apt-get -y update
RUN apt-get -y upgrade 
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3 php-mbstring php-mysql php-fpm
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-english.tar.gz

# phpmyadmin setup
RUN tar xvf phpMyAdmin-4.9.5-english.tar.gz
RUN rm -rf phpMyAdmin-4.9.5-english.tar.gz
RUN mv phpMyAdmin-4.9.5-english /var/www/html/phpmyadmin

# copy configuration files
COPY ./srcs/setup.sql /tmp/
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
COPY ./srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php

# mysql setup
RUN service mysql start
#RUN mysql -u root mysql < /tmp/setup.sql

# nginx setup
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

