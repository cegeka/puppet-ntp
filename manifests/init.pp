# Class: ntp
#
# This module manages ntp
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class ntp($ntp_servers) {

  case $::operatingsystem {
    redhat, centos : { include ntp::redhat }
    debian, ubuntu : { include ntp::debian }
    default : {}
  }

}
