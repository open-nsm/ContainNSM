#!/bin/bash
# Author: Jon Schipp <jonschipp@gmail.com>
set -x

## Variables
VAGRANT=/home/vagrant
HOME=/root

# Installation notification
MAIL=$(which mail)
COWSAY=/usr/games/cowsay
IRCSAY=/usr/local/bin/ircsay
IRC_CHAN="#open-nsm"
HOST=$(hostname -s)
LOGFILE=/root/provision.log
EMAIL=user@company.com

cd $HOME

function die {
  if [ -f ${COWSAY:-none} ]; then
    $COWSAY -d "$*"
  else
    echo "$*"
  fi
  if [ -f $IRCSAY ]; then
    ( set +e; $IRCSAY "$IRC_CHAN" "$*" 2>/dev/null || true )
  fi
  [ $MAIL ] && echo "$*" | mail -s "[vagrant] Sagan install information on $HOST" $EMAIL
  exit 1
}

function hi {
  if [ -f ${COWSAY:-none} ]; then
    $COWSAY "$*"
  else
    echo "$*"
  fi
  if [ -f $IRCSAY ]; then
    ( set +e; $IRCSAY "$IRC_CHAN" "$*" 2>/dev/null || true )
  fi
  [ $MAIL ] && echo "$*" | mail -s "[vagrant] Sagan install information on $HOST" $EMAIL
}

install_docker(){
  hi "  Installing Docker!\n"

  # Check that HTTPS transport is available to APT
  if [[ ! -e /usr/lib/apt/methods/https ]]; then
    apt-get update -qq
    apt-get install -qy apt-transport-https
    echo
  fi

  # Add the repository to your APT sources
  # Then import the repository key
  if [[ ! -e /etc/apt/sources.list.d/docker.list ]]
  then
    echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
    echo
  fi

  # Install docker
  if ! command -v docker >/dev/null 2>&1
  then
    apt-get update -qq
    apt-get install -qy --no-install-recommends lxc-docker cgroup-lite
    #apt-get install -qy lxc-docker linux-image-extra-$(uname -r) aufs-tools
  fi
}

install_docker "1.)"
