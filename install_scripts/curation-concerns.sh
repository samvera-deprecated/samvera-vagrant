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

# setup hydra-jetty
bundle exec rake jetty:clean
bundle exec rake jetty:config
bundle exec rake jetty:start

# start redis
sudo /etc/init.d/redis-server start

# run the webserver
unicorn -D -p 3000
