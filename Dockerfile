FROM debian:buster

# install & update packages
RUN apt-get -y update
RUN apt-get -y upgrade 
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php-mbstring php-mysql

# phpmyadmin setup
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-english.tar.gz
RUN tar xvf phpMyAdmin-4.9.5-english.tar.gz && rm -rf phpMyAdmin-4.9.5-english.tar.gz

CMD bash 