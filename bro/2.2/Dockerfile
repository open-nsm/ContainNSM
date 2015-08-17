# Bro Sandbox - Bro 2.2
#
# VERSION               1.4
FROM      opennsm/debian
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
ENV VERS 2.2
# Install directory
ENV PREFIX /opt/bro
# Path should include prefix
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PREFIX/bin

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq build-essential cmake make gcc g++ flex bison libpcap-dev libgeoip-dev libssl-dev python-dev zlib1g-dev libmagic-dev swig2.0 ca-certificates --no-install-recommends

# Compile and install bro
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget --no-check-certificate http://www.bro.org/downloads/archive/$PROG-$VERS.$EXT && tar -xzf $PROG-$VERS.$EXT
WORKDIR /home/$VIRTUSER/$PROG-$VERS
RUN ./configure --prefix=$PREFIX && make
USER root
RUN make install
RUN chmod u+s $PREFIX/bin/$PROG
RUN chmod u+s $PREFIX/bin/broctl
RUN chmod u+s $PREFIX/bin/capstats

# Cleanup
RUN rm -rf /home/$VIRTUSER/$PROG-$VERS

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
