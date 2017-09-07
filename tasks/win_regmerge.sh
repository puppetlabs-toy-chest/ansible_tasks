#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_compare_key+x}" ];
  then params="${params} compare_key=\"${PT_compare_key}\""
fi

ansible localhost -m win_regmerge --args "${params}" --one-line | cut -f2- -d">"