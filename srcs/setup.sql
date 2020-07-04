CREATE DATABASE wordpressDB;

CREATE USER 'root'@'localhost' identified by 'password';

GRANT ALL PRIVILEGES ON wordpressDB.* TO 'root'@'localhost';

FLUSH PRIVILEGES;

CREATE USER 'zemin'@'localhost' identified by '123456';

GRANT ALL PRIVILEGES ON wordpressDB.* TO 'zemin'@'localhost';

FLUSH PRIVILEGES;

EXIT;