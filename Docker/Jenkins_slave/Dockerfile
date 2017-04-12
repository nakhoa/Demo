FROM debian:jessie

RUN awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list
RUN awk '$1 ~ "^deb" { $3 = "sid"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/sid.list

ENV MAVEN3_PACKAGE="apache-maven-3.2.2-bin.zip" \
	ANT1_8_PACKAGE="apache-ant-1.8.1-bin.zip" \
	JAVA8_PACKAGE="jdk-8u121-linux-x64.tar.gz" \
	DEBIAN_FRONTEND=noninteractive

RUN groupadd builder && \
	useradd -d /home/builder -s /bin/bash -m builder -u 1000 -g builder  && \
	echo builder:changeit | chpasswd && \
	mkdir -p /home/builder/soft
	
#copy tools
COPY $MAVEN3_PACKAGE $ANT1_8_PACKAGE $JAVA8_PACKAGE /home/builder/soft/

USER root
RUN	apt-get update && apt-get install -y --no-install-recommends openssh-server wget unzip && \
	rm -rf /var/lib/apt/lists/*  && \
	apt-get autoremove -y && apt-get clean && \
	mkdir -p /var/run/sshd && \
#extract tools & grant permission
	cd /home/builder/soft && \
	unzip $MAVEN3_PACKAGE && \
	unzip $ANT1_8_PACKAGE && \
	tar xvzf $JAVA8_PACKAGE && \
	rm -rf $MAVEN3_PACKAGE $ANT1_8_PACKAGE $JAVA8_PACKAGE && \
	chown -R builder.builder /home/builder/soft && \
	chmod a+x -R /home/builder/soft

CMD ip route | grep "default via" | awk '{print $3}' && /usr/sbin/sshd -D