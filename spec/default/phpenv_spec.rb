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

describe command('eval "$(phpenv init -)" && phpenv global 7.1.9') do
  its(:exit_status) { should eq 0 }
end

describe command('eval "$(phpenv init -)" && php --version') do
  its(:exit_status) { should eq 0 }
  its(:stdout){ should match /7.1.9/ }
end
