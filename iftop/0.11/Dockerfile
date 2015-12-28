# VERSION 0.1
FROM      opennsm/debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=iftop

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify program
ENV PROG iftop
# Specify source extension
ENV EXT tar.gz
# Specify version to download and install (e.g. tool-2.3.1)
ENV VERS 0.11

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq build-essential libpcap-dev libncurses-dev --no-install-recommends

# Compile and install tool
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget --no-check-certificate http://www.ex-parrot.com/pdw/$PROG/download/$PROG-$VERS.$EXT && tar -xzf $PROG-$VERS.$EXT
WORKDIR /home/$VIRTUSER/$PROG-$VERS
RUN sed -i '293s/$/ break;/' $PROG.c
RUN ./configure && make
USER root
RUN make install
RUN chmod u+s /sbin/$PROG

# Cleanup
RUN rm -rf /home/$VIRTUSER/$PROG-$VERS

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
