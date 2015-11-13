# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "trusty"

  # The url from where the 'config.vm.box' box will be fetched if it doesn't exist
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.provision "shell", path:  "provision.sh"

  # Share repo in VM as mountpoint /dockerfiles
  config.vm.synced_folder ".", "/dockerfiles"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider :virtualbox do |vb|
     vb.gui = false
     vb.name = "nsm-docker"
     vb.customize ["modifyvm", :id, "--memory", "1024"]
     vb.customize ["modifyvm", :id, "--cpus", "1"]
   end
end
