CREATE DATABASE wordpressDB;

CREATE USER 'root'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON wordpressDB.* TO 'root'@'localhost';

FLUSH PRIVILEGES;

CREATE USER 'zemin'@'localhost' IDENTIFIED BY 'pass';

GRANT ALL PRIVILEGES ON wordpressDB.* TO 'zemin'@'localhost';

FLUSH PRIVILEGES;

EXIT;