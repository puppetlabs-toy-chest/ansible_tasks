#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_allow_duplicates+x}" ];
  then params="${params} allow_duplicates=\"${PT_allow_duplicates}\""
fi

if [ ! -z "${PT_tasks_from+x}" ];
  then params="${params} tasks_from=\"${PT_tasks_from}\""
fi

if [ ! -z "${PT_vars_from+x}" ];
  then params="${params} vars_from=\"${PT_vars_from}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_defaults_from+x}" ];
  then params="${params} defaults_from=\"${PT_defaults_from}\""
fi

if [ ! -z "${PT_private+x}" ];
  then params="${params} private=\"${PT_private}\""
fi

ansible localhost -m include_role --args "${params}" --one-line | cut -f2- -d">"