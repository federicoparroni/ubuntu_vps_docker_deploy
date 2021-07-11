#!/bin/bash

sudo apt update && \
sudo apt upgrade -y && \
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
sudo apt update && \
apt-cache policy docker-ce && \
sudo apt install -y docker-ce docker-ce-cli containerd.io && \
sudo usermod -aG docker ${USER} && \
su - ${USER} && \
sudo apt install -y docker-compose
