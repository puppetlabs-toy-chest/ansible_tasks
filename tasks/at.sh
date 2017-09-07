#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_count+x}" ];
  then params="${params} count=\"${PT_count}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_units+x}" ];
  then params="${params} units=\"${PT_units}\""
fi

if [ ! -z "${PT_unique+x}" ];
  then params="${params} unique=\"${PT_unique}\""
fi

if [ ! -z "${PT_script_file+x}" ];
  then params="${params} script_file=\"${PT_script_file}\""
fi

ansible localhost -m at --args "${params}" --one-line | cut -f2- -d">"