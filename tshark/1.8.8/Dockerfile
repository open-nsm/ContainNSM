# Tshark 1.8.8
#
# VERSION               1
# NOTES:
# You must have libtool 1.4 or later installed to compile Wireshark
# docker run --cap-add net_raw --cap-add net_admin -it opennsm/tshark:1.8.8 tshark -i eth0
FROM      opennsm/debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=tshark

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify program
ENV PROG wireshark
# Specify source extension
ENV EXT tar.bz2
# Specify Tshark version to download and install
ENV VERS 1.8.8
# Specific Libtool to download and install
ENV LIBTOOL libtool-2.4.2
# Install directory
ENV PREFIX /opt
# Path should include prefix
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PREFIX/bin

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq build-essential autoconf automake libtool bison flex \
  libpcap-dev libglib2.0-dev libgeoip-dev libkrb5-dev libgnutls-dev \
  libgcrypt-dev libcap-dev libsmi-dev libc-ares-dev --no-install-recommends
RUN  wget --no-check-certificate https://ftp.gnu.org/gnu/libtool/$LIBTOOL.tar.gz
RUN tar zxf $LIBTOOL.tar.gz && cd $LIBTOOL && ./configure && make && make install

# Compile and install libpcap
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget --no-check-certificate https://www.wireshark.org/download/src/all-versions/$PROG-$VERS.$EXT
RUN tar -jxf $PROG-$VERS.$EXT
WORKDIR /home/$VIRTUSER/$PROG-$VERS
RUN ./autogen.sh && ./configure --disable-wireshark --enable-profile-build --prefix=/opt \
 CFLAGS="-I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include" && \
 make CFLAGS="-fPIC -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include"
USER root
RUN make install
RUN chmod u+s $PREFIX/bin/tshark
RUN chmod u+s $PREFIX/bin/dumpcap
RUN chmod u+s $PREFIX/bin/rawshark

# Cleanup
RUN rm -rf /home/$VIRTUSER/$PROG-$VERS
RUN rm -rf /root/$LIBTOOL*

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
