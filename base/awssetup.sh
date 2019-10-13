#!/bin/bash
#!/bin/bash

# adduser www-data
# passwd www-data
# gpasswd -a www-data wheel

# 加载虚拟盘
# df -h 查看有没有加载
# cat /proc/partitions 看磁盘 对应ec2-> ebs ->volumes -> Attachment information
# 看看有没有加载 attach ,看到  /dev/sdb 就开始格式化。命令如下
# sudo mke2fs -F -t ext4 /dev/xvdb    系统在使用中。不会被格式化

sudo fdisk -l
# 看新的 卷名字是什么，有时候很奇怪
# Disk /dev/xvdf: 25 GiB, 26843545600 bytes, 52428800 sectors
sudo mkdir /data
sudo mount /dev/xvdf /data
df -h
# 自动加载 ebs 磁盘
sudo vim /etc/fstab
# 输入
/dev/nvme0n1p1                  /data                       ext4    defaults        0 0

# dev/sdf