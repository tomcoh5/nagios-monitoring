#!/bin/bash
mkdir /usr/local/nagios/etc/hosts
file="/usr/local/nagios/etc/hosts/cl1.cfg"
/bin/cat << EOM > $file
 Host configuration file
define host {
        use                          linux-server
        host_name                    cl1
        alias                        Ubuntu Host
        address                      172.25.10.100
        register                     1
}
define service {
      host_name                       cl1
      service_description             PING
      check_command                   check_ping!100.0,20%!500.0,60%
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       cl1
      service_description             Check Users
      check_command           check_local_users!20!50
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       cl1
      service_description             Local Disk
      check_command                   check_local_disk!20%!10%!/
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       cl1
      service_description             Check SSH
      check_command                   check_ssh
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       cl1
      service_description             Total Process
      check_command                   check_local_procs!250!400!RSZDT
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}
EOM
echo "cfg_file=/usr/local/nagios/etc/hosts/cl1.cfg" >> /usr/local/nagios/etc/nagios.cfg
systemctl restart nagios httpd
