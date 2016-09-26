# hydra-vagrant

A Vagrant environment to quickly setup current [CurationConcerns](https://github.com/projecthydra/curation_concerns) or [Sufia](https://github.com/projecthydra/sufia) applications.

## Requirements

* [Vagrant](https://www.vagrantup.com/) version 1.8.5+
* [VirtualBox](https://www.virtualbox.org/)

## Setup

1. `git clone https://github.com/projecthydra-labs/hydra-vagrant.git`
2. `cd hydra-vagrant`
3. `vagrant up`

You can shell into the machine with `vagrant ssh` or `ssh -p 2222 vagrant@localhost`

## Using the App

* The Vagrant contains two demo apps:
  * CurationConcerns: `/home/vagrant/curation-concerns-demo`
  * Sufia: `/home/vagrant/sufia-demo`
* Once connected to the Vagrant VM, change into the app directory and run the demo.
  e.g., for CurationConcerns: `cd curation-concerns-demo; rake demo`
* Access the app at [http://localhost:3000](http://localhost:3000).
* To setup an initial user account:
  * Click "Log In" in the upper right, and then "Sign up" in the login form.
  * Enter your username and password, and click "Sign up" to create your account and sign in.
* Once signed in, you can create content by clicking the "+" button in the upper right.

## Environment

* Ubuntu 14.04 64-bit base machine
* [CurationConcerns](https://github.com/projecthydra/curation_concerns) or [Sufia](https://github.com/projecthydra/sufia): [http://localhost:3000](http://localhost:3000)
* [Solr 6.2.0](http://lucene.apache.org/solr/): [http://localhost:8983/solr/](http://localhost:8983/solr/)
* [Fedora 4.6.0](http://fedorarepository.org/): [http://localhost:8984/](http://localhost:8984/)

## Thanks

This VM is a modified version of the [Fedora 4 Vagrant](http://github.com/fcrepo4-exts/fcrepo4-vagrant), with borrowings from the [UCSD DAMS Vagrant](https://github.com/ucsdlib/dams-vagrant).
