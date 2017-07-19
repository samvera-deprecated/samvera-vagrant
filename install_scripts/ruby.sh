#!/bin/sh

echo "Setting up ruby environment"

# pre-requisites
PACKAGES="imagemagick libreadline-dev libyaml-dev libsqlite3-dev nodejs zlib1g-dev libsqlite3-dev redis-server"
sudo apt-get -y install $PACKAGES

# ruby and the development libraries (so we can compile nokogiri, kgio, etc)
sudo apt-get -y install ruby ruby-dev

# gems
GEMS="bundler rails"
sudo gem install $GEMS --no-ri --no-rdoc

# For testing, we need phantomjs. Install it via NPM/Node
sudo apt-get -y install npm nodejs-legacy
sudo npm install -g phantomjs-prebuilt