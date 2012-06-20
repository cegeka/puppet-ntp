#!/usr/bin/env rspec

require 'spec_helper'

describe 'ntp' do
	
	let(:facts) { { :operatingsystem => 'redhat'} }

	let (:params) { { :ntp_servers => ['tik.cegeka.be', 'tak.cegeka.be'] } }

  it { should contain_class 'ntp' }
end
