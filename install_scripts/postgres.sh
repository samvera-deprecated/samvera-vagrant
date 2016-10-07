#!/bin/sh

echo "Installing PostgreSQL database (requirement for Lerna)"

# Necessary PostgreSQL packages
PACKAGES="postgresql-common postgresql libpq-dev"
sudo apt-get -y install $PACKAGES

# As our vagrant box defaults to a user named 'ubuntu',
# we have to create a corresponding 'ubuntu' SUPERUSER in PostgreSQL
sudo -u postgres createuser ubuntu --superuser