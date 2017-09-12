#!/usr/bin/env bash

set -ex

docker pull ubuntu:14.04
docker build -t phpenv .
docker run -idt --name phpenv --privileged --volume="$(pwd)":/shared/:rw phpenv "/bin/bash"
