#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_addr_method+x}" ];
  then params="${params} addr_method=\"${PT_addr_method}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_virtual_ip+x}" ];
  then params="${params} virtual_ip=\"${PT_virtual_ip}\""
fi

if [ ! -z "${PT_vlan_aware+x}" ];
  then params="${params} vlan_aware=\"${PT_vlan_aware}\""
fi

if [ ! -z "${PT_mstpctl_treeprio+x}" ];
  then params="${params} mstpctl_treeprio=\"${PT_mstpctl_treeprio}\""
fi

if [ ! -z "${PT_virtual_mac+x}" ];
  then params="${params} virtual_mac=\"${PT_virtual_mac}\""
fi

if [ ! -z "${PT_mtu+x}" ];
  then params="${params} mtu=\"${PT_mtu}\""
fi

if [ ! -z "${PT_pvid+x}" ];
  then params="${params} pvid=\"${PT_pvid}\""
fi

if [ ! -z "${PT_stp+x}" ];
  then params="${params} stp=\"${PT_stp}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_ipv6+x}" ];
  then params="${params} ipv6=\"${PT_ipv6}\""
fi

if [ ! -z "${PT_vids+x}" ];
  then params="${params} vids=\"${PT_vids}\""
fi

if [ ! -z "${PT_alias_name+x}" ];
  then params="${params} alias_name=\"${PT_alias_name}\""
fi

if [ ! -z "${PT_ports+x}" ];
  then params="${params} ports=\"${PT_ports}\""
fi

if [ ! -z "${PT_ipv4+x}" ];
  then params="${params} ipv4=\"${PT_ipv4}\""
fi

ansible localhost -m cl_bridge --args "${params}" --one-line | cut -f2- -d">"