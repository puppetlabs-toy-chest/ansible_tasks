#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_target_node+x}" ];
  then params="${params} target_node=\"${PT_target_node}\""
fi

if [ ! -z "${PT_config_dir+x}" ];
  then params="${params} config_dir=\"${PT_config_dir}\""
fi

if [ ! -z "${PT_wait_for_service+x}" ];
  then params="${params} wait_for_service=\"${PT_wait_for_service}\""
fi

if [ ! -z "${PT_http_conn+x}" ];
  then params="${params} http_conn=\"${PT_http_conn}\""
fi

if [ ! -z "${PT_wait_for_ring+x}" ];
  then params="${params} wait_for_ring=\"${PT_wait_for_ring}\""
fi

if [ ! -z "${PT_wait_for_handoffs+x}" ];
  then params="${params} wait_for_handoffs=\"${PT_wait_for_handoffs}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m riak --args "${params}" --one-line | cut -f2- -d">"