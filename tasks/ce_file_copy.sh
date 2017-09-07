#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_local_file+x}" ];
  then params="${params} local_file=\"${PT_local_file}\""
fi

if [ ! -z "${PT_remote_file+x}" ];
  then params="${params} remote_file=\"${PT_remote_file}\""
fi

if [ ! -z "${PT_file_system+x}" ];
  then params="${params} file_system=\"${PT_file_system}\""
fi

ansible localhost -m ce_file_copy --args "${params}" --one-line | cut -f2- -d">"