#!/usr/bin/env bash

echo "Installing Ruby and setting it up..."
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.bash_profile

echo "Installing Ruby with rbenv..."
sudo yum install -y openssl-devel readline-devel zlib-devel
rbenv install 2.3.1
rbenv rehash
rbenv global 2.3.1

echo "Installing Rails..."
gem install bundler
gem install rails
sudo yum -y install mysql-devel
gem install mysql2 -v '0.4.8'
