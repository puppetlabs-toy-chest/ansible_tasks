#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_portgroup_name+x}" ];
  then params="${params} portgroup_name=\"${PT_portgroup_name}\""
fi

if [ ! -z "${PT_portgroup_type+x}" ];
  then params="${params} portgroup_type=\"${PT_portgroup_type}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_num_ports+x}" ];
  then params="${params} num_ports=\"${PT_num_ports}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_switch_name+x}" ];
  then params="${params} switch_name=\"${PT_switch_name}\""
fi

if [ ! -z "${PT_vlan_id+x}" ];
  then params="${params} vlan_id=\"${PT_vlan_id}\""
fi

ansible localhost -m vmware_dvs_portgroup --args "${params}" --one-line | cut -f2- -d">"