#!/usr/bin/env bash

set -ex

# Disable Xdebug
export PHP_BUILD_XDEBUG_ENABLE=off

eval "$(phpenv init -)"

phpenv install 5.4.31
phpenv global 5.4.31
phpenv rehash
composer global require phpunit/phpunit
