#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_instance_id+x}" ];
  then params="${params} instance_id=\"${PT_instance_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_instance_display_name+x}" ];
  then params="${params} instance_display_name=\"${PT_instance_display_name}\""
fi

if [ ! -z "${PT_database_name+x}" ];
  then params="${params} database_name=\"${PT_database_name}\""
fi

if [ ! -z "${PT_configuration+x}" ];
  then params="${params} configuration=\"${PT_configuration}\""
fi

if [ ! -z "${PT_force_instance_delete+x}" ];
  then params="${params} force_instance_delete=\"${PT_force_instance_delete}\""
fi

if [ ! -z "${PT_node_count+x}" ];
  then params="${params} node_count=\"${PT_node_count}\""
fi

ansible localhost -m gcspanner --args "${params}" --one-line | cut -f2- -d">"