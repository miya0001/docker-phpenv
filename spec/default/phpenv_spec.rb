require 'spec_helper'

describe command('phpenv --version') do
  its(:exit_status) { should eq 0 }
end

describe command('eval "$(phpenv init -)" && phpenv global 5.2.17') do
  its(:exit_status) { should eq 0 }
end

describe command('eval "$(phpenv init -)" && php -v') do
  its(:exit_status) { should eq 0 }
  its(:stdout){ should match /5.2.17/ }
end

describe command('eval "$(phpenv init -)" && phpunit --version') do
  its(:exit_status) { should eq 2 }
  its(:stdout){ should match /PHPUnit @package_version@ by Sebastian Bergmann./ }
end

describe command('eval "$(phpenv init -)" && phpenv global 5.3.29') do
  its(:exit_status) { should eq 0 }
end

describe command('eval "$(phpenv init -)" && php --version') do
  its(:exit_status) { should eq 0 }
  its(:stdout){ should match /5.3.29/ }
end

describe command('eval "$(phpenv init -)" && phpunit --version') do
  its(:exit_status) { should eq 0 }
  its(:stdout){ should match /PHPUnit 4.8/ }
end

describe command('eval "$(phpenv init -)" && phpenv global 5.2.17') do
  its(:exit_status) { should eq 0 }
end

describe command('eval "$(phpenv init -)" && phpunit --version') do
  its(:exit_status) { should eq 2 }
  its(:stdout){ should match /PHPUnit @package_version@ by Sebastian Bergmann./ }
end
