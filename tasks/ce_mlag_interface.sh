#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_eth_trunk_id+x}" ];
  then params="${params} eth_trunk_id=\"${PT_eth_trunk_id}\""
fi

if [ ! -z "${PT_mlag_id+x}" ];
  then params="${params} mlag_id=\"${PT_mlag_id}\""
fi

if [ ! -z "${PT_mlag_error_down+x}" ];
  then params="${params} mlag_error_down=\"${PT_mlag_error_down}\""
fi

if [ ! -z "${PT_mlag_system_id+x}" ];
  then params="${params} mlag_system_id=\"${PT_mlag_system_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_dfs_group_id+x}" ];
  then params="${params} dfs_group_id=\"${PT_dfs_group_id}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_mlag_priority_id+x}" ];
  then params="${params} mlag_priority_id=\"${PT_mlag_priority_id}\""
fi

ansible localhost -m ce_mlag_interface --args "${params}" --one-line | cut -f2- -d">"