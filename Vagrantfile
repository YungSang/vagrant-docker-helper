# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "hello-docker"

  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.provider "docker" do |d|
    d.vagrant_machine     = "docker-provider"
    d.vagrant_vagrantfile = "./docker-host/Vagrantfile"

    d.build_dir = "."
    d.build_args = ["-t", "hello-docker"]
    d.host_vm_build_dir_options = {
      mount_options: ["nolock", "vers=3", "udp"]
    }
    d.name  = "hello-docker"
    d.ports = ["8080:80"]
  end
end
