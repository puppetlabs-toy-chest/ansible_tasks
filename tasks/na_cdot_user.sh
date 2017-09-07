#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_authentication_method+x}" ];
  then params="${params} authentication_method=\"${PT_authentication_method}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_vserver+x}" ];
  then params="${params} vserver=\"${PT_vserver}\""
fi

if [ ! -z "${PT_application+x}" ];
  then params="${params} application=\"${PT_application}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_role_name+x}" ];
  then params="${params} role_name=\"${PT_role_name}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_set_password+x}" ];
  then params="${params} set_password=\"${PT_set_password}\""
fi

ansible localhost -m na_cdot_user --args "${params}" --one-line | cut -f2- -d">"