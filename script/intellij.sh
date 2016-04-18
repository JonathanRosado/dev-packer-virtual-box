#!/bin/bash

if [[ ! "$INTELLIJ" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  exit
fi

SSH_USERNAME=${SSH_USERNAME:-vagrant}

UBUNTU_MAJOR_VERSION=$(lsb_release -rs | cut -f1 -d .)

intellij_package_install() {
    # Attempt to install a JDK
    apt-get update -y && apt-get install -y openjdk-7-jre

    # Download binary
    wget -O /tmp/intellij.tar.gz http://download.jetbrains.com/idea/ideaIC-2016.1.1.tar.gz

    # Untar
    cd ~ && tar xfz /tmp/intellij.tar.gz

    # Set directory name
    DIR=$(ls | grep idea-*)

    # Grab executable folder
    BIN="$HOME/$DIR/bin"

    # Set desktop shortcut path
    DESK=/usr/share/applications/IDEA.desktop

    # Add desktop shortcut
    echo - e "[Desktop Entry]\nVersion=13.0\nType=Application\nTerminal=false\nIcon[en_US]=${BIN}/idea.png\nName[en_US]=IntelliJ\nExec=${BIN}/idea.sh\nName=IntelliJ\nIcon=${BIN}/idea.png" > ${DESK}
}

intellij_package_install
