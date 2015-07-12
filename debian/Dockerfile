# Debian
#
# VERSION               1.0
FROM      debian
MAINTAINER Jon Schipp <jonschipp@gmail.com>

# Variables
ENV VIRTUSER opennsm

# Install general tools
RUN apt-get update -qq
RUN apt-get install -yq sudo wget gawk git nano vim emacs

# User configuration
RUN adduser --disabled-password --gecos "" $VIRTUSER

# Passwords
RUN echo "$VIRTUSER:$VIRTUSER" | chpasswd
RUN echo "root:opennsm" | chpasswd

# Sudo
RUN usermod -aG sudo $VIRTUSER

# Environment
WORKDIR /home/$VIRTUSER
USER opennsm
