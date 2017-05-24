#! /bin/bash

apt-get update
/opt/puppetlabs/bin/puppet agent -t
tail -f /dev/null
