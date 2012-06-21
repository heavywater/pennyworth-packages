# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://hw-vagrant.s3.amazonaws.com/precise64.box"
  config.vm.network :hostonly, "192.168.33.10"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.run_list = [ "recipe[build-essential]",
                      "recipe[chef_gem]",
                      "recipe[omnibus_updater]",
                      "recipe[bunchr]"
                    ]
    chef.json = {
      :omnibus_updater => {
        :version => "10.12.0"
      }
    }
  end
end
