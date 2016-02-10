# VERSION               1.0
FROM      opennsm/debian
MAINTAINER Wayland Morgan <dotwayland@gmail.com>

# Metadata
LABEL organization=opennsm
LABEL program=silk

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm

# Specify program
ENV PROG silk

# Specify source extension
ENV EXT tar.gz

# Specify SiLK version to download and install (e.g. silk-1.0, etc)
ENV VERS 3.11.0.1

# Install directory
ENV PREFIX /opt/silk

# Path should include prefix
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PREFIX/bin:$PREFIX/sbin

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq make gcc g++ libpcap-dev python python-dev libglib2.0-dev --no-install-recommends

# Compile and Install SiLK
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget http://tools.netsa.cert.org/releases/$PROG-$VERS.$EXT && tar -xzf $PROG-$VERS.$EXT
WORKDIR /home/$VIRTUSER/$PROG-$VERS
RUN ./configure --prefix=$PREFIX && make
USER root
RUN make install

# Permissions
RUN chmod -R u+s /opt/silk/bin/ /opt/silk/sbin/

# Cleanup
RUN rm -rf /home/$VIRTUSER/$PROG-$VERS

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
