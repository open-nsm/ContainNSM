# Netsniff-NG
# VERSION               1.1
# docker run -it --privileged=true netsniff-ng:0.5.9 bash

FROM       opennsm/debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=netsniff-ng

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify Netsniff-NG version to download and install (e.g. 0.5.8, 0.5.9-rc5)
ENV VERS 0.5.8

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -y make ccache flex bison libnl-3-dev libnl-genl-3-dev libgeoip-dev libnetfilter-conntrack-dev libncurses5-dev liburcu-dev libnacl-dev libpcap-dev zlib1g-dev libcli-dev libnet1-dev
RUN apt-get install -y telnet iptables tcpdump
RUN apt-get install -y --no-install-recommends man-db

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

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
