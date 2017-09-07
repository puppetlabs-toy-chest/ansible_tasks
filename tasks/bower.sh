#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_production+x}" ];
  then params="${params} production=\"${PT_production}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_relative_execpath+x}" ];
  then params="${params} relative_execpath=\"${PT_relative_execpath}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_offline+x}" ];
  then params="${params} offline=\"${PT_offline}\""
fi

ansible localhost -m bower --args "${params}" --one-line | cut -f2- -d">"