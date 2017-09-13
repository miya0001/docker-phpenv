#!/usr/bin/env bash

set -ex

pv | phpenv install 7.1.9
phpenv global 7.1.9
phpenv rehash
composer global require phpunit/phpunit
