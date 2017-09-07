#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_output+x}" ];
  then params="${params} output=\"${PT_output}\""
fi

if [ ! -z "${PT_rpc+x}" ];
  then params="${params} rpc=\"${PT_rpc}\""
fi

if [ ! -z "${PT_args+x}" ];
  then params="${params} args=\"${PT_args}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

ansible localhost -m junos_rpc --args "${params}" --one-line | cut -f2- -d">"