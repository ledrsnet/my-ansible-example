1. 安装ansible
yum install -y epel-release
yum install -y ansible
apt install -y ansible
2. 各节点root ssh免密
3. 配置ansible
- 配置ansible.cfg指定inventory文件路径
- 配置hosts，修改主机
- 修改group_vars/all参数
4. ansible playbook 目前角色
   system-init
   drbd
   nfs-common
   nfs-server
   keepalived
   #k8S role
   #gpu/nvidia-container-runtime role
   #idp role
   #haproxy role
   #dns role
