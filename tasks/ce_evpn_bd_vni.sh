#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_vpn_target_export+x}" ];
  then params="${params} vpn_target_export=\"${PT_vpn_target_export}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_route_distinguisher+x}" ];
  then params="${params} route_distinguisher=\"${PT_route_distinguisher}\""
fi

if [ ! -z "${PT_vpn_target_both+x}" ];
  then params="${params} vpn_target_both=\"${PT_vpn_target_both}\""
fi

if [ ! -z "${PT_evpn+x}" ];
  then params="${params} evpn=\"${PT_evpn}\""
fi

if [ ! -z "${PT_vpn_target_import+x}" ];
  then params="${params} vpn_target_import=\"${PT_vpn_target_import}\""
fi

if [ ! -z "${PT_bridge_domain_id+x}" ];
  then params="${params} bridge_domain_id=\"${PT_bridge_domain_id}\""
fi

ansible localhost -m ce_evpn_bd_vni --args "${params}" --one-line | cut -f2- -d">"