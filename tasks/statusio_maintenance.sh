#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_maintenance_notify_72_hr+x}" ];
  then params="${params} maintenance_notify_72_hr=\"${PT_maintenance_notify_72_hr}\""
fi

if [ ! -z "${PT_maintenance_notify_now+x}" ];
  then params="${params} maintenance_notify_now=\"${PT_maintenance_notify_now}\""
fi

if [ ! -z "${PT_start_time+x}" ];
  then params="${params} start_time=\"${PT_start_time}\""
fi

if [ ! -z "${PT_api_id+x}" ];
  then params="${params} api_id=\"${PT_api_id}\""
fi

if [ ! -z "${PT_automation+x}" ];
  then params="${params} automation=\"${PT_automation}\""
fi

if [ ! -z "${PT_maintenance_notify_24_hr+x}" ];
  then params="${params} maintenance_notify_24_hr=\"${PT_maintenance_notify_24_hr}\""
fi

if [ ! -z "${PT_all_infrastructure_affected+x}" ];
  then params="${params} all_infrastructure_affected=\"${PT_all_infrastructure_affected}\""
fi

if [ ! -z "${PT_maintenance_id+x}" ];
  then params="${params} maintenance_id=\"${PT_maintenance_id}\""
fi

if [ ! -z "${PT_desc+x}" ];
  then params="${params} desc=\"${PT_desc}\""
fi

if [ ! -z "${PT_maintenance_notify_1_hr+x}" ];
  then params="${params} maintenance_notify_1_hr=\"${PT_maintenance_notify_1_hr}\""
fi

if [ ! -z "${PT_title+x}" ];
  then params="${params} title=\"${PT_title}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_components+x}" ];
  then params="${params} components=\"${PT_components}\""
fi

if [ ! -z "${PT_statuspage+x}" ];
  then params="${params} statuspage=\"${PT_statuspage}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_minutes+x}" ];
  then params="${params} minutes=\"${PT_minutes}\""
fi

if [ ! -z "${PT_start_date+x}" ];
  then params="${params} start_date=\"${PT_start_date}\""
fi

if [ ! -z "${PT_containers+x}" ];
  then params="${params} containers=\"${PT_containers}\""
fi

ansible localhost -m statusio_maintenance --args "${params}" --one-line | cut -f2- -d">"