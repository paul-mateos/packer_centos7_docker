# -*- mode: ruby -*-
# vi: set ft=ruby :

class CentOSFix < VagrantVbguest::Installers::Linux
    def install(opts=nil, &block)
        communicate.sudo("yum install --enablerepo=elrepo-kernel -y gcc binutils make perl bzip2 kernel-ml-devel.x86_64", opts, &block)
        super
    end
end

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vbguest.installer = CentOSFix

  # VirtualBox.
  # `vagrant up virtualbox --provider=virtualbox`
  config.vm.define "virtualbox" do |virtualbox|
    virtualbox.vm.hostname = "edelia-centos7"
    virtualbox.vm.box = "file://builds/edelia-virtualbox-centos7.box"
    virtualbox.vm.network :private_network, ip: "172.16.3.2"

    config.vm.provider :virtualbox do |v|
      v.gui = false
      v.memory = 1024
      v.cpus = 2
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    config.vm.provision "shell", inline: "sudo docker run hello-world"
  end

end
