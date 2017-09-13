#!/usr/bin/env bash

set -ex

MYSQL_PASS=1111

echo "mysql-server mysql-server/root_password password $MYSQL_PASS" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_PASS" | sudo debconf-set-selections
sudo apt-get install -y mysql-server

sudo chown -R mysql:mysql /var/lib/mysql
sudo mysql_install_db --datadir=/var/lib/mysql --user=mysql
sudo service mysql start
