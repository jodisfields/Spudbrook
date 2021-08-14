#!/bin/bash
    sudo apt update && sudo apt upgrade -y
    sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo usermod -aG docker $USER
    newgrp docker
    docker --version
    docker-compose --version
