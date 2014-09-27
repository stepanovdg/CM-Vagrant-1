# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
MASTER_BOX_NAME = "chef/centos-6.5-i386"
SLAVE_BOX_NAME = "chef/centos-6.5-i386"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box_check_update = false
  #config.vm.network "public_network"
  config.vm.network "private_network", type: "dhcp"
  config.vm.synced_folder ".", "/vagrant", :nfs => true, id: "vagrant-root"

  config.vm.define "master" do |master|
    master.vm.box = (MASTER_BOX_NAME)
	#master.vm.network "private_network", ip: "192.168.33.10", virtualbox__intnet: "wlan1"
	#master.vm.synced_folder "./vm1", "/mnt/share_data1", type: "nfs"
	master.vm.network "forwarded_port", guest: 80, host: 8080
	master.vm.provider "virtualbox" do |vb|
    #vb.gui = true
	 vb.name = "host1"
	 #vb.hostname = "master-host"
	 vb.cpus = 1
	 vb.memory = 128
	 vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
	end
  end

  config.vm.define "slave" do |slave|
    slave.vm.box = (SLAVE_BOX_NAME)
	slave.vm.network "private_network", type: "dhcp"
	#slave.vm.synced_folder "./vm2", "/mnt/share_data2", type: "nfs"
	slave.vm.network "forwarded_port", guest: 80, host: 8081
	slave.vm.provider "virtualbox" do |vb|
    #  vb.gui = true
	 vb.name = "host2"
	 #vb.hostname = "slave-host"
	 vb.cpus = 1
	 vb.memory = 256
	 vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

  
  config.vm.provision "shell", path: "centos-script.sh"
end
