#!/bin/bash

# install essentials
sudo apt update
sudo apt install -y gnupg curl vim ethtool htop
# add keys for adding Scylla repository
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6B2BFD3660EF3F5B
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 17723034C56D4B19
sudo curl -o /etc/apt/sources.list.d/scylla.list -L http://repositories.scylladb.com/scylla/repo/8e046465-e363-4e60-8de0-1f905afd0cde/ubuntu/scylladb-2.3.1-bionic.list
# install Scylla
sudo apt update
sudo apt install -y scylla
# setup Scylla
sudo scylla_setup
