#!/bin/bash
#1. grant user for slave in master
{{ mysql_basedir }}/bin/mysql -h {{mysql_master_ip}} -u {{ mysql_database_user }} -P {{ mysql_port }} -p{{ mysql_passwd }} -e "grant REPLICATION SLAVE on *.* to '{{ mysql_slave_user }}'@'%' identified by '{{ mysql_slave_passwd }}';"
{{ mysql_basedir }}/bin/mysql -h {{mysql_master_ip}} -u {{ mysql_database_user }} -P {{ mysql_port }} -p{{ mysql_passwd }} -e "flush privileges;"
