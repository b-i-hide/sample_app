#!/usr/bin/env bash

echo "Installing Apache and setting it up..."
yum update
yum install -y apache2
rm -rf /var/www
ln -fs /develop/sample_app2 /var/www/

yum -y update kernel
yum -y install kernel-devel kernel-headers dkms gcc gcc-c++
yum -y install ruby-build

echo "Installing Git and setting it up..."
yum -y install git
