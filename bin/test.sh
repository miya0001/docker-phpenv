#!/usr/bin/env bash

set -ex

sudo chown -R mysql:mysql /var/lib/mysql
sudo mysql_install_db --datadir=/var/lib/mysql --user=mysql
sudo service mysql start
