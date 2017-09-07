#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pubkey+x}" ];
  then params="${params} pubkey=\"${PT_pubkey}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

ansible localhost -m github_key --args "${params}" --one-line | cut -f2- -d">"