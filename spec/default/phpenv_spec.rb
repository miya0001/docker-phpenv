require 'spec_helper'

describe command('phpenv --version') do
    its(:exit_status) { should eq 0 }
end
