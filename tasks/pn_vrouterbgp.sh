#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pn_max_prefix+x}" ];
  then params="${params} pn_max_prefix=\"${PT_pn_max_prefix}\""
fi

if [ ! -z "${PT_pn_route_mapout+x}" ];
  then params="${params} pn_route_mapout=\"${PT_pn_route_mapout}\""
fi

if [ ! -z "${PT_pn_neighbor+x}" ];
  then params="${params} pn_neighbor=\"${PT_pn_neighbor}\""
fi

if [ ! -z "${PT_pn_vrouter_name+x}" ];
  then params="${params} pn_vrouter_name=\"${PT_pn_vrouter_name}\""
fi

if [ ! -z "${PT_pn_override_capability+x}" ];
  then params="${params} pn_override_capability=\"${PT_pn_override_capability}\""
fi

if [ ! -z "${PT_pn_route_mapin+x}" ];
  then params="${params} pn_route_mapin=\"${PT_pn_route_mapin}\""
fi

if [ ! -z "${PT_pn_soft_reconfig+x}" ];
  then params="${params} pn_soft_reconfig=\"${PT_pn_soft_reconfig}\""
fi

if [ ! -z "${PT_pn_ebgp+x}" ];
  then params="${params} pn_ebgp=\"${PT_pn_ebgp}\""
fi

if [ ! -z "${PT_pn_prefix_listin+x}" ];
  then params="${params} pn_prefix_listin=\"${PT_pn_prefix_listin}\""
fi

if [ ! -z "${PT_pn_bfd+x}" ];
  then params="${params} pn_bfd=\"${PT_pn_bfd}\""
fi

if [ ! -z "${PT_pn_password+x}" ];
  then params="${params} pn_password=\"${PT_pn_password}\""
fi

if [ ! -z "${PT_pn_route_reflector+x}" ];
  then params="${params} pn_route_reflector=\"${PT_pn_route_reflector}\""
fi

if [ ! -z "${PT_pn_keepalive+x}" ];
  then params="${params} pn_keepalive=\"${PT_pn_keepalive}\""
fi

if [ ! -z "${PT_pn_max_prefix_warn+x}" ];
  then params="${params} pn_max_prefix_warn=\"${PT_pn_max_prefix_warn}\""
fi

if [ ! -z "${PT_pn_multiprotocol+x}" ];
  then params="${params} pn_multiprotocol=\"${PT_pn_multiprotocol}\""
fi

if [ ! -z "${PT_pn_clipassword+x}" ];
  then params="${params} pn_clipassword=\"${PT_pn_clipassword}\""
fi

if [ ! -z "${PT_pn_default_originate+x}" ];
  then params="${params} pn_default_originate=\"${PT_pn_default_originate}\""
fi

if [ ! -z "${PT_pn_cliusername+x}" ];
  then params="${params} pn_cliusername=\"${PT_pn_cliusername}\""
fi

if [ ! -z "${PT_pn_weight+x}" ];
  then params="${params} pn_weight=\"${PT_pn_weight}\""
fi

if [ ! -z "${PT_pn_prefix_listout+x}" ];
  then params="${params} pn_prefix_listout=\"${PT_pn_prefix_listout}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_pn_remote_as+x}" ];
  then params="${params} pn_remote_as=\"${PT_pn_remote_as}\""
fi

if [ ! -z "${PT_pn_cliswitch+x}" ];
  then params="${params} pn_cliswitch=\"${PT_pn_cliswitch}\""
fi

if [ ! -z "${PT_pn_holdtime+x}" ];
  then params="${params} pn_holdtime=\"${PT_pn_holdtime}\""
fi

if [ ! -z "${PT_pn_next_hop_self+x}" ];
  then params="${params} pn_next_hop_self=\"${PT_pn_next_hop_self}\""
fi

ansible localhost -m pn_vrouterbgp --args "${params}" --one-line | cut -f2- -d">"