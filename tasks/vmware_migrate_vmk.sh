#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_current_switch_name+x}" ];
  then params="${params} current_switch_name=\"${PT_current_switch_name}\""
fi

if [ ! -z "${PT_migrate_portgroup_name+x}" ];
  then params="${params} migrate_portgroup_name=\"${PT_migrate_portgroup_name}\""
fi

if [ ! -z "${PT_current_portgroup_name+x}" ];
  then params="${params} current_portgroup_name=\"${PT_current_portgroup_name}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_esxi_hostname+x}" ];
  then params="${params} esxi_hostname=\"${PT_esxi_hostname}\""
fi

if [ ! -z "${PT_device+x}" ];
  then params="${params} device=\"${PT_device}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_migrate_switch_name+x}" ];
  then params="${params} migrate_switch_name=\"${PT_migrate_switch_name}\""
fi

ansible localhost -m vmware_migrate_vmk --args "${params}" --one-line | cut -f2- -d">"