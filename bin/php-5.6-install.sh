#!/usr/bin/env bash

set -ex

# Disable Xdebug
export PHP_BUILD_XDEBUG_ENABLE=off

export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

phpenv install 5.6.31 | pv
phpenv global 5.6.31
phpenv rehash
composer global require phpunit/phpunit
