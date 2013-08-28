class network {

}

class network::service ( $ensure,
                         $enable ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'network',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }
}

define network::ipsec ( $interface = '0',
                        $destination,
                        $onboot = 'yes',
                        $spiespin,
                        $spiahin,
                        $spiespout,
                        $spiahout ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'network',
  }

  $prefix = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/sysconfig/network-scripts',
  }

  file { "$prefix/ifcfg-ipsec$interace.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$service],
    content => template('network/ifcfg-ipsec.erb'),
  }

}
