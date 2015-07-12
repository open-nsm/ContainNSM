# Tcpdump 4.7.4
#
# VERSION               1.0
FROM      opennsm/debian:1.0
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify Tcpdump version to download and install (e.g. 4.7.4)
ENV TVERS 4.7.4
# Specify Libpcap version to download and install (e.g. 1.7.4)
ENV LVERS 1.7.4

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq make gcc flex bison libcap-ng-dev

USER $VIRTUSER
# Compile and install libpcap
WORKDIR /home/$VIRTUSER
RUN wget http://www.tcpdump.org/release/libpcap-$LVERS.tar.gz && tar -xvzf libpcap-$LVERS.tar.gz
WORKDIR /home/$VIRTUSER/libpcap-$VERS
RUN ./configure && make
USER root
RUN make install

# Compile and install tcpdump
WORKDIR /home/$VIRTUSER
RUN wget http://www.tcpdump.org/release/tcpdump-$TVERS.tar.gz && tar -xvzf tcpdump-$TVERS.tar.gz
WORKDIR /home/$VIRTUSER/tcpdump-$VERS
RUN ./configure && make
USER root
RUN make install

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
