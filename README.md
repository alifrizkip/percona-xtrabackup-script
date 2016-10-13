# percona-xtrabackup-script

Create user mysql for xtrabackup :
```
CREATE USER 'xtrabackup'@'localhost' IDENTIFIED BY 'percona';
GRANT RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'xtrabackup'@'localhost';
FLUSH PRIVILEGES;
```
