#!/usr/bin/env bash

set -ex

sudo apt-get update -y

sudo apt-get install -y git build-essential jq subversion curl libxml2-dev libssl-dev libsslcommon2-dev libcurl4-openssl-dev libbz2-dev libpng-dev libmysqlclient-dev libltdl-dev libtidy-dev libxslt-dev libicu-dev autoconf bison

# Installs phpenv
curl -L https://raw.github.com/CHH/phpenv/master/bin/phpenv-install.sh | bash

echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(phpenv init -)"' >> ~/.bashrc

export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

# Installs plugins for phpenv
git clone git://github.com/CHH/php-build.git "$(phpenv root)/plugins/php-build"
git clone https://github.com/rogeriopradoj/phpenv-common-deps-install.git "$(phpenv root)/plugins/phpenv-common-deps-install"
git clone https://github.com/ngyuki/phpenv-composer.git "$(phpenv root)/plugins/phpenv-composer"

phpenv rehash

# Disable Xdebug
chmod 600 $(phpenv root)/plugins/php-build/share/php-build/plugins.d/xdebug.sh

# Installs dependencies for PHP
phpenv common-deps-install-ubuntu-14-04

echo '--with-libdir=lib/x86_64-linux-gnu' >> $HOME/.phpenv/plugins/php-build/share/php-build/default_configure_options
