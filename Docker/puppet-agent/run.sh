#! /bin/bash
apt-get update
export mycertname="`cat /etc/puppetlabs/puppet/puppet.conf | grep "certname"`"
if [ -z "$mycertname" ]; then
	echo "certname = `uuidgen -r`.`dnsdomainname`" >> /etc/puppetlabs/puppet/puppet.conf
fi
/opt/puppetlabs/bin/puppet agent -t
tail -f /dev/null
