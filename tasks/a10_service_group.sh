#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_service_group+x}" ];
  then params="${params} service_group=\"${PT_service_group}\""
fi

if [ ! -z "${PT_partition+x}" ];
  then params="${params} partition=\"${PT_partition}\""
fi

if [ ! -z "${PT_service_group_protocol+x}" ];
  then params="${params} service_group_protocol=\"${PT_service_group_protocol}\""
fi

if [ ! -z "${PT_servers+x}" ];
  then params="${params} servers=\"${PT_servers}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_write_config+x}" ];
  then params="${params} write_config=\"${PT_write_config}\""
fi

if [ ! -z "${PT_service_group_method+x}" ];
  then params="${params} service_group_method=\"${PT_service_group_method}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m a10_service_group --args "${params}" --one-line | cut -f2- -d">"