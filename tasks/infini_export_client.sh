#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_no_root_squash+x}" ];
  then params="${params} no_root_squash=\"${PT_no_root_squash}\""
fi

if [ ! -z "${PT_access_mode+x}" ];
  then params="${params} access_mode=\"${PT_access_mode}\""
fi

if [ ! -z "${PT_system+x}" ];
  then params="${params} system=\"${PT_system}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_client+x}" ];
  then params="${params} client=\"${PT_client}\""
fi

if [ ! -z "${PT_export+x}" ];
  then params="${params} export=\"${PT_export}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

ansible localhost -m infini_export_client --args "${params}" --one-line | cut -f2- -d">"