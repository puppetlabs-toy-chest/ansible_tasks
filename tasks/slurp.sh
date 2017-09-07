#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

ansible localhost -m slurp --args "${params}" --one-line | cut -f2- -d">"