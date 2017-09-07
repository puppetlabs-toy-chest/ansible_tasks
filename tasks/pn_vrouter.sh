#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pn_name+x}" ];
  then params="${params} pn_name=\"${PT_pn_name}\""
fi

if [ ! -z "${PT_pn_rip_redistribute+x}" ];
  then params="${params} pn_rip_redistribute=\"${PT_pn_rip_redistribute}\""
fi

if [ ! -z "${PT_pn_bgp_options+x}" ];
  then params="${params} pn_bgp_options=\"${PT_pn_bgp_options}\""
fi

if [ ! -z "${PT_pn_router_id+x}" ];
  then params="${params} pn_router_id=\"${PT_pn_router_id}\""
fi

if [ ! -z "${PT_pn_ospf_options+x}" ];
  then params="${params} pn_ospf_options=\"${PT_pn_ospf_options}\""
fi

if [ ! -z "${PT_pn_bgp_as+x}" ];
  then params="${params} pn_bgp_as=\"${PT_pn_bgp_as}\""
fi

if [ ! -z "${PT_pn_ospf_redistribute+x}" ];
  then params="${params} pn_ospf_redistribute=\"${PT_pn_ospf_redistribute}\""
fi

if [ ! -z "${PT_pn_clipassword+x}" ];
  then params="${params} pn_clipassword=\"${PT_pn_clipassword}\""
fi

if [ ! -z "${PT_pn_bgp_redistribute+x}" ];
  then params="${params} pn_bgp_redistribute=\"${PT_pn_bgp_redistribute}\""
fi

if [ ! -z "${PT_pn_router_type+x}" ];
  then params="${params} pn_router_type=\"${PT_pn_router_type}\""
fi

if [ ! -z "${PT_pn_hw_vrrp_id+x}" ];
  then params="${params} pn_hw_vrrp_id=\"${PT_pn_hw_vrrp_id}\""
fi

if [ ! -z "${PT_pn_vnet+x}" ];
  then params="${params} pn_vnet=\"${PT_pn_vnet}\""
fi

if [ ! -z "${PT_pn_cliusername+x}" ];
  then params="${params} pn_cliusername=\"${PT_pn_cliusername}\""
fi

if [ ! -z "${PT_pn_service_state+x}" ];
  then params="${params} pn_service_state=\"${PT_pn_service_state}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_pn_service_type+x}" ];
  then params="${params} pn_service_type=\"${PT_pn_service_type}\""
fi

if [ ! -z "${PT_pn_cliswitch+x}" ];
  then params="${params} pn_cliswitch=\"${PT_pn_cliswitch}\""
fi

if [ ! -z "${PT_pn_bgp_max_paths+x}" ];
  then params="${params} pn_bgp_max_paths=\"${PT_pn_bgp_max_paths}\""
fi

ansible localhost -m pn_vrouter --args "${params}" --one-line | cut -f2- -d">"