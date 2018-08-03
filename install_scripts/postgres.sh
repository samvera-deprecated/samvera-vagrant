#!/bin/sh

echo "Installing PostgreSQL database (requirement for Hyku)"

# Necessary PostgreSQL packages
PACKAGES="postgresql-common postgresql libpq-dev"
sudo apt-get -y install $PACKAGES

# As our vagrant box defaults to a user named 'vagrant',
# we have to create a corresponding 'vagrant' SUPERUSER in PostgreSQL
sudo -u postgres createuser vagrant --superuser
