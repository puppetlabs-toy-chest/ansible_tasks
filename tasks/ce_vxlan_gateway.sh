#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_dfs_source_vpn+x}" ];
  then params="${params} dfs_source_vpn=\"${PT_dfs_source_vpn}\""
fi

if [ ! -z "${PT_dfs_id+x}" ];
  then params="${params} dfs_id=\"${PT_dfs_id}\""
fi

if [ ! -z "${PT_arp_direct_route+x}" ];
  then params="${params} arp_direct_route=\"${PT_arp_direct_route}\""
fi

if [ ! -z "${PT_dfs_peer_vpn+x}" ];
  then params="${params} dfs_peer_vpn=\"${PT_dfs_peer_vpn}\""
fi

if [ ! -z "${PT_vbdif_name+x}" ];
  then params="${params} vbdif_name=\"${PT_vbdif_name}\""
fi

if [ ! -z "${PT_vpn_vni+x}" ];
  then params="${params} vpn_vni=\"${PT_vpn_vni}\""
fi

if [ ! -z "${PT_vbdif_mac+x}" ];
  then params="${params} vbdif_mac=\"${PT_vbdif_mac}\""
fi

if [ ! -z "${PT_vbdif_bind_vpn+x}" ];
  then params="${params} vbdif_bind_vpn=\"${PT_vbdif_bind_vpn}\""
fi

if [ ! -z "${PT_dfs_source_ip+x}" ];
  then params="${params} dfs_source_ip=\"${PT_dfs_source_ip}\""
fi

if [ ! -z "${PT_dfs_udp_port+x}" ];
  then params="${params} dfs_udp_port=\"${PT_dfs_udp_port}\""
fi

if [ ! -z "${PT_arp_distribute_gateway+x}" ];
  then params="${params} arp_distribute_gateway=\"${PT_arp_distribute_gateway}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_dfs_all_active+x}" ];
  then params="${params} dfs_all_active=\"${PT_dfs_all_active}\""
fi

if [ ! -z "${PT_vpn_instance+x}" ];
  then params="${params} vpn_instance=\"${PT_vpn_instance}\""
fi

if [ ! -z "${PT_dfs_peer_ip+x}" ];
  then params="${params} dfs_peer_ip=\"${PT_dfs_peer_ip}\""
fi

ansible localhost -m ce_vxlan_gateway --args "${params}" --one-line | cut -f2- -d">"