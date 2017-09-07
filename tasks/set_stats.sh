#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_aggregate+x}" ];
  then params="${params} aggregate=\"${PT_aggregate}\""
fi

if [ ! -z "${PT_data+x}" ];
  then params="${params} data=\"${PT_data}\""
fi

if [ ! -z "${PT_per_host+x}" ];
  then params="${params} per_host=\"${PT_per_host}\""
fi

ansible localhost -m set_stats --args "${params}" --one-line | cut -f2- -d">"