#!/bin/bash
set -e

echo "▶ Criando banco e usuário do Zabbix..."

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS zabbix
  CHARACTER SET utf8mb4
  collate utf8mb4_bin;

CREATE USER IF NOT EXISTS '$MYSQL_ZBX_USER'@'%'
  IDENTIFIED BY '$MYSQL_ZBX_PASSWORD';

GRANT ALL PRIVILEGES ON zabbix.* TO '$MYSQL_ZBX_USER'@'%';

SET GLOBAL log_bin_trust_function_creators = 1;

FLUSH PRIVILEGES;
EOF