# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<-SCRIPT
  echo "Updating server ..."
  sudo apt-get update

  echo "Installing dependencies"
  curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
  rbenv bootstrap-ubuntu-12-04
SCRIPT

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = 'ubuntu/xenial64'

  # config.vm.define 'docker' do |db|
  #   db.vm.hostname = 'docker'
  #   db.vm.network 'private_network', ip: '172.20.10.10'

  #   db.vm.provision 'docker' do |d|
  #     d.run 'db', image: 'postgres:9.6.2', args: "-v 'postgres:/var/lib/postgresql/data' -p '5432:5432'"
  #     d.run 'redis', image: 'redis:3.2.8', args: "-v 'redis:/var/lib/redis/data' -p '6379:6379'"
  #     d.run 'mailcatcher', image: 'schickling/mailcatcher:latest', args: "-p '1080:1080' -p '1025:1025'"
  #   end
  # end

  config.vm.define 'load-balancer' do |db|
    db.vm.hostname = 'load-balancer'
    db.vm.network 'private_network', ip: '172.20.30.80'
  end

  config.vm.define 'db-master' do |db|
    db.vm.hostname = 'db-master'
    db.vm.network 'private_network', ip: '172.20.10.10'
  end

  config.vm.define 'db-slave' do |db|
    db.vm.hostname = 'db-slave'
    db.vm.network 'private_network', ip: '172.20.10.11'
  end

  config.vm.define 'redis' do |redis|
    redis.vm.hostname = 'redis'
    redis.vm.network 'private_network', ip: '172.20.20.11'
  end

  config.vm.define 'web-0', primary: true do |web|
    web.vm.hostname = 'web-0'
    web.vm.network 'private_network', ip: '172.20.30.20'

    web.vm.provision 'shell', inline: $script
  end

  config.vm.define 'web-1' do |web|
    web.vm.hostname = 'web-1'
    web.vm.network 'private_network', ip: '172.20.30.21'

    web.vm.provision 'shell', inline: $script
  end
end
