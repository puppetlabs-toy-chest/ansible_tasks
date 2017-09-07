#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_newpassword+x}" ];
  then params="${params} newpassword=\"${PT_newpassword}\""
fi

if [ ! -z "${PT_key_filename+x}" ];
  then params="${params} key_filename=\"${PT_key_filename}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

ansible localhost -m panos_admpwd --args "${params}" --one-line | cut -f2- -d">"