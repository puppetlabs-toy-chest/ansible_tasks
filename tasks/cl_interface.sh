#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_clagd_sys_mac+x}" ];
  then params="${params} clagd_sys_mac=\"${PT_clagd_sys_mac}\""
fi

if [ ! -z "${PT_ipv6+x}" ];
  then params="${params} ipv6=\"${PT_ipv6}\""
fi

if [ ! -z "${PT_virtual_mac+x}" ];
  then params="${params} virtual_mac=\"${PT_virtual_mac}\""
fi

if [ ! -z "${PT_alias_name+x}" ];
  then params="${params} alias_name=\"${PT_alias_name}\""
fi

if [ ! -z "${PT_mstpctl_portadminedge+x}" ];
  then params="${params} mstpctl_portadminedge=\"${PT_mstpctl_portadminedge}\""
fi

if [ ! -z "${PT_speed+x}" ];
  then params="${params} speed=\"${PT_speed}\""
fi

if [ ! -z "${PT_virtual_ip+x}" ];
  then params="${params} virtual_ip=\"${PT_virtual_ip}\""
fi

if [ ! -z "${PT_addr_method+x}" ];
  then params="${params} addr_method=\"${PT_addr_method}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_clagd_enable+x}" ];
  then params="${params} clagd_enable=\"${PT_clagd_enable}\""
fi

if [ ! -z "${PT_mstpctl_bpduguard+x}" ];
  then params="${params} mstpctl_bpduguard=\"${PT_mstpctl_bpduguard}\""
fi

if [ ! -z "${PT_clagd_priority+x}" ];
  then params="${params} clagd_priority=\"${PT_clagd_priority}\""
fi

if [ ! -z "${PT_mtu+x}" ];
  then params="${params} mtu=\"${PT_mtu}\""
fi

if [ ! -z "${PT_pvid+x}" ];
  then params="${params} pvid=\"${PT_pvid}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_clagd_peer_ip+x}" ];
  then params="${params} clagd_peer_ip=\"${PT_clagd_peer_ip}\""
fi

if [ ! -z "${PT_vids+x}" ];
  then params="${params} vids=\"${PT_vids}\""
fi

if [ ! -z "${PT_mstpctl_portnetwork+x}" ];
  then params="${params} mstpctl_portnetwork=\"${PT_mstpctl_portnetwork}\""
fi

if [ ! -z "${PT_ipv4+x}" ];
  then params="${params} ipv4=\"${PT_ipv4}\""
fi

ansible localhost -m cl_interface --args "${params}" --one-line | cut -f2- -d">"