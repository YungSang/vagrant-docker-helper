# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.1"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.synced_folder ".", "/vagrant", docker__exact: true

  config.vm.provider "docker" do |d|
    d.vagrant_vagrantfile = "./docker-host/Vagrantfile"

    d.build_dir = "."
    d.volumes   = ["/vagrant:/vagrant"]
  end

  # port forwarding between a container and boot2docker
  config.vm.network :forwarded_port, guest: 80, host: 8080
end
