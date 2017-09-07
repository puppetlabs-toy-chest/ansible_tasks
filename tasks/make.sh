#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_chdir+x}" ];
  then params="${params} chdir=\"${PT_chdir}\""
fi

if [ ! -z "${PT_params+x}" ];
  then params="${params} params=\"${PT_params}\""
fi

if [ ! -z "${PT_target+x}" ];
  then params="${params} target=\"${PT_target}\""
fi

ansible localhost -m make --args "${params}" --one-line | cut -f2- -d">"