#!/bin/bash

if [[ ! "$DOCKERCOMPOSE" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  exit
fi

SSH_USERNAME=${SSH_USERNAME:-vagrant}

UBUNTU_MAJOR_VERSION=$(lsb_release -rs | cut -f1 -d .)

compose_package_install() {
    # Install docker compose
    curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    
    # Set permissions
    chmod +x /usr/local/bin/docker-compose
}

compose_package_install
