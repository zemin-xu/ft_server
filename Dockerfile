FROM debian:buster

# install & update packages
RUN apt-get -y update
RUN apt-get -y upgrade 
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3 php-mbstring php-mysql php-fpm

# copy configuration files
COPY ./srcs/setup.sql /tmp/

# mysql setup
RUN service mysql start
RUN mysql -u root mysql < /tmp/setup.sql



# phpmyadmin setup
#RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-english.tar.gz
#RUN tar xvf phpMyAdmin-4.9.5-english.tar.gz && rm -rf phpMyAdmin-4.9.5-english.tar.gz
#RUN mv phpMyAdmin-4.9.5-english/ /usr/share/phpmyadmin
#RUN ln -s /etc/nginx/sites-available/phpmyadmin /etc/nginx/sites-enabled/
#RUN ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
#COPY ./srcs/config.inc.php 
