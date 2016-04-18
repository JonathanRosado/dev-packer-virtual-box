#!/bin/bash

if [[ ! "$RMBLOAT" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  exit
fi

SSH_USERNAME=${SSH_USERNAME:-vagrant}

UBUNTU_MAJOR_VERSION=$(lsb_release -rs | cut -f1 -d .)

remove_bloat() {
    apt-get remove -y unity-webapps-common
}

remove_bloat
