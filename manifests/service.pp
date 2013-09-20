define network::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'network',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
