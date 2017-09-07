#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_node+x}" ];
  then params="${params} node=\"${PT_node}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_pattern+x}" ];
  then params="${params} pattern=\"${PT_pattern}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_vhost+x}" ];
  then params="${params} vhost=\"${PT_vhost}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_apply_to+x}" ];
  then params="${params} apply_to=\"${PT_apply_to}\""
fi

ansible localhost -m rabbitmq_policy --args "${params}" --one-line | cut -f2- -d">"