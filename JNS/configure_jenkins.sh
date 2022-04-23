#!/bin/bash

set -xe

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt install openjdk-11-jre-headless  -y

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
e>     /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo apt install git maven -y
sudo ufw enable
sudo ufw allow 8080/tcp
sudo ufw reload
sudo ufw status