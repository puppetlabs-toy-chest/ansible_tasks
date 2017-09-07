#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pn_unknown_mcast_level+x}" ];
  then params="${params} pn_unknown_mcast_level=\"${PT_pn_unknown_mcast_level}\""
fi

if [ ! -z "${PT_pn_jumbo+x}" ];
  then params="${params} pn_jumbo=\"${PT_pn_jumbo}\""
fi

if [ ! -z "${PT_pn_name+x}" ];
  then params="${params} pn_name=\"${PT_pn_name}\""
fi

if [ ! -z "${PT_pn_lacp_fallback_timeout+x}" ];
  then params="${params} pn_lacp_fallback_timeout=\"${PT_pn_lacp_fallback_timeout}\""
fi

if [ ! -z "${PT_pn_unknown_ucast_level+x}" ];
  then params="${params} pn_unknown_ucast_level=\"${PT_pn_unknown_ucast_level}\""
fi

if [ ! -z "${PT_pn_lacp_timeout+x}" ];
  then params="${params} pn_lacp_timeout=\"${PT_pn_lacp_timeout}\""
fi

if [ ! -z "${PT_pn_loopback+x}" ];
  then params="${params} pn_loopback=\"${PT_pn_loopback}\""
fi

if [ ! -z "${PT_pn_speed+x}" ];
  then params="${params} pn_speed=\"${PT_pn_speed}\""
fi

if [ ! -z "${PT_pn_edge_switch+x}" ];
  then params="${params} pn_edge_switch=\"${PT_pn_edge_switch}\""
fi

if [ ! -z "${PT_pn_host+x}" ];
  then params="${params} pn_host=\"${PT_pn_host}\""
fi

if [ ! -z "${PT_pn_port_macaddr+x}" ];
  then params="${params} pn_port_macaddr=\"${PT_pn_port_macaddr}\""
fi

if [ ! -z "${PT_pn_lacp_fallback+x}" ];
  then params="${params} pn_lacp_fallback=\"${PT_pn_lacp_fallback}\""
fi

if [ ! -z "${PT_pn_routing+x}" ];
  then params="${params} pn_routing=\"${PT_pn_routing}\""
fi

if [ ! -z "${PT_pn_clipassword+x}" ];
  then params="${params} pn_clipassword=\"${PT_pn_clipassword}\""
fi

if [ ! -z "${PT_pn_mirror_receive+x}" ];
  then params="${params} pn_mirror_receive=\"${PT_pn_mirror_receive}\""
fi

if [ ! -z "${PT_pn_egress_rate_limit+x}" ];
  then params="${params} pn_egress_rate_limit=\"${PT_pn_egress_rate_limit}\""
fi

if [ ! -z "${PT_pn_cliusername+x}" ];
  then params="${params} pn_cliusername=\"${PT_pn_cliusername}\""
fi

if [ ! -z "${PT_pn_lacp_mode+x}" ];
  then params="${params} pn_lacp_mode=\"${PT_pn_lacp_mode}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_pn_ports+x}" ];
  then params="${params} pn_ports=\"${PT_pn_ports}\""
fi

if [ ! -z "${PT_pn_lacp_priority+x}" ];
  then params="${params} pn_lacp_priority=\"${PT_pn_lacp_priority}\""
fi

if [ ! -z "${PT_pn_broadcast_level+x}" ];
  then params="${params} pn_broadcast_level=\"${PT_pn_broadcast_level}\""
fi

if [ ! -z "${PT_pn_pause+x}" ];
  then params="${params} pn_pause=\"${PT_pn_pause}\""
fi

if [ ! -z "${PT_pn_cliswitch+x}" ];
  then params="${params} pn_cliswitch=\"${PT_pn_cliswitch}\""
fi

if [ ! -z "${PT_pn_loopvlans+x}" ];
  then params="${params} pn_loopvlans=\"${PT_pn_loopvlans}\""
fi

if [ ! -z "${PT_pn_description+x}" ];
  then params="${params} pn_description=\"${PT_pn_description}\""
fi

ansible localhost -m pn_trunk --args "${params}" --one-line | cut -f2- -d">"