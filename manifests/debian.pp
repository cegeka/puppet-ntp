class ntp::debian {

  package { [ 'ntpdate', 'ntp' ] :
    ensure => present,
  }

  file { '/etc/ntp.conf' :
    ensure  => file,
    content => template("${module_name}/ntp.conf.erb"),
    require => Package['ntp'],
  }

  service { 'ntp' :
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => [ Package['ntp'], File['/etc/ntp.conf'] ],
  }

}
