require 'spec_helper'

describe command('phpenv --version') do
  its(:exit_status) { should eq 0 }
end

describe command('eval "$(phpenv init -)" && php --version') do
  its(:exit_status) { should eq 0 }
end

describe command('eval "$(phpenv init -)" && phpunit --version') do
  its(:stdout) { should match /PHPUnit .+ by Sebastian Bergmann./ }
end
