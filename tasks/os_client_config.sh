#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_clouds+x}" ];
  then params="${params} clouds=\"${PT_clouds}\""
fi

ansible localhost -m os_client_config --args "${params}" --one-line | cut -f2- -d">"