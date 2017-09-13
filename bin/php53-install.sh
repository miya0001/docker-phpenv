#!/usr/bin/env bash

set -ex

export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

phpenv install 5.3.29
phpenv global 5.3.29
phpenv rehash
composer global require phpunit/phpunit
