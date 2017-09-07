#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_policy_description+x}" ];
  then params="${params} policy_description=\"${PT_policy_description}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_access_token+x}" ];
  then params="${params} access_token=\"${PT_access_token}\""
fi

if [ ! -z "${PT_start_time+x}" ];
  then params="${params} start_time=\"${PT_start_time}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_duration+x}" ];
  then params="${params} duration=\"${PT_duration}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_delivery_packet_count+x}" ];
  then params="${params} delivery_packet_count=\"${PT_delivery_packet_count}\""
fi

ansible localhost -m bigmon_policy --args "${params}" --one-line | cut -f2- -d">"