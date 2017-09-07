#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_clag_id+x}" ];
  then params="${params} clag_id=\"${PT_clag_id}\""
fi

if [ ! -z "${PT_lacp_rate+x}" ];
  then params="${params} lacp_rate=\"${PT_lacp_rate}\""
fi

if [ ! -z "${PT_xmit_hash_policy+x}" ];
  then params="${params} xmit_hash_policy=\"${PT_xmit_hash_policy}\""
fi

if [ ! -z "${PT_miimon+x}" ];
  then params="${params} miimon=\"${PT_miimon}\""
fi

if [ ! -z "${PT_mstpctl_portadminedge+x}" ];
  then params="${params} mstpctl_portadminedge=\"${PT_mstpctl_portadminedge}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_lacp_bypass_allow+x}" ];
  then params="${params} lacp_bypass_allow=\"${PT_lacp_bypass_allow}\""
fi

if [ ! -z "${PT_lacp_bypass_all_active+x}" ];
  then params="${params} lacp_bypass_all_active=\"${PT_lacp_bypass_all_active}\""
fi

if [ ! -z "${PT_virtual_mac+x}" ];
  then params="${params} virtual_mac=\"${PT_virtual_mac}\""
fi

if [ ! -z "${PT_min_links+x}" ];
  then params="${params} min_links=\"${PT_min_links}\""
fi

if [ ! -z "${PT_lacp_bypass_period+x}" ];
  then params="${params} lacp_bypass_period=\"${PT_lacp_bypass_period}\""
fi

if [ ! -z "${PT_alias_name+x}" ];
  then params="${params} alias_name=\"${PT_alias_name}\""
fi

if [ ! -z "${PT_lacp_bypass_priority+x}" ];
  then params="${params} lacp_bypass_priority=\"${PT_lacp_bypass_priority}\""
fi

if [ ! -z "${PT_addr_method+x}" ];
  then params="${params} addr_method=\"${PT_addr_method}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_mstpctl_bpduguard+x}" ];
  then params="${params} mstpctl_bpduguard=\"${PT_mstpctl_bpduguard}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_mtu+x}" ];
  then params="${params} mtu=\"${PT_mtu}\""
fi

if [ ! -z "${PT_pvid+x}" ];
  then params="${params} pvid=\"${PT_pvid}\""
fi

if [ ! -z "${PT_ipv4+x}" ];
  then params="${params} ipv4=\"${PT_ipv4}\""
fi

if [ ! -z "${PT_slaves+x}" ];
  then params="${params} slaves=\"${PT_slaves}\""
fi

if [ ! -z "${PT_ipv6+x}" ];
  then params="${params} ipv6=\"${PT_ipv6}\""
fi

if [ ! -z "${PT_vids+x}" ];
  then params="${params} vids=\"${PT_vids}\""
fi

if [ ! -z "${PT_mstpctl_portnetwork+x}" ];
  then params="${params} mstpctl_portnetwork=\"${PT_mstpctl_portnetwork}\""
fi

if [ ! -z "${PT_virtual_ip+x}" ];
  then params="${params} virtual_ip=\"${PT_virtual_ip}\""
fi

ansible localhost -m cl_bond --args "${params}" --one-line | cut -f2- -d">"