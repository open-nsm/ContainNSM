# Bro Sandbox - Bro 2.1
#
# VERSION               1.0
FROM      debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Specify container username e.g. training, demo
ENV VIRTUSER opennsm
# Specify Bro version to download and install (e.g. bro-2.3.1, bro-2.4)
ENV VERS bro-2.1
# Place to install bro
ENV DST /opt/bro

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq build-essential cmake make gcc g++ flex bison libpcap-dev libgeoip-dev libssl-dev python-dev zlib1g-dev libmagic-dev swig2.0 wget curl
RUN apt-get install -yq sudo gawk git nano vim emacs

# User configuration
RUN adduser --disabled-password --gecos "" $VIRTUSER

# Compile and install bro
USER $VIRTUSER
WORKDIR /home/$VIRTUSER
RUN wget http://www.bro.org/downloads/archive/$VERS.tar.gz && tar -xvzf $VERS.tar.gz
WORKDIR /home/$VIRTUSER/$VERS
RUN ./configure --prefix=$DST && make
USER root
RUN make install


# Configure environment
RUN echo "PATH=$PATH:/opt/bro/bin"              > /etc/profile.d/bro.sh
RUN chmod 555 /etc/profile.d/bro.sh

# Passwords
RUN echo "$VIRTUSER:$VIRTUSER" | chpasswd
RUN echo "root:opennsm" | chpasswd

# Sudo
RUN usermod -aG sudo $VIRTUSER
# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
