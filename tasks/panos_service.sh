#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_service_name+x}" ];
  then params="${params} service_name=\"${PT_service_name}\""
fi

if [ ! -z "${PT_source_port+x}" ];
  then params="${params} source_port=\"${PT_source_port}\""
fi

if [ ! -z "${PT_commit+x}" ];
  then params="${params} commit=\"${PT_commit}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m panos_service --args "${params}" --one-line | cut -f2- -d">"