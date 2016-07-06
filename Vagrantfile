# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "boxcutter/ubuntu1604-desktop"
  #config.vm.box = "ubuntu/xenial64"
  #config.vm.network :forwarded_port, guest: 5000, host: 5000

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "Ubuntu.16.04.Vagrant"
    vb.cpus = 2
    vb.memory = "2048"
    vb.customize ["modifyvm", :id, "--vram", 128]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  config.vm.provision :shell, path: "update.sh"
  # config.vm.provision :shell, path: "desktop.sh", env: { "USERNAME" => "ubuntu" }
  # config.vm.provision :shell, path: "tools.sh"
  config.vm.provision :shell, path: "cleanup.sh"

end
