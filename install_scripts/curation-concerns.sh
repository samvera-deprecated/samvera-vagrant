#!/bin/sh

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

if [ "$APP" != "sufia" -a "$APP" != "curation-concerns" ]; then
  echo "Unknown app: \"$APP\""
  exit 1
fi

echo "Creating app: $APP-demo"

# create app
rails new $APP-demo --skip-spring
cd $APP-demo

if [ "$APP" = "sufia" ]; then
  echo "gem 'sufia', '7.0.0.beta4'" >> Gemfile
  echo "gem 'unicorn-rails'" >> Gemfile
  bundle install --quiet
  rails generate sufia:install -f -q
  #rails generate sufia:work Work -q # TODO: uncomment this when next release > beta4 is out
elif [ "$APP" = "curation-concerns" ]; then
  echo "gem 'curation_concerns', github:'projecthydra-labs/curation_concerns', branch: 'master'" >> Gemfile
  bundle install --quiet
  rails generate curation_concerns:install -f
  rails generate curation_concerns:work Book
fi

rake db:migrate

# start fedora and solr
sudo cp $SHARED_DIR/install_scripts/fedora-solr /etc/init.d/
sudo update-rc.d fedora-solr start 90 2 3 4 5 .
sudo /etc/init.d/fedora-solr start
