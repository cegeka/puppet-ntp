#!/usr/bin/env rspec

require 'spec_helper'

describe 'ntp' do
  it { should contain_class 'ntp' }
end
