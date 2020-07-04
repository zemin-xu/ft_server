CREATE DATABASE wordpressDB;

CREATE USER 'root'@'localhost' identified by 'password';

GRANT ALL PRIVILEGES ON wordpressDB.* TO 'root'@'localhost';

FLUSH PRIVILEGES;

EXIT;