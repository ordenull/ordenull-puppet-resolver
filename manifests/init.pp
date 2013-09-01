# == Class: resolver
#
# Manages the DNS resolver configuration file in /etc/resolv.conf
#
# === Parameters
#
# [nameservers]
#   default [ '4.2.2.1', '4.2.2.2' ]
#   Internet address (in dot notation) of a name server that
#   the resolver should query. Up to MAXNS (see <resolv.h> name 
#   servers may be listed, one per keyword. If there are multiple 
#   servers, the resolver library queries them in the order listed. 
#   If no nameserver entries are present, the default is to use 
#   the name server on the local machine. (The algorithm used is to 
#   try a name server, and if the query times out, try the next, 
#   until out of name servers, then repeat trying all the name 
#   servers until a maximum number of retries are made).
#
# [options]
#   default is none
#   Allows certain internal resolver variables to be modified.
#   please see the man page for resolv.conf for more details.
#
# [search]
#   default is none
#   Search list for host-name lookup. The search list is normally
#   determined from the local domain name; by default, it contains
#   only the local domain name. This may be changed by listing the
#   desired domain search path following the search keyword with 
#   spaces or tabs separating the names. Most resolver queries will
#   be attempted using each component of the search path in turn until
#   a match is found. Note that this process may be slow and will 
#   generate a lot of network traffic if the servers for the listed
#   domains are not local, and that queries will time out if no
#   server is available for one of the domains. The search list is
#   currently limited to six domains with a total of 256 characters.
#
# [domain]
#   default is none
#   Local domain name. Most queries for names within this domain
#   can use short names relative to the local domain. If no domain
#   entry is present, the domain is determined from the local host
#   name returned by gethostname(2); the domain part is taken to be
#   everything after the first `.' Finally, if the host name does
#   not contain a domain part, the root domain is assumed.
#
# [sortlist]
#   default is none
#   Allows addresses returned by gethostbyname to be sorted.
#   A sortlist is specified by IP address netmask pairs. The netmask
#   is optional and defaults to the natural netmask of the net.
#   The IP address and optional network pairs are separated by 
#   slashes. Up to 10 pairs may be specified. For example:
#   sortlist => [ '130.155.160.0/255.255.240.0', '130.155.0.0']
#
# === Variables
#
# === Examples
#
#  class { 'resolver':
#    nameservers => [ '4.2.2.1', '4.2.2.2' ]
#  }
#
#  class { 'resolver':
#    nameservers => [ '4.2.2.1', '4.2.2.2' ],
#    options     => [ 'rotate', 'timeout: 1' ],
#  }
#
#  class { 'resolver':
#    nameservers => [ '4.2.2.1', '4.2.2.2' ],
#    search      => [ 'energy.nist.gov', 'nist.gov' ],
#    options     => 'rotate',
#    domain      => 'nist.gov',
#  }
#
# === Authors
#
# Author Name <stan@borbat.com>
# Author Blog <http://stan.borbat.com>
#
# === Copyright
#
# Copyright 2013 Stan Borbat, unless otherwise noted.
#
class resolver (
  $nameservers = [ '4.2.2.1', '4.2.2.2' ],
  $options     = undef,
  $search      = undef,
  $domain      = undef,
  $sortlist    = undef,
) inherits resolver::params {

  file { $resolver::params::config_filename:
    ensure  => present,
    owner   => $resolver::params::config_owner,
    group   => $resolver::params::config_group,
    mode    => $resolver::params::config_mode,
    content => template('resolver/resolv.conf.erb'),
  }

}
