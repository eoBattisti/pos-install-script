#!/bin/bash


update_repositories()
{
    echo "→ Updating repositories"
    apt-get update
    echo "Repositories updated"
}

echo "→ Updating and Upgrading repositories..."
    apt-get update && apt-get upgrade -y
echo "Done"

echo "→ Installing essentials packages"

    # Build-Essential: is a package thats is necessary to compiling softwares.
    # This package include: GNU debbuger & compiler, g++, c/c++, dpkg-dev, GCC and make.

    # Curl: is a tool to for transferring data with URL sintax.

    # Wget: a tool to download files using HTTP/HTTPS and FTP protocols.

    apt-get install build-essential curl wget
echo "Build-essential installed"

echo "→ Installing python3"
    apt install python3 python3-pip python3-ven
echo "Python installed"

echo "→ Installing git"
    apt-get install git -y
echo "Git installed"

echo "→ Generating SSH Key"
    
    # Generate ssh-key to after the installation of the script 
    # use in Github and Gitlab
    ssh-keygen
echo "SSH Key generated"

echo "→ Installign Node"

    apt-get install nodejs npm

    # Installing yarn
    npm install --global yarn
echo "SSH Installed"

update_repositories

echo "→ Installing Docker:latest ..."
    echo "→ Installing Dependencies..."
        apt-get install -y ca-certificates curl gnupg lsb-release
    echo "Installing Dependencies Done"
    echo "→ Add official GPG key: ..."
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "GPG Key added"
    echo "→ Updating repositories..."
        apt-get update
    echo "Repositories Upgraded"
    echo "→ Downloading Docker..."
        apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    echo "Docker downloaded"
    echo "→ Creating docker group & Adding user to docker group..."
        groupadd docker
        usermod -aG docker $USER
    echo "Done"
echo "Docker installed"

# add-apt-repository universe
# apt install gnome-tweak-tool
