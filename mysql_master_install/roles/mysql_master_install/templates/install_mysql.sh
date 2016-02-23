#!/bin/bash
\cp /tmp/my.cnf {{ mysql_datadir }}/my.cnf
chown -R {{ mysql_user }}:{{ mysql_user }} {{ mysql_datadir }} {{ mysql_basedir }}
###init mysql db###"
{{ mysql_basedir }}/scripts/mysql_install_db --defaults-file={{ mysql_datadir }}/my.cnf --basedir={{ mysql_basedir }} --datadir={{ mysql_datadir }} --user={{ mysql_user }} >> /dev/null 2>&1 &
sleep 5
/etc/init.d/mysqld start &
sleep 10
ln -sf {{ mysql_basedir }}/bin/mysql /usr/bin/mysql
ln -sf {{ mysql_sock }} /tmp/mysql.sock
chkconfig --add mysqld
check_mysql=$(ps aux|grep mysql|grep -v grep|grep -v ansible|wc -l)
