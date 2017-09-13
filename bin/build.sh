#!/usr/bin/env bash

set -ex

docker login --username=$DOCKER_USER --password=$DOCKER_PASS
docker pull ubuntu:14.04
docker build -t phpenv .
docker run -idt --cap-add=NET_ADMIN --name phpenv --privileged --volume="$(pwd)":/shared/:rw phpenv "/bin/bash"
