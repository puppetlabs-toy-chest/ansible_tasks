#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_free_form+x}" ];
  then params="${params} free_form=\"${PT_free_form}\""
fi

ansible localhost -m meta --args "${params}" --one-line | cut -f2- -d">"