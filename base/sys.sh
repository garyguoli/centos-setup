#!/bin/bash 

# setup time
timedatectl set-timezone Asia/Singapore

#disable selinux 
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config 

#tune kernel parametres
cat >> /etc/sysctl.conf << EOF
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_fin_timeout = 2
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.tcp_max_syn_backlog = 16384
net.core.netdev_max_backlog =  16384
net.core.somaxconn = 32768
net.core.wmem_default = 8388608
net.core.rmem_default = 8388608
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_timestamps = 0
net.ipv4.route.gc_timeout = 100
net.ipv4.tcp_synack_retries = 1
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_mem = 94500000 915000000 927000000
net.ipv4.tcp_max_orphans = 3276800
net.ipv4.ip_local_port_range = 2000  65535
net.ipv4.tcp_max_tw_buckets = 5000
vm.swappiness=10
EOF

#stop some crontab 
mkdir /etc/cron.daily.bak 
mv /etc/cron.daily/makewhatis.cron /etc/cron.daily.bak 
mv /etc/cron.daily/mlocate.cron /etc/cron.daily.bak 
chkconfig bluetooth off 
chkconfig cups off 
chkconfig ip6tables off 
chkconfig --level 35 iptables off
for sun in `chkconfig --list|grep 3:on|awk '{print $1}'`;do chkconfig --level 3 $sun off;done
for sun in crond rsyslog sshd network;do chkconfig --level 3 $sun on;done

#stop some crontab 
systemctl disable firewalld

#disable the ipv6 
cat > /etc/modprobe.d/ipv6.conf << EOF
alias net-pf-10 off 
options ipv6 disable=1
EOF

echo "NETWORKING_IPV6=off" >> /etc/sysconfig/network 


cat << EOF 
+-------------------------------------------------+
| optimizer is done | 
| its recommond to restart this server ! | 
+-------------------------------------------------+ 
EOF