class { 'resolver':
   nameservers => [ '4.2.2.1', '4.2.2.2' ],
   search      => [ 'energy.nist.gov', 'nist.gov' ],
   options     => 'rotate',
   domain      => 'nist.gov',
}
