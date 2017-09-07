#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_delay+x}" ];
  then params="${params} delay=\"${PT_delay}\""
fi

if [ ! -z "${PT_sleep+x}" ];
  then params="${params} sleep=\"${PT_sleep}\""
fi

if [ ! -z "${PT_connect_timeout+x}" ];
  then params="${params} connect_timeout=\"${PT_connect_timeout}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

ansible localhost -m wait_for_connection --args "${params}" --one-line | cut -f2- -d">"