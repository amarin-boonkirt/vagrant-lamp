# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty64"

    config.vm.network :private_network, ip: "192.168.33.10"
    config.vm.synced_folder ".", "/vagrant", mount_options: ['dmode=777','fmode=666']

    config.vm.synced_folder "../../../works", "/var/www/html/works",
      owner: "www-data",
      group: "www-data",
      mount_options: ["dmode=755,fmode=644"]

 #    config.vm.synced_folder "../../plugins/wpkit", "/var/www/html/wordpress/wp-content/plugins/wpkit",
 #     owner: "www-data",
 #     group: "www-data",
 #     mount_options: ["dmode=755,fmode=644"]#

	config.vm.provision "shell", path: "provision.sh"

  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
end
