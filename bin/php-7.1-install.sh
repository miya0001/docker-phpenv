#!/usr/bin/env bash

set -ex

# Disable Xdebug
export PHP_BUILD_XDEBUG_ENABLE=off

eval "$(phpenv init -)"

phpenv install 7.1.9
phpenv global 7.1.9
phpenv rehash
composer global require phpunit/phpunit
