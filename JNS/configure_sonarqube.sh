#!/bin/bash

set -xe
sudo apt update
sudo apt install openjdk-11-jdk
sudo sysctl -w vm.max_map_count=524288
sudo sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192
sudo useradd sonarh2s
sudo passwd sonarh2s
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql.list
sudo apt update
sudo passwd postgres -y
su - postgres
createuser sonaruser
