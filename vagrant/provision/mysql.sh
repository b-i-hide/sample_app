#!/usr/bin/env bash

echo "Installing MySQL and setting it up..."
yum -y remove mysql*
yum -y install http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
yum -y install mysql-community-server

systemctl start mysqld.service
systemctl enable mysqld.service
