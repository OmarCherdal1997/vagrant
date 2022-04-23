#!/bin/bash
set -xe

apt-get update -q
apt-get install apt-transport-https ca-certificates gnupg2 -y
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
#sh -c 'echo "deb https://artifacts.elastic.co/packages/7.6.1/apt stable main" > /etc/apt/sources.list.d/elastic-7.6.1.list'
sudo wget --directory-prefix=/opt/ https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.6.1-amd64.deb
sudo dpkg -i /opt/elasticsearch*.deb
apt-get update -y
#apt-get install elasticsearch -y
systemctl start elasticsearch
systemctl enable elasticsearch