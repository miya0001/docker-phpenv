require 'spec_helper'

describe command('phpenv --version') do
  its(:exit_status) { should eq 0 }
end

describe command('eval "$(phpenv init -)" && php --version') do
  its(:exit_status) { should eq 0 }
end

describe command('eval "$(phpenv init -)" && phpunit --version') do
  its(:exit_status) { should eq 0 }
end

describe command('eval "$(phpenv init -)" && phpunit --version') do
  its(:exit_status) { should eq 0 }
end
