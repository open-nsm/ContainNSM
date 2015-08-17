# Suricata 1.0.0
#
# VERSION               1
FROM      opennsm/debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=suricata
# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify program
ENV PROG suricata
# Specify Suricata version to download and install (e.g. 1.0.0)
ENV VERS 1.0.0
# Install directory 
ENV PREFIX /opt
# Path should include prefix
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PREFIX/bin

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq libpcre3 libpcre3-dbg libpcre3-dev \
build-essential autoconf automake libtool libpcap-dev libnet1-dev \
libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libmagic-dev libcap-ng-dev \
libjansson-dev pkg-config libnetfilter-queue-dev

# Compile and install libpcap
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget http://www.openinfosecfoundation.org/download/$PROG-$VERS.tar.gz
RUN tar -xvzf $PROG-$VERS.tar.gz
WORKDIR /home/$VIRTUSER/$PROG-$VERS
RUN ./configure --enable-nfqueue --prefix=$PREFIX --sysconfdir=/etc --localstatedir=/var && make
USER root
RUN make install
RUN chmod u+s $PREFIX/bin/$PROG

# Cleanup
RUN rm -f /home/$VIRTUSER/$PROG-$VERS.tar.gz

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
