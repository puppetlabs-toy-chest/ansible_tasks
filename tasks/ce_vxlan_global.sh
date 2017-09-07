#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_nvo3_prevent_loops+x}" ];
  then params="${params} nvo3_prevent_loops=\"${PT_nvo3_prevent_loops}\""
fi

if [ ! -z "${PT_nvo3_eth_trunk_hash+x}" ];
  then params="${params} nvo3_eth_trunk_hash=\"${PT_nvo3_eth_trunk_hash}\""
fi

if [ ! -z "${PT_tunnel_mode_vxlan+x}" ];
  then params="${params} tunnel_mode_vxlan=\"${PT_tunnel_mode_vxlan}\""
fi

if [ ! -z "${PT_nvo3_acl_extend+x}" ];
  then params="${params} nvo3_acl_extend=\"${PT_nvo3_acl_extend}\""
fi

if [ ! -z "${PT_bridge_domain_id+x}" ];
  then params="${params} bridge_domain_id=\"${PT_bridge_domain_id}\""
fi

if [ ! -z "${PT_nvo3_gw_enhanced+x}" ];
  then params="${params} nvo3_gw_enhanced=\"${PT_nvo3_gw_enhanced}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_nvo3_ecmp_hash+x}" ];
  then params="${params} nvo3_ecmp_hash=\"${PT_nvo3_ecmp_hash}\""
fi

if [ ! -z "${PT_nvo3_service_extend+x}" ];
  then params="${params} nvo3_service_extend=\"${PT_nvo3_service_extend}\""
fi

ansible localhost -m ce_vxlan_global --args "${params}" --one-line | cut -f2- -d">"