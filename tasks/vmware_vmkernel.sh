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

if [ ! -z "${PT_vland_id+x}" ];
  then params="${params} vland_id=\"${PT_vland_id}\""
fi

if [ ! -z "${PT_enable_vmotion+x}" ];
  then params="${params} enable_vmotion=\"${PT_enable_vmotion}\""
fi

if [ ! -z "${PT_vswitch_name+x}" ];
  then params="${params} vswitch_name=\"${PT_vswitch_name}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

if [ ! -z "${PT_enable_mgmt+x}" ];
  then params="${params} enable_mgmt=\"${PT_enable_mgmt}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_mtu+x}" ];
  then params="${params} mtu=\"${PT_mtu}\""
fi

if [ ! -z "${PT_subnet_mask+x}" ];
  then params="${params} subnet_mask=\"${PT_subnet_mask}\""
fi

if [ ! -z "${PT_enable_vsan+x}" ];
  then params="${params} enable_vsan=\"${PT_enable_vsan}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_enable_ft+x}" ];
  then params="${params} enable_ft=\"${PT_enable_ft}\""
fi

ansible localhost -m vmware_vmkernel --args "${params}" --one-line | cut -f2- -d">"