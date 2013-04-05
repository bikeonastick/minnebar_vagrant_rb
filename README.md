# License

This project is licensed under the Apache License, Version 2.0. See 
LICENSE-2.0.txt in this directory or 

http://www.apache.org/licenses/LICENSE-2.0.txt 

for a copy of the license. It is provided without warranty.

# Introduction

This code is provided as part of a set of open source projects used to
illustrate the use of virualization and automated/scripted configuration
within a software development organization. The initial presentation was
for Minnebar 8.

# Installation Instructions

1. Install VirtualBox on your Mac: 
   http://download.virtualbox.org/virtualbox/4.2.10/VirtualBox-4.2.10-84104-OSX.dmg
1. Install Vagrant on your Mac: 
   http://files.vagrantup.com/packages/64e360814c3ad960d810456add977fd4c7d47ce6/Vagrant.dmg
1. clone this repository
1. cd to the repository root
1. `git submodule init`
1. `git submodule update`
1. `vagrant up`
   wait for it...
1. `vagrant ssh`
1. `cd minnebar`
1. `bundle install`
1. `rackup`

# Manual Test Instructions
1. visit http://localhost:9092/save_hello/1/foo in your browser
1. visit http://localhost:9092/hello/1 in your browser

# Automated Test Instructions
1. bundle exec cucumber

# Credits

Written by Robert Tomb (@bikeonastick) on behalf of ReachLocal.



