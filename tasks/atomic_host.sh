#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_revision+x}" ];
  then params="${params} revision=\"${PT_revision}\""
fi

ansible localhost -m atomic_host --args "${params}" --one-line | cut -f2- -d">"