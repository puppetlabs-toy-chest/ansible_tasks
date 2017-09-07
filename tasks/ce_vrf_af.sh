#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_vpn_target_type+x}" ];
  then params="${params} vpn_target_type=\"${PT_vpn_target_type}\""
fi

if [ ! -z "${PT_vpn_target_state+x}" ];
  then params="${params} vpn_target_state=\"${PT_vpn_target_state}\""
fi

if [ ! -z "${PT_vrf_aftype+x}" ];
  then params="${params} vrf_aftype=\"${PT_vrf_aftype}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_route_distinguisher+x}" ];
  then params="${params} route_distinguisher=\"${PT_route_distinguisher}\""
fi

if [ ! -z "${PT_vrf+x}" ];
  then params="${params} vrf=\"${PT_vrf}\""
fi

if [ ! -z "${PT_evpn+x}" ];
  then params="${params} evpn=\"${PT_evpn}\""
fi

if [ ! -z "${PT_vpn_target_value+x}" ];
  then params="${params} vpn_target_value=\"${PT_vpn_target_value}\""
fi

ansible localhost -m ce_vrf_af --args "${params}" --one-line | cut -f2- -d">"