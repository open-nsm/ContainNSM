# Bro Sandbox - Bro 1.5
#
# VERSION               1.4
FROM      opennsm/debian:squeeze
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=bro

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify program
ENV PROG bro
# Specify source extension
ENV EXT tar.gz
# Specify Bro version to download and install (e.g. bro-2.3.1, bro-2.4)
ENV VERS 1.5
# Install directory
ENV PREFIX /opt/bro
# Path should include prefix
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PREFIX/bin

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq build-essential cmake make gcc g++ flex bison libpcap-dev libgeoip-dev libcurl4-openssl-dev libncurses5-dev python-dev zlib1g-dev libmagic-dev swig file libmagic-dev ca-certificates --no-install-recommends

# Compile and install bro
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget --no-check-certificate http://www.bro.org/downloads/archive/$PROG-$VERS.$EXT && tar -xzf $PROG-$VERS.$EXT
WORKDIR /home/$VIRTUSER/$PROG-$VERS
# Was not able to get broctl to build
RUN ./configure --disable-broctl --prefix=$PREFIX
RUN make
USER root
RUN make install

# Cleanup
RUN rm -rf /home/$VIRTUSER/$PROG-$VERS

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
