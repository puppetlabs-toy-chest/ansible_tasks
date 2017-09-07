#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_exclusive+x}" ];
  then params="${params} exclusive=\"${PT_exclusive}\""
fi

if [ ! -z "${PT_key_options+x}" ];
  then params="${params} key_options=\"${PT_key_options}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_manage_dir+x}" ];
  then params="${params} manage_dir=\"${PT_manage_dir}\""
fi

ansible localhost -m authorized_key --args "${params}" --one-line | cut -f2- -d">"