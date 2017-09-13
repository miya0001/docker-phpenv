#!/usr/bin/env bash

set -ex


if [[ "false" != "$TRAVIS_PULL_REQUEST" ]]; then
	echo "Not deploying pull requests."
	exit
fi

if [[ $TRAVIS_TAG ]]; then
  docker push miya/phpenv:$TRAVIS_TAG
fi
