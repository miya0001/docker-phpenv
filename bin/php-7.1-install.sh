#!/usr/bin/env bash

set -ex

# Disable Xdebug
export PHP_BUILD_XDEBUG_ENABLE=off

export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

phpenv install 7.1.9
phpenv global 7.1.9
phpenv rehash
composer global require phpunit/phpunit
