# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.ssh_key_name = "#{ENV['DIGITAL_OCEAN_SSH_KEY_NAME']}"
    provider.token = "#{ENV['DIGITAL_OCEAN_TOKEN']}"
    provider.image = 'ubuntu-14-04-x64'
    provider.region = 'sgp1'
    provider.size = '512MB'
  end
end
