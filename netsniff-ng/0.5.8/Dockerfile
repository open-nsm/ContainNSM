# Netsniff-NG
# VERSION               1.0
# docker run -it --privileged=true netsniff-ng:0.5.9 bash

FROM      debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify Netsniff-NG version to download and install (e.g. 0.5.8, 0.5.9-rc5)
ENV VERS 0.5.8

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -y git make ccache flex bison libnl-3-dev libnl-genl-3-dev libgeoip-dev libnetfilter-conntrack-dev libncurses5-dev liburcu-dev libnacl-dev libpcap-dev zlib1g-dev libcli-dev libnet1-dev
RUN apt-get install -y sudo telnet iptables vim emacs nano tcpdump gawk rsyslog
RUN apt-get install -y --no-install-recommends man-db

# User configuration
RUN adduser --disabled-password --gecos "" $VIRTUSER

# Compile and install netsniff-ng
RUN mkdir -p /usr/local/share/man/man8
USER opennsm
WORKDIR /home/$VIRTUSER
RUN git clone http://github.com/netsniff-ng/netsniff-ng
WORKDIR /home/$VIRTUSER/netsniff-ng
RUN git checkout v$VERS && ./configure && make
USER root
WORKDIR /home/$VIRTUSER/netsniff-ng
RUN make install

# Passwords
RUN echo "$VIRTUSER:$VIRTUSER" | chpasswd
RUN echo "root:opennsm" | chpasswd

# Sudo
RUN usermod -aG sudo $VIRTUSER
# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
