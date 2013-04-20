Phonely vagrant setup
=======

Vagrant + berksfile + chef example for Phonely

Requirements
=============

* Build essentials on Linux and brew on OS X
* Virtual box with an Ubuntu basebox with a more recent Chef (included)
* Vagrant with Berkshelf plugin
* Git

Installation
============

## Check out this code

```bash
git clone git@github.com:drye/phonely.git
```

## Install Virtualbox

To install Virtualbox it's recommended that you download the latest version directly from the official [VirtualBox site](http://www.virtualbox.org)

## Install Vagrant and Berkshelf

Download and install [the appropriate Vagrant package for your OS](http://downloads.vagrantup.com).

In your terminal run the following to install Berkshelf in Vagrant:

```bash
vagrant plugin install berkshelf-vagrant
```

Starting up
===========

Change the directory into this project, then simply run:

```bash
vagrant up
```

To run chef scripts again at any time, just run:

```bash
vagrant provision
```
