#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_eth_trunk_id+x}" ];
  then params="${params} eth_trunk_id=\"${PT_eth_trunk_id}\""
fi

if [ ! -z "${PT_pseudo_priority+x}" ];
  then params="${params} pseudo_priority=\"${PT_pseudo_priority}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

if [ ! -z "${PT_priority_id+x}" ];
  then params="${params} priority_id=\"${PT_priority_id}\""
fi

if [ ! -z "${PT_vpn_instance_name+x}" ];
  then params="${params} vpn_instance_name=\"${PT_vpn_instance_name}\""
fi

if [ ! -z "${PT_peer_link_id+x}" ];
  then params="${params} peer_link_id=\"${PT_peer_link_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_dfs_group_id+x}" ];
  then params="${params} dfs_group_id=\"${PT_dfs_group_id}\""
fi

if [ ! -z "${PT_nickname+x}" ];
  then params="${params} nickname=\"${PT_nickname}\""
fi

if [ ! -z "${PT_pseudo_nickname+x}" ];
  then params="${params} pseudo_nickname=\"${PT_pseudo_nickname}\""
fi

ansible localhost -m ce_mlag_config --args "${params}" --one-line | cut -f2- -d">"