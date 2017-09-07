#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_pe_vid+x}" ];
  then params="${params} pe_vid=\"${PT_pe_vid}\""
fi

if [ ! -z "${PT_l2_sub_interface+x}" ];
  then params="${params} l2_sub_interface=\"${PT_l2_sub_interface}\""
fi

if [ ! -z "${PT_ce_vid+x}" ];
  then params="${params} ce_vid=\"${PT_ce_vid}\""
fi

if [ ! -z "${PT_encapsulation+x}" ];
  then params="${params} encapsulation=\"${PT_encapsulation}\""
fi

if [ ! -z "${PT_bind_vlan_id+x}" ];
  then params="${params} bind_vlan_id=\"${PT_bind_vlan_id}\""
fi

if [ ! -z "${PT_bridge_domain_id+x}" ];
  then params="${params} bridge_domain_id=\"${PT_bridge_domain_id}\""
fi

ansible localhost -m ce_vxlan_vap --args "${params}" --one-line | cut -f2- -d">"