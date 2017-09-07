#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_data+x}" ];
  then params="${params} data=\"${PT_data}\""
fi

ansible localhost -m win_ping --args "${params}" --one-line | cut -f2- -d">"