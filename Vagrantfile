# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "mitm" do |mitm|
    # Ubuntu 15.10 Server 64-bit box supporting VirtualBox and VMware providers. 
    #gateway.vm.box = "boxcutter/ubuntu1510"
    mitm.vm.box = "ubuntu/wily64" # Supports systemd-network interfacenames,
                                     # required for private network
    mitm.vm.hostname = "mitm"
    mitm.vm.provision "shell", path: 'apt-proxy.sh'
    mitm.vm.provision "shell", path: 'mitm.sh'
    #gateway.vm.network "public_network"
    mitm.vm.network "private_network", ip: "192.168.159.2"
    # gateway.vm.provision "shell", path: 'setup-user.sh', privileged: false
    # gateway.vm.network "forwarded_port", guest: 80, host: 8080
    # gateway.vm.synced_folder '.', '/home/vagrant/setup'
    mitm.vm.provision :reload # https://github.com/aidanns/vagrant-reload
  end

  config.vm.define "visitor" do |visitor|
    # Ubuntu 15.10 Server 64-bit box supporting VirtualBox and VMware providers. 
    # visitor.vm.box = "boxcutter/ubuntu1510"
    visitor.vm.box = "ubuntu/wily64" # Supports systemd-network interfacenames,
                                     # required for private network
    visitor.vm.hostname = "visitor"
    visitor.vm.provision "shell", path: 'apt-proxy.sh'
    visitor.vm.provision "shell", path: 'visitor.sh'
    visitor.vm.network "private_network", ip: "192.168.159.4"
    # visitor.vm.provision "shell", path: 'setup-user.sh', privileged: false
    # visitor.vm.network "forwarded_port", guest: 80, host: 8080
    # visitor.vm.synced_folder '.', '/home/vagrant/setup'
    visitor.vm.provision :reload # https://github.com/aidanns/vagrant-reload
    visitor.vm.provision "shell", path: 'config-network-visitor.sh', run: "always"
  end

end
