#!/bin/bash
 
time=$(date +"%F %T")
logname=notify_backup
logdir=/etc/keepalived/logs
mountdir=/dev/drbd0
resname=nfs
 
[ -d ${logdir} ] || mkdir -p $logdir
echo -e "$time ----${logname}----\n" >> $logdir/${logname}.log
systemctl stop nfs-server &>> $logdir/${logname}.log  ##停止nfs服务
umount /data &>> $logdir/${logname}.log  ##卸载
drbdadm secondary $resname &>> $logdir/${logname}.log  ##降级资源角色
echo -e "\n" >> $logdir/${logname}.log
bash /etc/keepalived/notify.sh backup
