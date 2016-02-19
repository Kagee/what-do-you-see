# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "m" do |mitm|
    # Ubuntu 15.10 Server 64-bit box supporting VirtualBox and VMware providers. 
    mitm.vm.box = "boxcutter/debian81"
    # mitm.vm.box = "ubuntu/wily64" # Supports systemd-network interfacenames,
                                     # required for private network > 14.04
    mitm.vm.hostname = "mitm"
    
    mitm.vm.provision "shell", path: 'apt-proxy.sh'
    mitm.vm.provision "shell", path: 'mitm.sh'

    mitm.vm.network "private_network", ip: "192.168.159.2"
    # mitm.vm.synced_folder '.', '/home/vagrant/setup'

    mitm.vm.provision :reload # https://github.com/aidanns/vagrant-reload
  end

  config.vm.define "v" do |visitor|
    # Ubuntu 15.10 Server 64-bit box supporting VirtualBox and VMware providers. 
    visitor.vm.box = "boxcutter/debian81"
    # visitor.vm.box = "ubuntu/wily64" # Supports systemd-network interfacenames,
                                     # required for private network > 14.04
    visitor.vm.hostname = "visitor"
    visitor.vm.provision "shell", path: 'apt-proxy.sh'
    visitor.vm.provision "shell", path: 'visitor.sh'

    # We use data/visitor-eth1.cfg for network config
    visitor.vm.network "private_network", ip: "192.168.159.4", auto_config: false
    # visitor.vm.provision "shell", path: 'setup-user.sh', privileged: false

    # visitor.vm.synced_folder '.', '/home/vagrant/setup'
    visitor.vm.provision :reload # https://github.com/aidanns/vagrant-reload
  end

end
