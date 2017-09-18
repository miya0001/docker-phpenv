# docker-phpenv

[![Build Status](https://travis-ci.org/miya0001/docker-phpenv.svg?branch=master)](https://travis-ci.org/miya0001/docker-phpenv)

https://hub.docker.com/r/miya0001/phpenv/tags/

## What is installed

| Tag | PHP Version | PHPUnit Version |
|-----|-------------|-----------------|
| 5.2 | 5.2.17      | 3.6             |
| 5.3 | 5.3.29      | 4.8.36          |
| 5.4 | 5.4.31      | 4.8.36          |
| 5.5 | 5.5.38      | 4.8.36          |
| 5.6 | 5.6.31      | 5.7.21          |
| 7.0 | 7.0.23      | 6.3.0           |
| 7.1 | 7.1.9       | 6.3.0           |

## How to use

```
docker pull miya0001/phpenv
```

Or

```
docker pull miya0001/phpenv:<PHP_VERSION>
```

## How to switch PHP version

```
$ phpenv install 7.1.9
$ phpenv global 7.1.9
```

## Automated Testing

```
$ git clone https://github.com/miya0001/docker-phpenv
$ cd docker-phpenv
$ export PHP_VERSION=5.2
$ bash bin/build.sh
$ bundle install --path=vendor/bundle
$ bundle exec rake spec
```
