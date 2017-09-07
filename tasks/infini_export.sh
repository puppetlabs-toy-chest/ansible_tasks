#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_inner_path+x}" ];
  then params="${params} inner_path=\"${PT_inner_path}\""
fi

if [ ! -z "${PT_client_list+x}" ];
  then params="${params} client_list=\"${PT_client_list}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_system+x}" ];
  then params="${params} system=\"${PT_system}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_filesystem+x}" ];
  then params="${params} filesystem=\"${PT_filesystem}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

ansible localhost -m infini_export --args "${params}" --one-line | cut -f2- -d">"