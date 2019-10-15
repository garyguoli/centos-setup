#!/bin/bash

# sudo vi /etc/yum.repos.d/nginx.repo

# python -c 'import yum, pprint; yb = yum.YumBase(); pprint.pprint(yb.conf.yumvar, width=1)'
rm -fr /etc/yum.repos.d/nginx.repo
echo Installing Nginx official repositories...
platform=`uname -i`
cat >> /etc/yum.repos.d/nginx.repo << EOF
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$platform/
gpgcheck=0
enabled=1
EOF
sudo yum update -y
sudo yum -y install nginx

sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx