#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_vni_id+x}" ];
  then params="${params} vni_id=\"${PT_vni_id}\""
fi

if [ ! -z "${PT_nve_mode+x}" ];
  then params="${params} nve_mode=\"${PT_nve_mode}\""
fi

if [ ! -z "${PT_source_ip+x}" ];
  then params="${params} source_ip=\"${PT_source_ip}\""
fi

if [ ! -z "${PT_bridge_domain_id+x}" ];
  then params="${params} bridge_domain_id=\"${PT_bridge_domain_id}\""
fi

if [ ! -z "${PT_peer_list_ip+x}" ];
  then params="${params} peer_list_ip=\"${PT_peer_list_ip}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_nve_name+x}" ];
  then params="${params} nve_name=\"${PT_nve_name}\""
fi

if [ ! -z "${PT_protocol_type+x}" ];
  then params="${params} protocol_type=\"${PT_protocol_type}\""
fi

ansible localhost -m ce_vxlan_tunnel --args "${params}" --one-line | cut -f2- -d">"