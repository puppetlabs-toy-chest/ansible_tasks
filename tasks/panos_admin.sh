#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_role+x}" ];
  then params="${params} role=\"${PT_role}\""
fi

if [ ! -z "${PT_admin_password+x}" ];
  then params="${params} admin_password=\"${PT_admin_password}\""
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

if [ ! -z "${PT_admin_username+x}" ];
  then params="${params} admin_username=\"${PT_admin_username}\""
fi

ansible localhost -m panos_admin --args "${params}" --one-line | cut -f2- -d">"