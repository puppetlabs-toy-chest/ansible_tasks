#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_runlevel+x}" ];
  then params="${params} runlevel=\"${PT_runlevel}\""
fi

if [ ! -z "${PT_insertafter+x}" ];
  then params="${params} insertafter=\"${PT_insertafter}\""
fi

ansible localhost -m aix_inittab --args "${params}" --one-line | cut -f2- -d">"