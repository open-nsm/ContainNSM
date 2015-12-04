# Netsniff-NG
# VERSION               0.1
# docker run -it --privileged=true netsniff-ng:0.6.0 bash

FROM       opennsm/debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=netsniff-ng

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify Netsniff-NG version to download and install (e.g. 0.5.8, 0.5.9-rc5)
ENV VERS 0.6.0
ENV DST /usr/local/sbin

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -y gcc make ccache flex bison libnl-3-dev libnl-genl-3-dev libnl-route-3-dev libgeoip-dev libnetfilter-conntrack-dev libncurses5-dev liburcu-dev libnacl-dev libpcap-dev zlib1g-dev libcli-dev libnet1-dev man-db --no-install-recommends
# Extra for included tools
RUN apt-get install -y telnet iptables

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
RUN flowtop --update || true
RUN chmod u+s $DST/netsniff-ng
RUN chmod u+s $DST/flowtop
RUN chmod u+s $DST/trafgen
RUN chmod u+s $DST/mausezahn
RUN chmod u+s $DST/astraceroute

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
