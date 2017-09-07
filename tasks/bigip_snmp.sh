#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_agent_status_traps+x}" ];
  then params="${params} agent_status_traps=\"${PT_agent_status_traps}\""
fi

if [ ! -z "${PT_agent_authentication_traps+x}" ];
  then params="${params} agent_authentication_traps=\"${PT_agent_authentication_traps}\""
fi

if [ ! -z "${PT_device_warning_traps+x}" ];
  then params="${params} device_warning_traps=\"${PT_device_warning_traps}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_contact+x}" ];
  then params="${params} contact=\"${PT_contact}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

ansible localhost -m bigip_snmp --args "${params}" --one-line | cut -f2- -d">"