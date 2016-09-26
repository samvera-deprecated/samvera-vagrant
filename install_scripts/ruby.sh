#!/bin/sh

echo "Setting up ruby environment"

# pre-requisites
PACKAGES="imagemagick libreadline-dev libyaml-dev libsqlite3-dev nodejs zlib1g-dev libsqlite3-dev nodejs redis-server"
sudo apt-get -y install $PACKAGES

# ruby (custom repository for a current ruby without having to compile it)
sudo apt-add-repository -y ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get -y install ruby2.3 ruby2.3-dev

# gems
GEMS="bundler rails"
sudo gem install $GEMS --no-ri --no-rdoc
