# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    
    config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 758]
        v.customize ["modifyvm", :id, "--cpus", 1]
        v.customize ["modifyvm", :id, "--name", "easyengine.box"]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

    config.vm.box = "ubuntu/trusty64"
    config.vm.network "private_network", ip: "192.168.33.16"
    config.vm.hostname = "easyengine.box"
    config.vm.synced_folder ".", "/var/www",  :mount_options => ["dmode=705", "fmode=604"] 
    
    # config.vm.provision :shell, path: "updatephp7.sh"
    

end


  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
