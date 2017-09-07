#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_trap_time_stamp+x}" ];
  then params="${params} trap_time_stamp=\"${PT_trap_time_stamp}\""
fi

if [ ! -z "${PT_trap_buff_size+x}" ];
  then params="${params} trap_buff_size=\"${PT_trap_buff_size}\""
fi

if [ ! -z "${PT_channel_id+x}" ];
  then params="${params} channel_id=\"${PT_channel_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_trap_level+x}" ];
  then params="${params} trap_level=\"${PT_trap_level}\""
fi

if [ ! -z "${PT_trap_buff_enable+x}" ];
  then params="${params} trap_buff_enable=\"${PT_trap_buff_enable}\""
fi

if [ ! -z "${PT_module_name+x}" ];
  then params="${params} module_name=\"${PT_module_name}\""
fi

if [ ! -z "${PT_trap_enable+x}" ];
  then params="${params} trap_enable=\"${PT_trap_enable}\""
fi

ansible localhost -m ce_info_center_trap --args "${params}" --one-line | cut -f2- -d">"