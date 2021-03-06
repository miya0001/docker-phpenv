#!/usr/bin/env bash

set -ex

docker login --username=$DOCKER_USER --password=$DOCKER_PASS
docker pull ubuntu:14.04
docker build -t miya0001/phpenv:${PHP_VERSION} --build-arg PHP_VERSION=$PHP_VERSION .
docker run -idt --name phpenv --privileged --volume="$(pwd)":/shared/:rw miya0001/phpenv:${PHP_VERSION} "/bin/bash"
