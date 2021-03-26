DROP DATABASE IF EXISTS iwa_dev;
CREATE DATABASE iwa_dev;
DROP USER IF EXISTS iwa_dev;
CREATE USER 'iwa_dev'@'%' IDENTIFIED BY 'iwa_dev';
GRANT ALL PRIVILEGES ON iwa_dev.* TO 'iwa_dev'@'%';