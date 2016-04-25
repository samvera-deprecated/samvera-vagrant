#!/bin/sh

echo "Creating a stock Curation Concerns app"

# create a curation-concerns app
rails new curation-concerns-demo --skip-spring
cd curation-concerns-demo
echo "gem 'curation_concerns', github:'projecthydra-labs/curation_concerns', branch: 'master'" >> Gemfile
bundle install
yes Y | rails generate curation_concerns:install
rake db:migrate
rails generate curation_concerns:work Book

# start redis
sudo /etc/init.d/redis-server start

# start fedora and solr
SHARED_DIR=$1
sudo cp $SHARED_DIR/install_scripts/fedora-solr /etc/init.d/
sudo update-rc.d fedora-solr start 90 2 3 4 5 .
sudo /etc/init.d/fedora-solr start
