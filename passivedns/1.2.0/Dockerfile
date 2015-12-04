# PassiveDNS
# VERSION               0.1
# docker run -it passivedns:1.2.0 bash

FROM       opennsm/debian
MAINTAINER Syed Huq <deedarhuq@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=passivedns

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Program name
ENV PROGRAM passivedns
# Specify PassiveDNS version to download and install (e.g. 1.2.0)
ENV VERS 1.2.0
ENV DST /usr/local/bin

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y libldns1 libldns-dev libpcap-dev gcc make automake autoconf unzip --no-install-recommends

# Compile and install passivedns
USER opennsm
WORKDIR /home/$VIRTUSER
RUN wget https://github.com/gamelinux/$PROGRAM/archive/$VERS.zip
RUN unzip ./$VERS.zip
WORKDIR /home/$VIRTUSER/$PROGRAM-$VERS
RUN autoreconf --install
RUN ./configure && make
USER root
RUN make install
RUN chmod o+wrx /var/log
RUN chmod u+s /usr/local/bin/$PROGRAM

# Environment
WORKDIR /home/$VIRTUSER
