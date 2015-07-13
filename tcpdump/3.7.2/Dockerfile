# Tcpdump 0.7.2
#
# VERSION               1.0
FROM      opennsm/debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify Tcpdump version to download and install (e.g. 4.7.4)
ENV TVERS 3.7.2
# Specify Libpcap version to download and install (e.g. 1.7.4)
ENV LVERS 0.7.2

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq make gcc flex bison libcap-ng-dev

# Compile and install libpcap
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget http://www.tcpdump.org/release/libpcap-$LVERS.tar.gz && tar -xvzf libpcap-$LVERS.tar.gz
WORKDIR /home/$VIRTUSER/libpcap-$LVERS
RUN ./configure && make
USER root
RUN make install

# Compile and install tcpdump
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget http://www.tcpdump.org/release/tcpdump-$TVERS.tar.gz && tar -xvzf tcpdump-$TVERS.tar.gz
WORKDIR /home/$VIRTUSER/tcpdump-$TVERS
RUN ./configure && make
USER root
RUN make install

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
