#!/bin/bash

# sudo vi /etc/yum.repos.d/nginx.repo


echo Installing Nginx official repositories...
cat >> /etc/yum.repos.d/nginx.repo << EOF
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
EOF

sudo yum -y install nginx

sudo systemctl status nginx
sudo systemctl enable nginx
sudo systemctl start nginx