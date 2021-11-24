#!/bin/bash

mysql=/usr/local/mysql/bin/mysql
master_ip=192.168.47.160
repl_user=repl
repl_pass=repl123!
log_file=$(mysql -u$repl_user -p$repl_pass -h$master_ip -e 'show master status;'| grep mysql_bin|awk '{print $1}')
log_pos=$(mysql -u$repl_user -p$repl_pass -h$master_ip -e 'show master status;'| grep mysql_bin|awk '{print $2}')

$mysql -e "change master to MASTER_HOST='$master_ip',MASTER_USER='$repl_user',MASTER_PASSWORD='$repl_pass',MASTER_LOG_FILE='$log_file',MASTER_LOG_POS=$log_pos;start slave;show slave status\G"
