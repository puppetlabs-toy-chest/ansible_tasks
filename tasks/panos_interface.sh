#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_create_default_route+x}" ];
  then params="${params} create_default_route=\"${PT_create_default_route}\""
fi

if [ ! -z "${PT_zone_name+x}" ];
  then params="${params} zone_name=\"${PT_zone_name}\""
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

if [ ! -z "${PT_if_name+x}" ];
  then params="${params} if_name=\"${PT_if_name}\""
fi

ansible localhost -m panos_interface --args "${params}" --one-line | cut -f2- -d">"