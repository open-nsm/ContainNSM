# Tcpdump 3.9.7
#
# VERSION               1.1
FROM      opennsm/debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=tcpdump

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify program
ENV PROG tcpdump
# Specify source extension
ENV EXT tar.gz
# Specify Tcpdump version to download and install (e.g. 4.7.4)
ENV TVERS 3.9.7
# Specify Libpcap version to download and install (e.g. 1.7.4)
ENV LVERS 0.9.7
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
RUN wget http://www.tcpdump.org/release/libpcap-$LVERS.$EXT && tar -xvzf libpcap-$LVERS.$EXT
WORKDIR /home/$VIRTUSER/libpcap-$LVERS
RUN ./configure && make
USER root
RUN make install

# Compile and install tcpdump
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget http://www.tcpdump.org/release/$PROG-$TVERS.$EXT && tar -xvzf $PROG-$TVERS.$EXT
WORKDIR /home/$VIRTUSER/$PROG-$TVERS
RUN ./configure --prefix=$PREFIX && make
USER root
RUN make install
RUN chmod u+s $PREFIX/sbin/$PROG

# Cleanup
RUN rm -rf /home/$VIRTUSER/$PROG-$TVERS
RUN rm -rf /home/$VIRTUSER/libpcap-$LVERS

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
