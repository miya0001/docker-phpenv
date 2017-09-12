# docker-phpenv

[![Build Status](https://travis-ci.org/miya0001/docker-phpenv.svg?branch=master)](https://travis-ci.org/miya0001/docker-phpenv)

## How to switch PHP version

```
$ phpenv install 7.1.9
$ phpenv global 7.1.9
```

## Automated Testing

```
$ git clone https://github.com/miya0001/docker-phpenv
$ cd docker-phpenv
$ bash bin/build.sh
$ bundle install --path=vendor/bundle
$ bundle exec rake spec
```
