FROM debian:buster

# install & update packages
RUN apt-get -y update
RUN apt-get -y upgrade 
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3 php-mbstring php-mysql php-fpm
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-english.tar.gz
RUN wget https://wordpress.org/latest.tar.gz


# phpmyadmin setup
RUN tar xvf phpMyAdmin-4.9.5-english.tar.gz
RUN rm -rf phpMyAdmin-4.9.5-english.tar.gz
RUN mv phpMyAdmin-4.9.5-english /var/www/html/phpmyadmin

# wordpress setup
RUN tar -xvzf latest.tar.gz
RUN rm -rf latest.tar.gz
RUN mv wordpress /var/www/html/wordpress

# copy configuration files
COPY ./srcs/setup.sql /tmp/
COPY ./srcs/restart_services.sh /tmp/
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
COPY ./srcs/wordpress.conf /etc/nginx/sites-available/wordpress.conf
COPY ./srcs/config.inc.php /var/www/html/phpmyadmin
COPY ./srcs/wp-config.php /var/www/html/wordpress/wp-config.php

# nginx setup
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

# mysql setup
RUN service mysql start && mysql -u root mysql < /tmp/setup.sql

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=sdunckel' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

# change permission
WORKDIR /var/www/html/
RUN chown -R www-data:www-data *
RUN chmod 755 -R *

RUN bash /tmp/restart_services.sh

EXPOSE 80 443