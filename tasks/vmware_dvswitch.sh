#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_datacenter_name+x}" ];
  then params="${params} datacenter_name=\"${PT_datacenter_name}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_discovery_proto+x}" ];
  then params="${params} discovery_proto=\"${PT_discovery_proto}\""
fi

if [ ! -z "${PT_mtu+x}" ];
  then params="${params} mtu=\"${PT_mtu}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_discovery_operation+x}" ];
  then params="${params} discovery_operation=\"${PT_discovery_operation}\""
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

if [ ! -z "${PT_uplink_quantity+x}" ];
  then params="${params} uplink_quantity=\"${PT_uplink_quantity}\""
fi

ansible localhost -m vmware_dvswitch --args "${params}" --one-line | cut -f2- -d">"