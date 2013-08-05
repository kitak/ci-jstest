# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "Ubuntu Server 12.10 amd64 Minimal (VirtualBox 4.2.6)"
  config.vm.box_url = "http://goo.gl/wxdwM"

  config.vm.define :ci do |ci_config|
    ci_config.vm.hostname = "ci.kitak.local"

    ci_config.vm.synced_folder ".", "/vagrant"
    ci_config.vm.synced_folder "../kitak-puppet", "/manifest"
  end

end
