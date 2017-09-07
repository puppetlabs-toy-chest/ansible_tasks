#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_mountpoint+x}" ];
  then params="${params} mountpoint=\"${PT_mountpoint}\""
fi

if [ ! -z "${PT_snapshot+x}" ];
  then params="${params} snapshot=\"${PT_snapshot}\""
fi

if [ ! -z "${PT_options+x}" ];
  then params="${params} options=\"${PT_options}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

ansible localhost -m beadm --args "${params}" --one-line | cut -f2- -d">"