#!/bin/bash

# adduser www-data
# passwd www-data
# gpasswd -a www-data wheel

# 加载虚拟盘
# df -h 查看有没有加载
# cat /proc/partitions 看磁盘 对应ec2-> ebs ->volumes -> Attachment information
# 看看有没有加载 attach ,看到  /dev/sdb 就开始格式化。命令如下
# sudo mke2fs -F -t ext4 /dev/nvme1n1   系统在使用中。不会被格式化
# 如果您通过NVM Express端口（而不是传统的 SATA端口）连接磁盘，这是正常现象
lsblk -a
sudo fdisk -l
# 看新的 卷名字是什么，有时候很奇怪
# Disk /dev/xvdf: 25 GiB, 26843545600 bytes, 52428800 sectors
sudo mkdir /data
sudo mount /dev/nvme1n1  /data
df -h
# 自动加载 ebs 磁盘
sudo vim /etc/fstab
# 输入
/dev/nvme1n1                 /data                       ext4    defaults        0 0

# dev/sdf

sudo file -s /dev/nvme1n1
# sudo mkfs -t ext4 /dev/nvme1n1
sudo mount /dev/nvme2n1  /data2

# ssh prot
sudo vim /etc/ssh/sshd_config
firewall-cmd --zone=public --add-port=22/tcp --permanent
sudo systemctl reload sshd