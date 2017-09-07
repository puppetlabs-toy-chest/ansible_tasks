#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_server_ip+x}" ];
  then params="${params} server_ip=\"${PT_server_ip}\""
fi

if [ ! -z "${PT_server_name+x}" ];
  then params="${params} server_name=\"${PT_server_name}\""
fi

if [ ! -z "${PT_server_ports+x}" ];
  then params="${params} server_ports=\"${PT_server_ports}\""
fi

if [ ! -z "${PT_server_status+x}" ];
  then params="${params} server_status=\"${PT_server_status}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_write_config+x}" ];
  then params="${params} write_config=\"${PT_write_config}\""
fi

if [ ! -z "${PT_operation+x}" ];
  then params="${params} operation=\"${PT_operation}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m a10_server_axapi3 --args "${params}" --one-line | cut -f2- -d">"