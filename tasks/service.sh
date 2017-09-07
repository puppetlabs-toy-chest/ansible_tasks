#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_use+x}" ];
  then params="${params} use=\"${PT_use}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_pattern+x}" ];
  then params="${params} pattern=\"${PT_pattern}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_sleep+x}" ];
  then params="${params} sleep=\"${PT_sleep}\""
fi

if [ ! -z "${PT_arguments+x}" ];
  then params="${params} arguments=\"${PT_arguments}\""
fi

if [ ! -z "${PT_runlevel+x}" ];
  then params="${params} runlevel=\"${PT_runlevel}\""
fi

ansible localhost -m service --args "${params}" --one-line | cut -f2- -d">"