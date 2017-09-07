#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_new_only+x}" ];
  then params="${params} new_only=\"${PT_new_only}\""
fi

if [ ! -z "${PT_prefix+x}" ];
  then params="${params} prefix=\"${PT_prefix}\""
fi

if [ ! -z "${PT_names+x}" ];
  then params="${params} names=\"${PT_names}\""
fi

ansible localhost -m rabbitmq_plugin --args "${params}" --one-line | cut -f2- -d">"