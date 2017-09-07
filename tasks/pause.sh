#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_seconds+x}" ];
  then params="${params} seconds=\"${PT_seconds}\""
fi

if [ ! -z "${PT_minutes+x}" ];
  then params="${params} minutes=\"${PT_minutes}\""
fi

if [ ! -z "${PT_prompt+x}" ];
  then params="${params} prompt=\"${PT_prompt}\""
fi

ansible localhost -m pause --args "${params}" --one-line | cut -f2- -d">"