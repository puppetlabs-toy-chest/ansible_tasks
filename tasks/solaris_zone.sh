#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_install_options+x}" ];
  then params="${params} install_options=\"${PT_install_options}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_sparse+x}" ];
  then params="${params} sparse=\"${PT_sparse}\""
fi

if [ ! -z "${PT_create_options+x}" ];
  then params="${params} create_options=\"${PT_create_options}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_root_password+x}" ];
  then params="${params} root_password=\"${PT_root_password}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_config+x}" ];
  then params="${params} config=\"${PT_config}\""
fi

if [ ! -z "${PT_attach_options+x}" ];
  then params="${params} attach_options=\"${PT_attach_options}\""
fi

ansible localhost -m solaris_zone --args "${params}" --one-line | cut -f2- -d">"