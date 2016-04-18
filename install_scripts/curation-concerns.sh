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

# start rails, fedora and solr for development
nohup fcrepo_wrapper -p 8984 > log/fedora.log 2>&1 &
nohup solr_wrapper --version 5.4.1 -d solr/config/ -p 8983 -n hydra-development > log/solr.log 2>&1 &

printf 'waiting for solr and fedora'
until $(curl --output /dev/null --silent --head --fail http://localhost:8983/solr); do
    printf '.'
    sleep 1
done
until $(curl --output /dev/null --silent --head --fail http://localhost:8984/rest); do
    printf '.'
    sleep 1
done
