require 'spec_helper'

describe command('su - ci -c "env | grep GEM_HOME"') do
  it { should return_exit_status 1 }
end

describe command('su - ci -c "env | grep GEM_PATH"') do
  it { should return_exit_status 1 }
end
