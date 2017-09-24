#!/usr/bin/env bash

set -ex

# Disable Xdebug
export PHP_BUILD_XDEBUG_ENABLE=off

eval "$(phpenv init -)"

phpenv install 5.3.29
phpenv global 5.3.29
phpenv rehash
composer global require phpunit/phpunit
