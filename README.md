# percona-xtrabackup-script

Create user mysql for xtrabackup :
```
CREATE USER 'backup'@'localhost' IDENTIFIED BY 'backup';
GRANT RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'backup'@'localhost';
FLUSH PRIVILEGES;
```

Put in crontab :
`0 1 * * * bash /root/backup/xtrabackup.sh`
