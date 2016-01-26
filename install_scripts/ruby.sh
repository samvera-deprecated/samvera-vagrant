#!/bin/sh

echo "Setting up ruby environment"

# pre-requisites
PACKAGES="imagemagick libreadline-dev libyaml-dev libsqlite3-dev libqtwebkit-dev nodejs zlib1g-dev libsqlite3-dev nodejs"
sudo apt-get -y install $PACKAGES
# redis-server ?

# ruby (custom repository for a current ruby without having to compile it)
sudo apt-add-repository -y ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get -y install ruby2.2 ruby2.2-dev

# gems
GEMS="bundler rails unicorn"
sudo gem install $GEMS --no-ri --no-rdoc
