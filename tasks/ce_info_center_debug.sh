#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_debug_enable+x}" ];
  then params="${params} debug_enable=\"${PT_debug_enable}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_debug_level+x}" ];
  then params="${params} debug_level=\"${PT_debug_level}\""
fi

if [ ! -z "${PT_channel_id+x}" ];
  then params="${params} channel_id=\"${PT_channel_id}\""
fi

if [ ! -z "${PT_module_name+x}" ];
  then params="${params} module_name=\"${PT_module_name}\""
fi

if [ ! -z "${PT_debug_time_stamp+x}" ];
  then params="${params} debug_time_stamp=\"${PT_debug_time_stamp}\""
fi

ansible localhost -m ce_info_center_debug --args "${params}" --one-line | cut -f2- -d">"