# samvera-vagrant

A Vagrant environment to quickly setup current [Hyrax](http://hyr.ax/) or [Hyku](https://github.com/samvera-labs/hyku) applications.

## Requirements

* [Vagrant](https://www.vagrantup.com/) version 1.8.5+
* [VirtualBox](https://www.virtualbox.org/)

## Setup

1. `git clone https://github.com/samvera-labs/samvera-vagrant.git`
2. `cd samvera-vagrant`
3. `vagrant up`

You can shell into the machine with `vagrant ssh` or `ssh -p 2222 vagrant@localhost`

## Using the App

* The Vagrant contains two demo apps:
  * Hyrax: `/home/ubuntu/hyrax-demo`
  * Hyku: `/home/ubuntu/hyku-demo`
* Once connected to the Vagrant VM, change into the app directory and run the demo.
  e.g., for Hyrax: `cd hyrax-demo; bundle exec rake demo`
* Access the app at [http://localhost:3000](http://localhost:3000).
* To setup an initial user account in Hyrax:
  * Click "Log In" in the upper right, and then "Sign up" in the login form.
  * Enter your username and password, and click "Sign up" to create your account and sign in.
  * Once signed in, you can create content by clicking the "Share Your Work" button on the homepage.
* See the [Hyku documentation](https://wiki.duraspace.org/display/hyku/Hyku+Product+Beta+-+Frequently+Asked+Questions) for more on how to get started on Hyku

## Environment

* Ubuntu 16.04 64-bit base machine
* [Hyrax](https://github.com/samvera-labs/hyrax) or [Hyku](https://github.com/samvera-labs/hyku): [http://localhost:3000](http://localhost:3000)
* [Solr 6.6.0](http://lucene.apache.org/solr/): [http://localhost:8983/solr/](http://localhost:8983/solr/)
* [Fedora 4.7.1](http://fedorarepository.org/): [http://localhost:8984/](http://localhost:8984/)

## Thanks

This VM is a modified version of the [Fedora 4 Vagrant](http://github.com/fcrepo4-exts/fcrepo4-vagrant), with borrowings from the [UCSD DAMS Vagrant](https://github.com/ucsdlib/dams-vagrant).
