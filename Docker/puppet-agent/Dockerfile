FROM debian:jessie
ARG server_name
ARG server_dns

ENV DEBIAN_FRONTEND=noninteractive

COPY run.sh /etc/puppetlabs/

RUN	awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list && \
	apt-get update && apt-get install -y --no-install-recommends openssh-server wget uuid-runtime && \
	apt-get install -y -t jessie-backports openjdk-8-jdk && \
	wget -O puppetlabs.deb https://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb && \
	dpkg -i puppetlabs.deb && \
	apt-get update && \
	apt-get install -y puppet-agent && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*  && \
	echo "server = $server_name" >> /etc/puppetlabs/puppet/puppet.conf && \
	echo "$nameserver $server_dns" >> /etc/resolv.conf && \
	chmod 775 /etc/puppetlabs/run.sh
	
CMD ["/etc/puppetlabs/run.sh"]