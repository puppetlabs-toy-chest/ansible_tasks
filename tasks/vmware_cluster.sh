#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_enable_ha+x}" ];
  then params="${params} enable_ha=\"${PT_enable_ha}\""
fi

if [ ! -z "${PT_enable_vsan+x}" ];
  then params="${params} enable_vsan=\"${PT_enable_vsan}\""
fi

if [ ! -z "${PT_datacenter_name+x}" ];
  then params="${params} datacenter_name=\"${PT_datacenter_name}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_cluster_name+x}" ];
  then params="${params} cluster_name=\"${PT_cluster_name}\""
fi

if [ ! -z "${PT_enable_drs+x}" ];
  then params="${params} enable_drs=\"${PT_enable_drs}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m vmware_cluster --args "${params}" --one-line | cut -f2- -d">"