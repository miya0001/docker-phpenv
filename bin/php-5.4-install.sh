#!/usr/bin/env bash

set -ex

# Disable Xdebug
export PHP_BUILD_XDEBUG_ENABLE=off

export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

pv | phpenv install 5.4.31
phpenv global 5.4.31
phpenv rehash
composer global require phpunit/phpunit
