# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "docker" do |d|
    d.vagrant_vagrantfile = "./docker-host/Vagrantfile"

    d.build_dir = "."
    d.host_vm_build_dir_options = {
      type: "nfs"
    }
  end

  # port forwarding between a container and boot2docker
  config.vm.network :forwarded_port, guest: 80, host: 8080
end
