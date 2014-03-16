network
=======

Mostly to wrap up ipsec interface configuration.

http://kadorto.blogspot.com/2011/04/linux-host-to-host-ipsec.html

Samples
-------
```
include network
```
```
network::ipsec { 'local':
  interface   => '0',
  destination => '192.168.1.20',
  onboot      => 'yes',
  spiespin    => '9180000',
  spiahin     => '8008135',
  spiesput    => '5550100',
  spiahout    => '8675309',
}
```
```
network::ipsec { 'remote':
  interface   => '0',
  destination => '192.168.1.10',
  onboot      => 'yes',
  spiespin    => '5550100',
  spiahin     => '8675309',
  spiesput    => '9180000',
  spiahout    => '8008135',
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
