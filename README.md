# percona-xtrabackup-script

Create user mysql for xtrabackup :
```
CREATE USER 'xtrabackup'@'localhost' IDENTIFIED BY 'percona';
GRANT RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'xtrabackup'@'localhost';
FLUSH PRIVILEGES;
```

Put in crontab :
`0 1 * * * bash /root/backup/xtrabackup.sh`
