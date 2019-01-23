# -*- mode: ruby -*-
# vi: set ft=ruby :

Box = "peru/ubuntu-18.04-server-amd64"
NodeCount = 2
EnableProxyVM = false

Vagrant.configure("2") do |config|
  config.vm.box = Box

  initIndex = EnableProxyVM ? -1 : 0
  (initIndex..NodeCount).each do |i|
    case i
    when -1
      host = "proxy"
    when 0
      host = "master"
    else
      host = "node-#{i}"
    end
	  config.vm.define host do |node|
		  node.vm.hostname = host
      node.vm.network "private_network", ip: "192.168.2.#{i+100}"
      # node.vm.network "forwarded_port", guest: 80, host: 8080
      # node.vm.network "public_network"
      # node.vm.synced_folder "../data", "/vagrant_data"
	  end
  end

  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa_iamken1204.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
      mkdir -p /root/.ssh
      touch /root/.ssh/authorized_keys
      echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
    SHELL
  end

  config.vm.provider "virtualbox" do |vb|
	  # Disable the VirtualBox GUI when booting the machine
	  vb.gui = false
	  # Customize the amount of memory on the VM:
    vb.memory = 4000
    vb.cpus = 4
    # Enabling DNS proxy in NAT mode
    # https://serverfault.com/questions/453185/vagrant-virtualbox-dns-10-0-2-3-not-working/453260#453260
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
