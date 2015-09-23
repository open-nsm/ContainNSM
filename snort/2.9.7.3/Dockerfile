# Snort 2.9.7.5
#
# VERSION               1
FROM opennsm/debian
MAINTAINER Mike Downey <michael.downey01@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=snort

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify program
ENV PROG snort
# Specify source extension
ENV EXT tar.gz
# Specify Snort version to download and install
ENV VERS 2.9.7.3
# Specific libpcap to download and install
ENV LVERS libpcap-1.7.4
# Specific libdnet to download and install
ENV LDVERS libdnet-1.12
# Specific daq to download and install
ENV DVERS daq-2.0.6
# Install directory
ENV PREFIX /opt
# Path should include prefix
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PREFIX/bin

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq build-essential libpcre3-dev \
  bison flex zlib1g-dev autoconf libtool --no-install-recommends

# Compile and install libpcap
RUN wget http://www.tcpdump.org/release/$LVERS.$EXT
RUN tar zxf $LVERS.$EXT && cd $LVERS && ./configure --prefix=/usr && make && make install

# Compile and install libdnet
RUN wget http://libdnet.googlecode.com/files/$LDVERS.tgz
RUN tar zxf $LDVERS.tgz && cd $LDVERS && ./configure --prefix=/usr --enable-shared && make && make install
RUN echo >> /etc/ld.so.conf /usr/lib && echo >> /etc/ld.so.conf /usr/local/lib

# Compile and install daq
RUN wget --no-check-certificate https://www.snort.org/downloads/snort/$DVERS.$EXT
RUN tar zxf $DVERS.$EXT && cd $DVERS && ./configure && make && make install

#  Compile and install Snort
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget http://sourceforge.net/projects/snort/files/snort/$PROG-$VERS.$EXT
RUN tar -zxf $PROG-$VERS.$EXT
WORKDIR /home/$VIRTUSER/$PROG-$VERS
RUN ./configure --prefix=$PREFIX --enable-sourcefire --enable-large-pcap --enable-profile --enable-gdb --enable-linux-smp-stats && make
USER root
RUN make install && ldconfig
RUN chmod u+s $PREFIX/bin/snort

# Cleanup
RUN rm -rf /home/$VIRTUSER/$PROG-$VERS
RUN rm -rf /root/$DVERS
RUN rm -rf /root/$LVERS
RUN rm -rf /root/$LDVERS

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
