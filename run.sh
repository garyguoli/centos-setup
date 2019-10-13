#!/usr/bin/env bash
# CentOS install
# curl -fsSL https://get.docker.com -o get-docker.sh
# chmod -R +x *
# sh auto.sh
# sudo chown -R centos server-setup/


chmod -R +x *
work_dir=$(pwd)

cat << EOF
**************************************
*       Welcome to centOS 7 tools    *
*       Author: Gary Guo             *
*       Date: 2019/10/11             *
**************************************
EOF

function show_menus(){
cat << EOF
【System Environment】
[1] Initialization System environment.  
[2] Install GIT HTOP.
[3] Setup AWS
【Common Tools】
[4] Install Nginx
[5] Install Docker
[100] Show Menus.
[0] Exit.
EOF
}

show_menus
# while(($index!=0))
# do
  echo 'Please input index:'
  read index
  case  $index  in
    100 ) show_menus;;
    1 ) $filepath$work_dir/base/sys.sh;;
    2 ) $filepath$work_dir/base/software.sh;;
    3 ) $filepath$work_dir/base/awssetup.sh;;
    4 ) $filepath$work_dir/app/nginx.sh;;
    5 ) $filepath$work_dir/app/docker.sh;;
    * ) show_menus;;
  esac
# done

cat << EOF
+-------------------------------------------------+
|  Thank you for usesing!                         |
+-------------------------------------------------+
EOF