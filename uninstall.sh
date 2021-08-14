#!/bin/bash
    sudo apt remove docker docker-engine docker.io containerd -y
    sudo apt remove runc apt-transport-https ca-certificates -y
    sudo apt remove curl gnupg lsb-release -y
    sudo apt purge docker-ce docker-ce-cli containerd.io -y
    sudo rm -rf /var/lib/docker
    sudo rm -rf /var/lib/containerd

