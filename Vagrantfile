# -*- mode: ruby -*-
# vi: set ft=ruby :

Box = "peru/ubuntu-18.04-server-amd64"
NodeCount = 1

Vagrant.configure("2") do |config|
  config.vm.box = Box

  (0..NodeCount).each do |i|
    host = i==0 ? "master" : "node-#{i}"
	  config.vm.define host do |node|
		  node.vm.hostname = host
      node.vm.network "private_network", ip: "192.168.2.#{i+100}"
      # node.vm.network "forwarded_port", guest: 80, host: 8080
      # node.vm.network "public_network"
      # node.vm.synced_folder "../data", "/vagrant_data"
	  end
  end

  config.vm.provider "virtualbox" do |vb|
	# Disable the VirtualBox GUI when booting the machine
	vb.gui = false
	# Customize the amount of memory on the VM:
	vb.memory = "1024"
  end
end
