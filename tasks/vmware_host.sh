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

if [ ! -z "${PT_esxi_password+x}" ];
  then params="${params} esxi_password=\"${PT_esxi_password}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_esxi_username+x}" ];
  then params="${params} esxi_username=\"${PT_esxi_username}\""
fi

if [ ! -z "${PT_cluster_name+x}" ];
  then params="${params} cluster_name=\"${PT_cluster_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_esxi_hostname+x}" ];
  then params="${params} esxi_hostname=\"${PT_esxi_hostname}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m vmware_host --args "${params}" --one-line | cut -f2- -d">"