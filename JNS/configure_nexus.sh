#!/bin/bash

set -xe

sudo -i
apt update
apt install openjdk-8-jdk -y
useradd -M -d /opt/nexus -s /bin/bash -r nexus
echo "nexus   ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/nexus
cd /opt
wget http://download.sonatype.com/nexus/3/nexus-3.22.0-02-unix.tar.gz
tar xvf nexus-3.22.0-02-unix.tar.gz
mv nexus-3.22.0-02 /opt/nexus

sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sed -i 's/#run_as_user=""/run_as_user="nexus"/' /opt/nexus/bin/nexus.rc
cat > /etc/systemd/system/nexus.service << 'EOL'
[Unit]
Description=nexus service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
[Install]
WantedBy=multi-user.target
EOL

systemctl daemon-reload
systemctl enable --now nexus.service
