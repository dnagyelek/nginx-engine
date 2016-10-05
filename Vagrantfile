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

    # config.vm.box = "bento/ubuntu-14.04" # 14.04
    
    config.vm.box = "ubuntu/trusty64" # 14.04 works 100ms+
    
    # not vorking wiht the default user / pass
    # older HHVM 3.11.1
    # config.vm.box = "ubuntu/xenial64" # 16.04 
   
    # to test next
    # config.vm.box = "bento/ubuntu-16.04" # 16.04 200ms+
    config.vm.network "private_network", ip: "192.168.33.16"
    config.vm.hostname = "easyengine.box"
    config.vm.synced_folder ".", "/var/www",  :mount_options => ["dmode=705", "fmode=604"] 
    
   # config.vm.provision :shell, path: File.join( "provision", "provision.sh" ) 

end

  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
