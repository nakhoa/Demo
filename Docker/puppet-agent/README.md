Please provide server_name & server_dns when you build image:
	docker build --build-arg server_name=${puppet_server} --build-arg server_dns=${dns_server} -t puppet-agent:1.00 .
Please provide hostname when you run image as container: 
	docker run --privileged  --name puppet-agent-1 --hostname puppet-client1.localdomain  puppet-agent:1.00
If your container cannot connect to puppetserver because of it cannot resolve hostname, please provide --add-host parameter:
	docker run --privileged  --name puppet-agent-1 --hostname puppet-client1.localdomain --add-host=${puppet_server}:${server_IP}  puppet-agent:1.00