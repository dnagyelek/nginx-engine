# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    
    config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", 1]
        v.customize ["modifyvm", :id, "--name", "drigg.box"]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

    config.vm.box = "ubuntu/trusty64" #

    config.vm.network "private_network", ip: "192.168.33.16"
    config.vm.hostname = "coachhousegoole.box"

    # for Browser Sync
    # config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true
    # config.vm.network :forwarded_port, guest: 3001, host: 3001, auto_correct: true
    # config.vm.network :forwarded_port, guest: 22, host: 1234, auto_correct: true


    config.vm.synced_folder ".", "/var/www",  :mount_options => ["dmode=755", "fmode=644"] , owner: "www-data", group: "www-data"
    
   # config.vm.provision :shell, path: File.join( "provision", "provision.sh" ) 

end

  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
