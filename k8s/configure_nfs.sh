#!/bin/bash

apt-get update -q
apt-get install -y nfs-kernel-server
mkdir /nfsroot
echo "/nfsroot $1/24(rw,no_root_squash,subtree_check)" >> /etc/exports
exportfs -r
/etc/init.d/nfs-kernel-server start
showmount -e
