#!/bin/bash

sudo apt update
sudo apt install gnupg ethtool curl -y
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6B2BFD3660EF3F5B
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 17723034C56D4B19
sudo curl -o /etc/apt/sources.list.d/scylla.list -L http://repositories.scylladb.com/scylla/repo/8e046465-e363-4e60-8de0-1f905afd0cde/ubuntu/scylladb-2.3-bionic.list
sudo apt update
sudo apt install scylla -y

scylla_setup \
  --no-raid-setup \
  --no-ec2-check \
  --no-ntp-setup \
  --no-coredump-setup \
  --no-io-setup \
  --no-sysconfig-setup
/usr/lib/scylla/scylla_sysconfig_setup --nic eth1 --setup-nic
scylla_io_setup
# /usr/lib/scylla/scylla_dev_mode_setup --developer-mode 1
