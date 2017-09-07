#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_global+x}" ];
  then params="${params} global=\"${PT_global}\""
fi

if [ ! -z "${PT_ignore_scripts+x}" ];
  then params="${params} ignore_scripts=\"${PT_ignore_scripts}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_production+x}" ];
  then params="${params} production=\"${PT_production}\""
fi

if [ ! -z "${PT_registry+x}" ];
  then params="${params} registry=\"${PT_registry}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

ansible localhost -m npm --args "${params}" --one-line | cut -f2- -d">"