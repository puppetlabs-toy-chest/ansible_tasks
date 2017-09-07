#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_as_number+x}" ];
  then params="${params} as_number=\"${PT_as_number}\""
fi

if [ ! -z "${PT_advertise_l2vpn_evpn+x}" ];
  then params="${params} advertise_l2vpn_evpn=\"${PT_advertise_l2vpn_evpn}\""
fi

if [ ! -z "${PT_advertise_router_type+x}" ];
  then params="${params} advertise_router_type=\"${PT_advertise_router_type}\""
fi

if [ ! -z "${PT_vpn_name+x}" ];
  then params="${params} vpn_name=\"${PT_vpn_name}\""
fi

if [ ! -z "${PT_peer_group_name+x}" ];
  then params="${params} peer_group_name=\"${PT_peer_group_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_bgp_instance+x}" ];
  then params="${params} bgp_instance=\"${PT_bgp_instance}\""
fi

if [ ! -z "${PT_peer_enable+x}" ];
  then params="${params} peer_enable=\"${PT_peer_enable}\""
fi

if [ ! -z "${PT_peer_address+x}" ];
  then params="${params} peer_address=\"${PT_peer_address}\""
fi

ansible localhost -m ce_evpn_bgp --args "${params}" --one-line | cut -f2- -d">"