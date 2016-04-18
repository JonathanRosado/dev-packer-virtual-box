#!/bin/bash

if [[ ! "$GO" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  exit
fi

SSH_USERNAME=${SSH_USERNAME:-vagrant}

UBUNTU_MAJOR_VERSION=$(lsb_release -rs | cut -f1 -d .)

go_package_install() {
    # Install gvm
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

    source $HOME/.gvm/scripts/gvm

    # Install dependencies
    apt-get install -y curl git mercurial make binutils bison gcc build-essential

    # Install go 1.6
    gvm install go1.4 -B
    gvm use go1.4
    export GOROOT_BOOTSTRAP=$GOROOT
    gvm install go1.6
    gvm use go1.6

    # Make go workspace and set GOPATH
    mkdir ~/go && echo "export GOPATH=$HOME/go" >> ~/.bashrc && source ~/.bashrc
}

go_package_install
