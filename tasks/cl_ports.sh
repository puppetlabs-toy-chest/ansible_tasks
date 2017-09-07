#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_speed_4_by_10g+x}" ];
  then params="${params} speed_4_by_10g=\"${PT_speed_4_by_10g}\""
fi

if [ ! -z "${PT_speed_10g+x}" ];
  then params="${params} speed_10g=\"${PT_speed_10g}\""
fi

if [ ! -z "${PT_speed_40g+x}" ];
  then params="${params} speed_40g=\"${PT_speed_40g}\""
fi

if [ ! -z "${PT_speed_40g_div_4+x}" ];
  then params="${params} speed_40g_div_4=\"${PT_speed_40g_div_4}\""
fi

ansible localhost -m cl_ports --args "${params}" --one-line | cut -f2- -d">"