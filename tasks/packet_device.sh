#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_count+x}" ];
  then params="${params} count=\"${PT_count}\""
fi

if [ ! -z "${PT_operating_system+x}" ];
  then params="${params} operating_system=\"${PT_operating_system}\""
fi

if [ ! -z "${PT_features+x}" ];
  then params="${params} features=\"${PT_features}\""
fi

if [ ! -z "${PT_facility+x}" ];
  then params="${params} facility=\"${PT_facility}\""
fi

if [ ! -z "${PT_lock+x}" ];
  then params="${params} lock=\"${PT_lock}\""
fi

if [ ! -z "${PT_auth_token+x}" ];
  then params="${params} auth_token=\"${PT_auth_token}\""
fi

if [ ! -z "${PT_device_ids+x}" ];
  then params="${params} device_ids=\"${PT_device_ids}\""
fi

if [ ! -z "${PT_count_offset+x}" ];
  then params="${params} count_offset=\"${PT_count_offset}\""
fi

if [ ! -z "${PT_user_data+x}" ];
  then params="${params} user_data=\"${PT_user_data}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_hostnames+x}" ];
  then params="${params} hostnames=\"${PT_hostnames}\""
fi

if [ ! -z "${PT_plan+x}" ];
  then params="${params} plan=\"${PT_plan}\""
fi

if [ ! -z "${PT_project_id+x}" ];
  then params="${params} project_id=\"${PT_project_id}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m packet_device --args "${params}" --one-line | cut -f2- -d">"