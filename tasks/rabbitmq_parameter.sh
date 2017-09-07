#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_node+x}" ];
  then params="${params} node=\"${PT_node}\""
fi

if [ ! -z "${PT_vhost+x}" ];
  then params="${params} vhost=\"${PT_vhost}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_component+x}" ];
  then params="${params} component=\"${PT_component}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

ansible localhost -m rabbitmq_parameter --args "${params}" --one-line | cut -f2- -d">"