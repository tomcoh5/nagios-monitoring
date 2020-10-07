#1/bin/bash
yum install epel-release -y
yum install -y gcc glibc glibc-common openssl openssl-devel perl wget
firewall-cmd --permanent --add-port=5666/tcp
firewall-cmd --reload
systemctl enable nrpe.service
systemctl start  nrpe.service
echo "go to /etc/nagios/nrpe.cfg to 'allowed_hosts' and add your nagios core server "

