#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_evn_bgp+x}" ];
  then params="${params} evn_bgp=\"${PT_evn_bgp}\""
fi

if [ ! -z "${PT_vbdif_name+x}" ];
  then params="${params} vbdif_name=\"${PT_vbdif_name}\""
fi

if [ ! -z "${PT_bridge_domain_id+x}" ];
  then params="${params} bridge_domain_id=\"${PT_bridge_domain_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_evn_server+x}" ];
  then params="${params} evn_server=\"${PT_evn_server}\""
fi

if [ ! -z "${PT_evn_peer_ip+x}" ];
  then params="${params} evn_peer_ip=\"${PT_evn_peer_ip}\""
fi

if [ ! -z "${PT_evn_source_ip+x}" ];
  then params="${params} evn_source_ip=\"${PT_evn_source_ip}\""
fi

if [ ! -z "${PT_arp_collect_host+x}" ];
  then params="${params} arp_collect_host=\"${PT_arp_collect_host}\""
fi

if [ ! -z "${PT_arp_suppress+x}" ];
  then params="${params} arp_suppress=\"${PT_arp_suppress}\""
fi

if [ ! -z "${PT_evn_reflect_client+x}" ];
  then params="${params} evn_reflect_client=\"${PT_evn_reflect_client}\""
fi

if [ ! -z "${PT_host_collect_protocol+x}" ];
  then params="${params} host_collect_protocol=\"${PT_host_collect_protocol}\""
fi

ansible localhost -m ce_vxlan_arp --args "${params}" --one-line | cut -f2- -d">"