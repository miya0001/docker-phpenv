#!/usr/bin/env bash

set -ex

MYSQL_PASS=1111

sudo apt-get update -y

sudo apt-get install -y git build-essential jq subversion curl libxml2-dev libssl-dev libsslcommon2-dev libcurl4-openssl-dev libbz2-dev libpng-dev libmysqlclient-dev libltdl-dev libtidy-dev libxslt-dev libicu-dev autoconf bison unzip

# Install MySQL
echo "mysql-server mysql-server/root_password password $MYSQL_PASS" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_PASS" | sudo debconf-set-selections
sudo apt-get install -y mysql-server
sudo service mysql stop

# Installs phpenv
curl -L https://raw.github.com/CHH/phpenv/master/bin/phpenv-install.sh | bash

echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(phpenv init -)"' >> ~/.bashrc

export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

# Installs plugins for phpenv
curl -L http://git.io/phpenv-installer | bash
git clone https://github.com/ngyuki/phpenv-composer.git "$(phpenv root)/plugins/phpenv-composer"

phpenv rehash

# Installs dependencies for PHP
phpenv common-deps-install-ubuntu-14-04

echo '--with-libdir=lib/x86_64-linux-gnu' >> $HOME/.phpenv/plugins/php-build/share/php-build/default_configure_options
