#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_time_interval_days+x}" ];
  then params="${params} time_interval_days=\"${PT_time_interval_days}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_time_interval_minutes+x}" ];
  then params="${params} time_interval_minutes=\"${PT_time_interval_minutes}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_schedule_id+x}" ];
  then params="${params} schedule_id=\"${PT_schedule_id}\""
fi

if [ ! -z "${PT_time_interval_hours+x}" ];
  then params="${params} time_interval_hours=\"${PT_time_interval_hours}\""
fi

if [ ! -z "${PT_paused+x}" ];
  then params="${params} paused=\"${PT_paused}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_snapshot_name+x}" ];
  then params="${params} snapshot_name=\"${PT_snapshot_name}\""
fi

if [ ! -z "${PT_volumes+x}" ];
  then params="${params} volumes=\"${PT_volumes}\""
fi

if [ ! -z "${PT_starting_date+x}" ];
  then params="${params} starting_date=\"${PT_starting_date}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_recurring+x}" ];
  then params="${params} recurring=\"${PT_recurring}\""
fi

if [ ! -z "${PT_retention+x}" ];
  then params="${params} retention=\"${PT_retention}\""
fi

ansible localhost -m sf_snapshot_schedule_manager --args "${params}" --one-line | cut -f2- -d">"