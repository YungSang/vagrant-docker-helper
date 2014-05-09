require "digest/md5"

require "log4r"

require Vagrant.source_root.join("plugins/providers/docker/action/host_machine_build_dir.rb")

module VagrantPlugins
  module DockerProvider
    module Action
      class HostMachineBuildDir
        def initialize(app, env)
          @app = app
          @logger = Log4r::Logger.new("vagrant::docker::hostmachinebuilddir")
        end

        def call(env)
          machine   = env[:machine]
          build_dir = machine.provider_config.build_dir

          # If we're not building a Dockerfile, ignore
          return @app.call(env) if !build_dir

          # If we're building a docker file, expand the directory
          build_dir = File.expand_path(build_dir, env[:machine].env.root_path)
          env[:build_dir] = build_dir

          # If we're not on a host VM, we're done
          return @app.call(env) if !machine.provider.host_vm?

          # We're on a host VM, so we need to move our build dir to
          # that machine. We do this by putting the synced folder on
          # ourself and letting HostMachineSyncFolders handle it.
#          new_build_dir = "/mnt/docker_build_#{Digest::MD5.hexdigest(build_dir)}"

          # always /vagrant because of `config.vm.synced_folder "..", "/vagrant", type: "nfs"`
          new_build_dir = "/vagrant"
          options       = {
            docker__ignore: true,
            docker__exact: true,
          }
          machine.config.vm.synced_folder(build_dir, new_build_dir, options)

          # Set the build dir to be the correct one
          env[:build_dir] = new_build_dir

          @app.call(env)
        end
      end
    end
  end
end
