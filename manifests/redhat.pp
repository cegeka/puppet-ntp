class ntp::redhat {

  $package_list = $::operatingsystemrelease ? {
                    /^5.*$/ => ['ntp'],
                    /^6.*$/ => ['ntp', 'ntpdate'],
                    /^7.*$/ => ['ntp', 'ntpdate'],
  }

  package { $package_list :
    ensure => present,
  }

  file { '/etc/ntp.conf' :
    ensure  => file,
    content => template("${module_name}/ntp.conf.erb"),
    require => Package['ntp'],
    notify  => Service['ntpd']
  }

  service { 'ntpd' :
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => [ Package['ntp'], File['/etc/ntp.conf'] ],
  }

}
