#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_log_path+x}" ];
  then params="${params} log_path=\"${PT_log_path}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_category_names+x}" ];
  then params="${params} category_names=\"${PT_category_names}\""
fi

ansible localhost -m win_updates --args "${params}" --one-line | cut -f2- -d">"