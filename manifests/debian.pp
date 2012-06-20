class ntp::debian {

  package { [ 'ntpdate', 'ntp' ] :
    ensure => present,
  }

  file { '/etc/ntp.conf' :
    ensure  => file,
    source  => "puppet:///modules/${module_name}/ntp.conf",
    require => Package['ntp'],
  }

  service { 'ntp' :
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => [ Package['ntp'], File['/etc/ntp.conf'] ],
  }

}
