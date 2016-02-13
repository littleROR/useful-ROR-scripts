#!/bin/bash

#install rvm
echo "1. Install rvm"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | sudo bash
echo "done!"

echo "2. Installing ruby"
\curl -sSL https://get.rvm.io | sudo bash -s stable --ruby
echo "done!"

echo "3. Installing rails"
\curl -sSL https://get.rvm.io | sudo bash -s stable --rails
echo "done!"

echo "4. Appending RVM initialisation to .bashrc"
echo  'source /usr/local/rvm/scripts/rvm' >> ~/.bashrc
echo "done!"

 


