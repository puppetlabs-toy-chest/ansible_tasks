#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_local_user_description+x}" ];
  then params="${params} local_user_description=\"${PT_local_user_description}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_local_user_password+x}" ];
  then params="${params} local_user_password=\"${PT_local_user_password}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_local_user_name+x}" ];
  then params="${params} local_user_name=\"${PT_local_user_name}\""
fi

ansible localhost -m vmware_local_user_manager --args "${params}" --one-line | cut -f2- -d">"