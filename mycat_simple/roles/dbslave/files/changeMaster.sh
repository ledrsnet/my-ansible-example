#!/bin/bash
#
#####################################################################
#
#Author:                LiangDong
#Email:                 395539184@qq.com
#Date:                  2021-05-27
#FileName：             roles/dbslave/files/changeMaster.sh
#URL:                   https://github.com/ledrsnet
#Description：          
#Copyright (C):         2021 All rights reserved
#
#####################################################################

logName=`echo $2|cut -d" " -f1`
logIndex=`echo $2|cut -d" " -f2`
mysql -uroot <<EOF
CHANGE MASTER TO MASTER_HOST="$1", MASTER_USER="repluser",MASTER_PASSWORD="123456",
MASTER_LOG_FILE="${logName}",MASTER_LOG_POS=${logIndex};
EOF
mysql -uroot -e 'start slave;'
