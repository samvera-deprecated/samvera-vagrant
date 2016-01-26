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

# fix config
sed -i 's|8983/fedora|8080/fcrepo|' config/fedora.yml
sed -i 's|8983|8080|' config/solr.yml
sed -i 's|8983|8080|' config/blacklight.yml

TOMCAT=/var/lib/tomcat7
sudo mv $TOMCAT/solr/collection1 $TOMCAT/solr/development-core
sudo cp -a $TOMCAT/solr/development-core $TOMCAT/solr/test-core
sudo sed -i 's|collection1|development|' $TOMCAT/solr/development-core/core.properties
sudo sed -i 's|collection1|test|' $TOMCAT/solr/test-core/core.properties
sudo cp solr_conf/conf/* $TOMCAT/solr/development-core/
sudo cp solr_conf/conf/* $TOMCAT/solr/test-core/
sudo touch $TOMCAT/webapps/solr.war
# XXX solr errors because of icu fields, need ICU jars

# run the webserver
unicorn -D -p 3000
