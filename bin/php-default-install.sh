#!/usr/bin/env bash

set -ex

sudo apt-get install php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-dev php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-gd php7.0-curl php7.0-zip php-imagick

curl -L https://getcomposer.org/installer | bash -- --install-dir=/usr/local/bin --filename=composer
