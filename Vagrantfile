# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hnakamur/centos7.0-x64"
  config.vm.network :private_network, ip: "192.168.33.7"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

  # NOTE: You need to patch manually Vagrant <= 1.6.5 to use NFS on CentOS7
  # https://github.com/mitchellh/vagrant/pull/4499/files
  config.vm.synced_folder ".", "/vagrant", nfs: true

  config.vm.provision "shell", path: "install_docker.sh"
end
