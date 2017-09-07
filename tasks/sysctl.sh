#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_reload+x}" ];
  then params="${params} reload=\"${PT_reload}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_sysctl_set+x}" ];
  then params="${params} sysctl_set=\"${PT_sysctl_set}\""
fi

if [ ! -z "${PT_ignoreerrors+x}" ];
  then params="${params} ignoreerrors=\"${PT_ignoreerrors}\""
fi

if [ ! -z "${PT_sysctl_file+x}" ];
  then params="${params} sysctl_file=\"${PT_sysctl_file}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

ansible localhost -m sysctl --args "${params}" --one-line | cut -f2- -d">"