#!/bin/bash

set -ex
sudo apt-get update && sudo apt-get install -y apt-transport-https curl ca-certificates  software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
sudo apt-get update -q
sudo apt-get install -y docker-ce
sudo systemctl start docker
sudo systemctl enable docker

######

sudo apt update -q
sudo apt install ansible
ansible --version

######

ssh-keygen -t ecdsa -b 521 -N "password"

