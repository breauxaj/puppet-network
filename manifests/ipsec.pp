define network::ipsec (
  $destination,
  $spiespin,
  $spiahin,
  $spiespout,
  $spiahout,
  $interface = '0',
  $onboot = 'yes',
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'network',
  }

  $prefix = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ =>
      '/etc/sysconfig/network-scripts',
  }

  file { "${prefix}/ifcfg-ipsec${interface}.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$service],
    content => template('network/ifcfg-ipsec.erb'),
  }

}
