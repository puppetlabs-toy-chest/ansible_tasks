#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_cron_file+x}" ];
  then params="${params} cron_file=\"${PT_cron_file}\""
fi

if [ ! -z "${PT_month+x}" ];
  then params="${params} month=\"${PT_month}\""
fi

if [ ! -z "${PT_disabled+x}" ];
  then params="${params} disabled=\"${PT_disabled}\""
fi

if [ ! -z "${PT_job+x}" ];
  then params="${params} job=\"${PT_job}\""
fi

if [ ! -z "${PT_special_time+x}" ];
  then params="${params} special_time=\"${PT_special_time}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_insertafter+x}" ];
  then params="${params} insertafter=\"${PT_insertafter}\""
fi

if [ ! -z "${PT_insertbefore+x}" ];
  then params="${params} insertbefore=\"${PT_insertbefore}\""
fi

if [ ! -z "${PT_day+x}" ];
  then params="${params} day=\"${PT_day}\""
fi

if [ ! -z "${PT_minute+x}" ];
  then params="${params} minute=\"${PT_minute}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_hour+x}" ];
  then params="${params} hour=\"${PT_hour}\""
fi

if [ ! -z "${PT_reboot+x}" ];
  then params="${params} reboot=\"${PT_reboot}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_weekday+x}" ];
  then params="${params} weekday=\"${PT_weekday}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_backup+x}" ];
  then params="${params} backup=\"${PT_backup}\""
fi

ansible localhost -m cron --args "${params}" --one-line | cut -f2- -d">"