#!/bin/bash
    echo "Installing Dependencies"
    sleep 2
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo usermod -aG docker $USER
    newgrp docker << EOF
    echo "Install Successful"
    sleep 2
    docker --version
    sleep 2
    docker-compose --version
    sleep 2
    cd docker-compose
    docker swarm init
    curl -L https://downloads.portainer.io/portainer-agent-stack.yml -o portainer-agent-stack.yml
    docker stack deploy -c portainer-agent-stack.yml portainer
    EOF
    exit
    exit
