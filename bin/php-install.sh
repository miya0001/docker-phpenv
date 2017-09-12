#!/usr/bin/env bash

set -ex

# Builds and installs PHP 5.2
phpenv install 5.2.17 | pv -t
phpenv global 5.2.17

# Builds phpunit v3.6 for PHP 5.2
# See https://github.com/sebastianbergmann/phpunit/tree/3.5#using-phpunit-from-a-git-checkout
sudo mkdir -p /usr/local/src/phpunit
sudo chown $(whoami):$(whoami) /usr/local/src/phpunit
cd /usr/local/src/phpunit
git clone git://github.com/sebastianbergmann/phpunit.git
git clone git://github.com/sebastianbergmann/dbunit.git
git clone git://github.com/sebastianbergmann/php-file-iterator.git
git clone git://github.com/sebastianbergmann/php-text-template.git
git clone git://github.com/sebastianbergmann/php-code-coverage.git
git clone git://github.com/sebastianbergmann/php-token-stream.git
git clone git://github.com/sebastianbergmann/php-timer.git
git clone git://github.com/sebastianbergmann/phpunit-mock-objects.git
git clone git://github.com/sebastianbergmann/phpunit-selenium.git

cd phpunit && git checkout 3.6 && cd ..
cd dbunit && git checkout 1.1 && cd ..
cd php-file-iterator && git checkout tags/1.3.2 && cd ..
cd php-code-coverage && git checkout 1.1 && cd ..
cd php-token-stream && git checkout tags/1.1.4 && cd ..
cd php-text-template && git checkout tags/1.1.1 && cd ..
cd php-timer && git checkout tags/1.0.3 && cd ..
cd phpunit-mock-objects && git checkout 1.1 && cd ..
cd phpunit-selenium && git checkout 1.1 && cd ..

cat << EOL > $HOME/.phpenv/versions/5.2.17/bin/phpunit
#!/bin/sh

php -d include_path='.:/usr/local/src/phpunit/phpunit/:/usr/local/src/phpunit/dbunit/:/usr/local/src/phpunit/php-code-coverage/:/usr/local/src/phpunit/php-file-iterator/:/usr/local/src/phpunit/php-invoker/:/usr/local/src/phpunit/php-text-template/:/usr/local/src/phpunit/php-timer:/usr/local/src/phpunit/php-token-stream:/usr/local/src/phpunit/phpunit-mock-objects/:/usr/local/src/phpunit/phpunit-selenium/:/usr/local/src/phpunit/phpunit-story/:/usr/local/lib/php' /usr/local/src/phpunit/phpunit/phpunit.php $*
EOL

chmod 755 $HOME/.phpenv/versions/5.2.17/bin/phpunit


phpenv install 7.1.9 | pv -t
