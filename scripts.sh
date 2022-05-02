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

echo "→ Installing git"
    apt-get install git -y
echo "Git installed"

echo "→ Installign ssh"
    apt-get install ssh
echo "SSH Installed"

update_repositories

# echo "→ Installing Docker:latest ..."
#     echo "→ Installing Dependencies..."
#         apt-get install -y ca-certificates curl gnupg lsb-release
#     echo "Installing Dependencies Done"
#     echo "→ Add official GPG key: ..."
#         curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
#     echo "GPG Key added"
#     echo "→ Updating repositories..."
#         apt-get update
#     echo "Repositories Upgraded"
#     echo "→ Downloading Docker..."
#         apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
#     echo "Docker downloaded"
#     echo "→ Creating docker group & Adding user to docker group..."
#         groupadd docker
#         usermod -aG docker $USER
#     echo "Done"
# echo "Docker installed"