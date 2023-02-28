#!/bin/bash
 
time=$(date +"%F %T")
logname=notify_master
logdir=/etc/keepalived/logs
mountdir=/dev/drbd0
resname=nfs
 
[ -d ${logdir} ] || mkdir -p $logdir
echo -e "$time ----${logname}----\n" >> $logdir/${logname}.log
drbdadm primary $resname &>> $logdir/${logname}.log  ##升级资源角色
mount $mountdir /data &>> $logdir/${logname}.log  ##将设备挂载到挂载点上
systemctl start nfs-server &>> $logdir/${logname}.log  ##启动nfs服务
echo -e "\n" >> $logdir/${logname}.log
bash /etc/keepalived/notify.sh master
