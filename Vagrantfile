# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'berkshelf/vagrant'

Vagrant.configure("2") do |config|
  config.berkshelf.enabled = true
  config.vm.box = "ubuntu_1210_64bit"
  config.vm.box_url = "https://dl.dropboxusercontent.com/s/0zx97asmtpk7mbs/ubuntu121064.box"

  config.vm.network :forwarded_port, :guest => 80, :host => 8080
  config.vm.network :private_network, :ip => "192.168.33.10"

  config.vm.provision :chef_solo do |chef|
      chef.add_recipe('apt')
      chef.add_recipe('phonely')
  end
end
