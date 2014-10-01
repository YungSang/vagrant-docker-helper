require "vagrant/action/builder"

module VagrantPlugins
  module ProviderVirtualBox
    module Action
      # This action sync folders on a running provider. It is used by the docker provider
      # to link synced folders on the host machine as volumes into the docker containers
      def self.action_sync_folders
        Vagrant::Action::Builder.new.tap do |b|
          b.use ConfigValidate
          b.use Call, IsState, :not_created do |env1, b1|
            if env1[:result]
              b1.use Message, I18n.t("vagrant.commands.common.vm_not_created")
              next
            end

            b1.use Call, IsState, :running do |env2, b2|
              if !env2[:result]
                b2.use Message, I18n.t("vagrant.commands.common.vm_not_running")
                next
              end

              b2.use SyncedFolders
              b2.use PrepareNFSSettings
            end
          end
        end
      end
    end
  end
end

module VagrantPlugins
  module Parallels
    module Action
      # This action sync folders on a running provider. It is used by the docker provider
      # to link synced folders on the host machine as volumes into the docker containers
      def self.action_sync_folders
        Vagrant::Action::Builder.new.tap do |b|
          b.use ConfigValidate
          b.use Call, IsState, :not_created do |env1, b1|
            if env1[:result]
              b1.use Message, I18n.t("vagrant.commands.common.vm_not_created")
              next
            end

            b1.use Call, IsState, :running do |env2, b2|
              if !env2[:result]
                b2.use Message, I18n.t("vagrant.commands.common.vm_not_running")
                next
              end

              b2.use SyncedFolders
              b2.use PrepareNFSSettings
            end
          end
        end
      end
    end
  end
end
