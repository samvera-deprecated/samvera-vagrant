# curation-concerns-vagrant

## Requirements

* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

## Setup

1. `git clone https://github.com/escowles/curation-concerns-vagrant.git`
2. `cd curation-concerns-vagrant`
3. `vagrant up`

You can shell into the machine with `vagrant ssh` or `ssh -p 2222 vagrant@localhost`

## Using Curation Concerns

* A stock [Curation Concerns](https://github.com/projecthydra-labs/curation_concerns) app is running at [http://localhost:3000](http://localhost:3000).
* To setup an initial user account:
  * Click "Log In" in the upper right, and then "Sign up" in the login form.
  * Enter your username and password, and click "Sign up" to create your account.
* Once signed in, you can create content by clicking the "+" button in the upper right.

## Environment

* Ubuntu 14.04 64-bit base machine
* A stock [Curation Concerns](https://github.com/projecthydra-labs/curation_concerns) app: [http://localhost:3000](http://localhost:3000)
* [Tomcat 7](http://tomcat.apache.org):  [http://localhost:8080](http://localhost:8080) (manager username = "fedora4", password = "fedora4")
* [Fedora 4.x](http://fedora.info/about): [http://localhost:8080/fcrepo](http://localhost:8080/fcrepo)
* [Solr 4.10.3](http://lucene.apache.org/solr/): [http://localhost:8080/solr](http://localhost:8080/solr)

## Thanks

This VM is a modified version of the [Fedora 4 Vagrant](http://github.com/fcrepo4-exts/fcrepo4-vagrant), with borrowings from the [UCSD DAMS Vagrant](https://github.com/ucsdlib/dams-vagrant).
