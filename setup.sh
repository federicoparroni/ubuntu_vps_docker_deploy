#!/bin/bash

sudo apt update && \
sudo apt upgrade -y

echo "> Installing github cli"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) \
signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] \
https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update && \
sudo apt install -y gh

echo ""
echo "> Installing docker"
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
sudo apt update && \
apt-cache policy docker-ce && \
sudo apt install -y docker-ce docker-ce-cli containerd.io && \
sudo usermod -aG docker ${USER} && \

# su - ${USER}
echo "LOGOUT NOW TO APPLY GROUP CHANGES"
echo "Then you can install docker-compose:"
echo "sudo apt install -y docker-compose"
