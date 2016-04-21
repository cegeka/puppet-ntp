require 'spec_helper_acceptance'

describe 'ntp' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        class { '::ntp':
          ntp_servers => ['ntp.foo.tld'],
        }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file '/etc/ntp.conf' do
      it { is_expected.to be_file }
      its(:content) { should contain /ntp.foo.tld/ }
    end

  end
end

