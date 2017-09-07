#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_alert_diskio_enabled+x}" ];
  then params="${params} alert_diskio_enabled=\"${PT_alert_diskio_enabled}\""
fi

if [ ! -z "${PT_additional_disks+x}" ];
  then params="${params} additional_disks=\"${PT_additional_disks}\""
fi

if [ ! -z "${PT_alert_bwin_enabled+x}" ];
  then params="${params} alert_bwin_enabled=\"${PT_alert_bwin_enabled}\""
fi

if [ ! -z "${PT_payment_term+x}" ];
  then params="${params} payment_term=\"${PT_payment_term}\""
fi

if [ ! -z "${PT_kernel_id+x}" ];
  then params="${params} kernel_id=\"${PT_kernel_id}\""
fi

if [ ! -z "${PT_alert_bwin_threshold+x}" ];
  then params="${params} alert_bwin_threshold=\"${PT_alert_bwin_threshold}\""
fi

if [ ! -z "${PT_alert_cpu_enabled+x}" ];
  then params="${params} alert_cpu_enabled=\"${PT_alert_cpu_enabled}\""
fi

if [ ! -z "${PT_alert_bwquota_enabled+x}" ];
  then params="${params} alert_bwquota_enabled=\"${PT_alert_bwquota_enabled}\""
fi

if [ ! -z "${PT_linode_id+x}" ];
  then params="${params} linode_id=\"${PT_linode_id}\""
fi

if [ ! -z "${PT_alert_diskio_threshold+x}" ];
  then params="${params} alert_diskio_threshold=\"${PT_alert_diskio_threshold}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_private_ip+x}" ];
  then params="${params} private_ip=\"${PT_private_ip}\""
fi

if [ ! -z "${PT_watchdog+x}" ];
  then params="${params} watchdog=\"${PT_watchdog}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_ssh_pub_key+x}" ];
  then params="${params} ssh_pub_key=\"${PT_ssh_pub_key}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_datacenter+x}" ];
  then params="${params} datacenter=\"${PT_datacenter}\""
fi

if [ ! -z "${PT_alert_bwquota_threshold+x}" ];
  then params="${params} alert_bwquota_threshold=\"${PT_alert_bwquota_threshold}\""
fi

if [ ! -z "${PT_backupweeklyday+x}" ];
  then params="${params} backupweeklyday=\"${PT_backupweeklyday}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_displaygroup+x}" ];
  then params="${params} displaygroup=\"${PT_displaygroup}\""
fi

if [ ! -z "${PT_alert_cpu_threshold+x}" ];
  then params="${params} alert_cpu_threshold=\"${PT_alert_cpu_threshold}\""
fi

if [ ! -z "${PT_alert_bwout_enabled+x}" ];
  then params="${params} alert_bwout_enabled=\"${PT_alert_bwout_enabled}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_swap+x}" ];
  then params="${params} swap=\"${PT_swap}\""
fi

if [ ! -z "${PT_alert_bwout_threshold+x}" ];
  then params="${params} alert_bwout_threshold=\"${PT_alert_bwout_threshold}\""
fi

if [ ! -z "${PT_distribution+x}" ];
  then params="${params} distribution=\"${PT_distribution}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_plan+x}" ];
  then params="${params} plan=\"${PT_plan}\""
fi

ansible localhost -m linode --args "${params}" --one-line | cut -f2- -d">"