# Tcpdump 3.6.1
#
# VERSION               1.1
FROM      opennsm/debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=tcpdump

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify Tcpdump version to download and install (e.g. 4.7.4)
ENV TVERS 3.6.1
# Specify Libpcap version to download and install (e.g. 1.7.4)
ENV LVERS 0.6.1
# Install directory
ENV PREFIX /opt
# Path should include prefix
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PREFIX/sbin

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq make gcc flex bison libcap-ng-dev

# Compile and install libpcap
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget http://www.tcpdump.org/release/libpcap-$LVERS.tar.gz && tar -xvzf libpcap-$LVERS.tar.gz
WORKDIR /home/$VIRTUSER/libpcap-$LVERS
RUN ./configure --prefix=$PREFIX && make
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
