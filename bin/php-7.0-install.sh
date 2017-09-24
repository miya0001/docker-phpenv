#!/usr/bin/env bash

set -ex

# Disable Xdebug
export PHP_BUILD_XDEBUG_ENABLE=off

eval "$(phpenv init -)"

phpenv install 7.0.23
phpenv global 7.0.23
phpenv rehash
composer global require phpunit/phpunit
