#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_access_token+x}" ];
  then params="${params} access_token=\"${PT_access_token}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_mac+x}" ];
  then params="${params} mac=\"${PT_mac}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_leaf_group+x}" ];
  then params="${params} leaf_group=\"${PT_leaf_group}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_fabric_role+x}" ];
  then params="${params} fabric_role=\"${PT_fabric_role}\""
fi

ansible localhost -m bcf_switch --args "${params}" --one-line | cut -f2- -d">"