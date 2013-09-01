# ordenull-resolver

## Overview

This module manages the Linux DNS resolver configuration. For ease of use, 
all resolver options can be specified in singular or array forms.
`nameservers => '192.168.1.1'` has the same effect as `nameservers => ['192.168.1.1']`

* `resolver` : Class to manage resolv.conf
* `resolver::params` : Parameters for the resolv.conf location and mode


## Examples

Specify a single name server :

    class { 'resolver':
      nameservers => '192.168.1.1'
    }

Specify multiple name servers :

    class { 'resolver':
      nameservers => [ '4.2.2.1', '4.2.2.2' ]
    }

Specify two name servers and add resolver options :

    class { 'resolver':
      nameservers => [ '4.2.2.1', '4.2.2.2' ],
      options     => [ 'rotate', 'timeout: 1' ],
    }

Specify multiple name servers, a domain, a list of search domains and one option :

    class { 'resolver':
      nameservers => [ '4.2.2.1', '4.2.2.2' ],
      search      => [ 'energy.nist.gov', 'nist.gov' ],
      options     => 'rotate',
      domain      => 'nist.gov',
    }

##Copyright and License

Copyright (C) 2013 [Stan Borbat](http://stan.borbat.com)

Stan Borbat can be contacted at: stan@borbat.com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
