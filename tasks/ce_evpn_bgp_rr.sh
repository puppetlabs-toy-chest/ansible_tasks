#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_as_number+x}" ];
  then params="${params} as_number=\"${PT_as_number}\""
fi

if [ ! -z "${PT_bgp_instance+x}" ];
  then params="${params} bgp_instance=\"${PT_bgp_instance}\""
fi

if [ ! -z "${PT_reflect_client+x}" ];
  then params="${params} reflect_client=\"${PT_reflect_client}\""
fi

if [ ! -z "${PT_peer+x}" ];
  then params="${params} peer=\"${PT_peer}\""
fi

if [ ! -z "${PT_bgp_evpn_enable+x}" ];
  then params="${params} bgp_evpn_enable=\"${PT_bgp_evpn_enable}\""
fi

if [ ! -z "${PT_policy_vpn_target+x}" ];
  then params="${params} policy_vpn_target=\"${PT_policy_vpn_target}\""
fi

if [ ! -z "${PT_peer_type+x}" ];
  then params="${params} peer_type=\"${PT_peer_type}\""
fi

ansible localhost -m ce_evpn_bgp_rr --args "${params}" --one-line | cut -f2- -d">"