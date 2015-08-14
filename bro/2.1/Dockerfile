# Bro Sandbox - Bro 2.1
#
# VERSION               1.3
FROM      debian:squeeze
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=bro

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify Bro version to download and install (e.g. bro-2.3.1, bro-2.4)
ENV VERS bro-2.1
# Place to install bro
ENV DST /opt/bro
# Install directory
ENV PREFIX /opt
# Path should include prefix
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PREFIX/bro/bin

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq build-essential cmake make gcc g++ flex bison libpcap-dev libgeoip-dev libcurl4-openssl-dev libncurses5-dev python-dev zlib1g-dev libmagic-dev swig file ca-certificates --no-install-recommends

# Compile and install bro
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget http://www.bro.org/downloads/archive/$VERS.tar.gz && tar -xvzf $VERS.tar.gz
WORKDIR /home/$VIRTUSER/$VERS
RUN ./configure --prefix=$PREFIX && make
USER root
RUN make install

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
