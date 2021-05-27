#!/bin/bash
#
#####################################################################
#
#Author:                LiangDong
#Email:                 395539184@qq.com
#Date:                  2021-05-27
#FileName：             repluser.sh
#URL:                   https://github.com/ledrsnet
#Description：          
#Copyright (C):         2021 All rights reserved
#
#####################################################################

mysql -uroot -e "GRANT REPLICATION SLAVE ON *.* TO 'repluser'@'10.0.0.%' IDENTIFIED BY '123456';"
mysql -e "create database mycat;create database hellodb;"
mysql -uroot -e "GRANT ALL ON *.* TO 'root'@'10.0.0.%' IDENTIFIED BY '123456';flush privileges;"

