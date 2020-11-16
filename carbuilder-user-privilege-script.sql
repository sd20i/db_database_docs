CREATE USER 'backend'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON * . * TO 'backend'@'localhost';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'backend'@'localhost';
REVOKE DROP ON * . * FROM 'backend'@'localhost';