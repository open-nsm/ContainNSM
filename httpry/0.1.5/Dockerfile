# Httpry
# VERSION               0.1
# docker run -it httpry:0.1.5 bash

FROM       opennsm/debian
MAINTAINER Syed Huq <deedarhuq@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=httpry

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Program name
ENV PROGRAM httpry
# Specify Httpry version to download and install (e.g. 0.1.5)
ENV VERS 0.1.5

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y make gcc libpcap0.8-dev

# Compile and install httpry
RUN mkdir -p /usr/man/man1
RUN mkdir -p /usr/local/man/man1
USER opennsm
WORKDIR /home/$VIRTUSER
RUN git clone https://github.com/jbittel/httpry
WORKDIR /home/$VIRTUSER/httpry
RUN git checkout $PROGRAM-$VERS
RUN sed -i 's/ -Werror//'  Makefile
RUN make
USER root
WORKDIR /home/$VIRTUSER/httpry
RUN make install

# Permissions
RUN chmod u+s /usr/sbin/$PROGRAM

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
