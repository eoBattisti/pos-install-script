#!/bin/bash

# Author: Nicolas Battisti

set -e
# Urls to download the softwares
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_VSCODE="https://az764295.vo.msecnd.net/stable/3b889b090b5ad5793f524b5d1d39fda662b96a2a/code_1.69.2-1658162013_amd64.deb"
URL_DISCORD="https://discordapp.com/api/download?platform=linux&format=deb"

# Default dir
DIR_DOWNLOADS="${HOME}/Downloads/programs"

# Packages
TO_DOWNLOAD=(
    build-essential
    curl
    wget
    net-tools
    git
    openssh-server)

remove_locks(){
    sudo rm -rf /var/lib/dpkg/lock-frontend
    sudo rm -rf /var/cache/apt/archives/lock
}


update(){
    sudo apt update && sudo apt dist-upgrade -y
}

install_debs(){

    mkdir "$DIR_DOWNLOADS"

    echo -e "[INFO] - Downloading .deb packages"
    wget -c "$URL_GOOGLE_CHROME" -P "$DIR_DOWNLOADS"
    wget -c "$URL_VSCODE" -P "$DIR_DOWNLOADS"
    wget -O discord.deb "$URL_DISCORD" -P "$DIR_DOWNLOADS"

    echo -e "[INFO] - Installing .deb packages"
    sudo dpkg -i $DIR_DOWNLOADS/*.deb

    echo -e "[INFO] - Installing apt packages"
    for p in ${TO_DOWNLOAD[@]}; do
        if ! dpkg -l | grep -q $p; then
            sudo apt install "$p" -y
        else
            echo -e "[INFO] - ${p} already installed"
        fi
    done
}

clean(){
    sudo apt update && sudo apt dist-upgrade -y
    sudo apt autoclean -y 
    sudo apt autoremove -y
}

# Exec

remove_locks
update
remove_locks
install_debs
update
clean

echo -e "[INFO] - Script done..."