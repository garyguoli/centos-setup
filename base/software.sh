#!/bin/bash

rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh https://dl.iuscommunity.org/pub/ius/stable/CentOS/7/x86_64/ius-release-1.0-14.ius.centos7.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

yum -y install vim htop

# Install git 
rpm -Uvh https://centos7.iuscommunity.org/ius-release.rpm 
yum -y install git2u-all
git config --global user.name "Gary Guo"
git config --global user.email "gary@pkgweb.com"

yum -y update