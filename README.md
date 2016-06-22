# curation-concerns-vagrant

## Requirements

* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

## Setup

1. `git clone https://github.com/projecthydra-labs/curation-concerns-vagrant.git`
2. `cd curation-concerns-vagrant`
3. `vagrant up`

You can shell into the machine with `vagrant ssh` or `ssh -p 2222 vagrant@localhost`

## Using Curation Concerns

* A stock [CurationConcerns](https://github.com/projecthydra-labs/curation_concerns) app is built in the Vagrant in `/home/vagrant/curation-concerns-demo`
  * Once connected to the Vagrant VM, start with: `cd curation-concerns-demo; rails s -b 0.0.0.0`
* Access the app at [http://localhost:3000](http://localhost:3000).
* To setup an initial user account:
  * Click "Log In" in the upper right, and then "Sign up" in the login form.
  * Enter your username and password, and click "Sign up" to create your account and sign in.
* Once signed in, you can create content by clicking the "+" button in the upper right.

## Environment

* Ubuntu 14.04 64-bit base machine
* [CurationConcerns](https://github.com/projecthydra-labs/curation_concerns): [http://localhost:3000](http://localhost:3000)
* [Solr 5.4.1](http://lucene.apache.org/solr/): [http://localhost:8983/solr/](http://localhost:8983/solr/)
* [Fedora 4.5.0](http://fedorarepository.org/): [http://localhost:8984/](http://localhost:8984/)

## Thanks

This VM is a modified version of the [Fedora 4 Vagrant](http://github.com/fcrepo4-exts/fcrepo4-vagrant), with borrowings from the [UCSD DAMS Vagrant](https://github.com/ucsdlib/dams-vagrant).
