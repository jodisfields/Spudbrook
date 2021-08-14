#!/bin/bash
# Install Docker Dependencies
echo "Installing Dependencies"
sleep 3
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
# Fetch Official Docker Installation Script
curl -fsSL https://get.docker.com -o get-docker.sh
# Install Docker
sudo sh get-docker.sh
# Fetch Official Docker-Compose Installation Script
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# Enables Execution of Script
sudo chmod +x /usr/local/bin/docker-compose
# Adds User To "Docker" Group
sudo usermod -aG docker $USER
newgrp docker
echo "Install Successful"
sleep 3
docker --version
sleep 3
docker-compose --version
sleep 3
cd docker-compose
# initialize docker swarm
docker swarm init
# deploys portainer
curl -L https://downloads.portainer.io/portainer-agent-stack.yml -o portainer-agent-stack.yml
docker stack deploy -c portainer-agent-stack.yml portainer