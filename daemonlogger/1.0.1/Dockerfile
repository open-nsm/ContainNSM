# Daemonlogger 1.0.1
#
# VERSION               1.0
FROM      opennsm/debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=daemonlogger

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify program
ENV PROG daemonlogger
# Specify source extension
ENV EXT tar.gz
# Specify version to download and install
ENV VERS 1.0.1
# Install directory
ENV PREFIX /opt
# Path should include prefix
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PREFIX/bin
 
# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq build-essential make gcc libpcap-dev --no-install-recommends

# Compile and install libdnet
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget --no-check-certificate http://iweb.dl.sourceforge.net/project/libdnet/libdnet/libdnet-1.11/libdnet-1.11.tar.gz && tar -zxf libdnet-1.11.tar.gz
WORKDIR /home/$VIRTUSER/libdnet-1.11
RUN ./configure && make
USER root
RUN make install

# Compile and install daemonlogger
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget --no-check-certificate http://old-releases.ubuntu.com/ubuntu/pool/universe/d/$PROG/${PROG}_$VERS.orig.$EXT && tar -zxf ${PROG}_$VERS.orig.$EXT
WORKDIR /home/$VIRTUSER/$PROG-$VERS
RUN ./configure --prefix=$PREFIX && make
USER root
RUN make install
RUN chmod u+s $PREFIX/bin/$PROG

# Cleanup
RUN rm -rf /home/$VIRTUSER/$PROG-$VERS
RUN rm -rf /home/$VIRTUSER/libdnet-1.11

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
